package com.filipenevola.service;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.filipenevola.dao.CollectiveBuyDAO;
import com.filipenevola.model.CollectiveBuy;
import com.filipenevola.model.Users;
import com.filipenevola.util.Util;

/** 
 * @author Filipe Névola
 */
@Service
public class CollectiveBuyService {
	private static Logger LOG = Logger.getLogger(CollectiveBuyService.class);

	@Autowired
	private CollectiveBuyDAO collectiveBuyDAO;
	@Autowired
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

}
