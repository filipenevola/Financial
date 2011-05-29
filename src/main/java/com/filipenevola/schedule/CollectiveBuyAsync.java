package com.filipenevola.schedule;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

import com.filipenevola.dao.CollectiveBuyDAO;
import com.filipenevola.dao.UserDAO;
import com.filipenevola.model.CollectiveBuy;
import com.filipenevola.model.Users;
import com.filipenevola.service.EmailService;
import com.filipenevola.util.Util;

@Component
public class CollectiveBuyAsync {
	private static Logger LOG = Logger.getLogger(CollectiveBuyAsync.class);

	@Autowired
	private UserDAO userDAO;
	@Autowired
	private EmailService emailService;
	@Autowired
	private CollectiveBuyDAO collectiveBuyDAO;
	@Autowired
	private Util util;

	@Async
	public void checkNearTheEnd() {

		List<Users> users = userDAO.getUsers();
		for (Users user : users) {
			checkNearTheEnd(user);
		}

	}

	public void checkNearTheEnd(Users user) {
		List<CollectiveBuy> list = collectiveBuyDAO
				.getCollectiveBuysToCheckNearEnd(user);

		if (list != null && !list.isEmpty()) {
			for (CollectiveBuy cb : list) {
				// check
				LOG.info("Checking if collective buy " + cb.getName()
						+ " is near the end");
				if (!cb.getUsed() && !cb.getAlerted() && isNearTheEnd(cb)) {
					if (cb.getUsers().getEmail() != null
							&& cb.getUsers().getEmail().length() > 0) {
						emailService.sendCollectiveBuy(cb);
						cb.setAlerted(Boolean.TRUE);
						collectiveBuyDAO.updateCollectiveBuy(cb);
					}
				}
			}
		}
	}

	public boolean isNearTheEnd(CollectiveBuy cb) {
		if (cb.getEndDate() == null || cb.getEndDate().length() <= 0) {
			return false;
		}
		Date end = Util.getDate(cb.getEndDate());
		int dias = util.diferencaEmDias(Calendar.getInstance().getTime(), end);
		if (dias >= 0 && dias < 7) {
			return true;
		}
		return false;
	}

}
