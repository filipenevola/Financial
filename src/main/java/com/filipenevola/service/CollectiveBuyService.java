package com.filipenevola.service;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;

import com.filipenevola.dao.CollectiveBuyDAO;
import com.filipenevola.dao.UserDAO;
import com.filipenevola.model.CollectiveBuy;
import com.filipenevola.model.Users;
import com.filipenevola.util.Util;

/**
 * CollectiveBuy Business Delegate
 * 
 * @author Filipe Névola
 */
public class CollectiveBuyService {
	private static Logger LOG = Logger.getLogger(CollectiveBuyService.class);

	private CollectiveBuyDAO collectiveBuyDAO;
	private UserDAO userDAO;
	private EmailService emailService;
	private Util util;

	public List<CollectiveBuy> getCollectiveBuyList(Users user, Integer start,
			Integer pageSize) {
		LOG.info("getCollectiveBuyList");
		return collectiveBuyDAO.getCollectiveBuys(user, start, pageSize);
	}

	public Integer getTotalCollectiveBuy(Users user) {
		return collectiveBuyDAO.getTotalCollectiveBuy(user);
	}

	public List<CollectiveBuy> create(Object data, Users user)
			throws ParseException {

		List<CollectiveBuy> newCollectiveBuys = new ArrayList<CollectiveBuy>();

		List<CollectiveBuy> list = util.getCollectiveBuysFromRequest(data);

		for (CollectiveBuy collectiveBuy : list) {
			collectiveBuy.setUsers(user);
			newCollectiveBuys.add(collectiveBuyDAO
					.addCollectiveBuy(collectiveBuy));

		}

		return newCollectiveBuys;
	}

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

	public void createFromForm(CollectiveBuy collectiveBuy)
			throws ParseException {
		collectiveBuyDAO.addCollectiveBuy(collectiveBuy);
	}

	public List<CollectiveBuy> update(Object data, Users user)
			throws ParseException {

		List<CollectiveBuy> returnCollectiveBuys = new ArrayList<CollectiveBuy>();

		List<CollectiveBuy> updatedCollectiveBuys = util
				.getCollectiveBuysFromRequest(data);

		for (CollectiveBuy collectiveBuy : updatedCollectiveBuys) {
			collectiveBuy.setUsers(user);
			returnCollectiveBuys.add(collectiveBuyDAO
					.updateCollectiveBuy(collectiveBuy));
		}

		return returnCollectiveBuys;
	}

	public void delete(Object data) {

		// it is an array - have to cast to array object
		if (data.toString().indexOf('[') > -1) {

			List<Integer> deleteCollectiveBuys = util.getListIdFromJSON(data);

			for (Integer id : deleteCollectiveBuys) {
				CollectiveBuy collectiveBuy = new CollectiveBuy();
				collectiveBuy.setId(id);
				collectiveBuyDAO.deleteCollectiveBuy(id);
			}

		} else { // it is only one object - cast to object/bean

			Integer id = Integer.parseInt(data.toString());

			CollectiveBuy collectiveBuy = new CollectiveBuy();
			collectiveBuy.setId(id);
			collectiveBuyDAO.deleteCollectiveBuy(id);
		}
	}

	public void setCollectiveBuyDAO(CollectiveBuyDAO collectiveBuyDAO) {
		this.collectiveBuyDAO = collectiveBuyDAO;
	}

	public void setEmailService(EmailService emailService) {
		this.emailService = emailService;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	public void setUtil(Util util) {
		this.util = util;
	}

}
