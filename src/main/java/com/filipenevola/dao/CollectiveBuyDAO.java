package com.filipenevola.dao;

import java.text.ParseException;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.filipenevola.model.CollectiveBuy;
import com.filipenevola.model.Users;
import com.filipenevola.util.Util;

/**
 * @author Filipe Névola
 */
@Repository
public class CollectiveBuyDAO {
	private static Logger LOG = Logger.getLogger(CollectiveBuyDAO.class);

	@Autowired
	private Util util;

	@Autowired
	private DAO dao;

	public CollectiveBuyDAO() {
	}

	@SuppressWarnings("unchecked")
	public List<CollectiveBuy> getCollectiveBuys(Users user, Integer start,
			Integer pageSize) {
		List<CollectiveBuy> list = null;

		list = dao
				.selectByQueryListPaging(
						"FROM CollectiveBuy c WHERE c.users = ?1 ORDER BY c.endDate ASC",
						start, pageSize, user);

		return list;
	}

	@SuppressWarnings("unchecked")
	public List<CollectiveBuy> getAllCollectiveBuys(Users user) {
		List<CollectiveBuy> list = null;

		list = dao
				.selectByQueryList(
						"FROM CollectiveBuy c WHERE c.users = ?1 ORDER BY c.endDate ASC",
						user);

		return list;
	}
	@SuppressWarnings("unchecked")
	public List<CollectiveBuy> getCollectiveBuysToCheckNearEnd(Users user) {
		
		List<CollectiveBuy> list = null;

		list = dao
				.selectByQueryList(
						"FROM CollectiveBuy c WHERE c.users = ?1 AND c.alerted = false AND c.used = false ORDER BY c.endDate ASC",
						user);

		return list;
	}

	public CollectiveBuy getCollectiveBuy(CollectiveBuy collectiveBuy) {
		return (CollectiveBuy) dao.selectById(collectiveBuy);
	}

	public Integer getTotalCollectiveBuy(Users user) {
		Long llong = null;

		llong = dao.count("CollectiveBuy", "o.users = ?1", user);

		LOG.info("getTotalCollectiveBuy - total: " + llong.intValue());
		return llong.intValue();
	}

	public void deleteCollectiveBuy(int id) {
		CollectiveBuy collectiveBuy = findCollectiveBuy(id);
		dao.remove(collectiveBuy);
	}

	public CollectiveBuy addCollectiveBuy(CollectiveBuy newCollectiveBuy)
			throws ParseException {
		formatDates(newCollectiveBuy);
		dao.insert(newCollectiveBuy);
		return newCollectiveBuy;
	}

	public CollectiveBuy updateCollectiveBuy(CollectiveBuy updatedCollectiveBuy)
	 {
		formatDates(updatedCollectiveBuy);
		updatedCollectiveBuy = (CollectiveBuy) dao.update(updatedCollectiveBuy);
		return updatedCollectiveBuy;
	}

	private void formatDates(CollectiveBuy newCollectiveBuy)
 {
		newCollectiveBuy.setDateOfBuy(util.getFormatedString(newCollectiveBuy
				.getDateOfBuy()));
		newCollectiveBuy.setStartDate(util.getFormatedString(newCollectiveBuy
				.getStartDate()));
		newCollectiveBuy.setEndDate(util.getFormatedString(newCollectiveBuy
				.getEndDate()));
	}

	private CollectiveBuy findCollectiveBuy(Integer id) {
		return (CollectiveBuy) dao.selectByQuerySingleResult(
				"SELECT c FROM CollectiveBuy c WHERE id = ?1", id);
	}

}
