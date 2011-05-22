package com.filipenevola.dao;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.filipenevola.chart.RadarItem;
import com.filipenevola.chart.RadarItemCategory;
import com.filipenevola.model.Category;
import com.filipenevola.model.Move;
import com.filipenevola.model.Users;
import com.filipenevola.util.Util;

/**
 * @author Filipe Névola
 */
public class MoveDAO {
	private static Logger LOG = Logger.getLogger(MoveDAO.class);

	private Util util;

	private DAO dao;

	public MoveDAO() {
	}

	public List<Category> getCategories(Users user) {
		@SuppressWarnings("unchecked")
		List<Category> categories = dao.selectByQueryList(
				"FROM Category c WHERE c.users = ?1 ORDER BY c.name", user);
		return categories;

	}

	public List<RadarItem> sumByMonthByCategory(Users user,
			List<Integer> categoriesId, Boolean pay) {
		List<Category> categories = getCategories(user);
		Map<Category, Integer> mapCat = new HashMap<Category, Integer>();
		int number = 1;
		String ids = "";
		for (Category c : categories) {
			if (categoriesId.contains(c.getId())) {
				ids += c.getId();
				ids += ",";
				mapCat.put(c, number);
				number++;
			}
		}
		ids = ids.substring(0, ids.length() -1);
		
		String monthYear = util.getFormatedStringTodayMonthYear();
		String year = monthYear.split("/")[0];
		int yearInt = Integer.valueOf(year);
		String month = monthYear.split("/")[1];
		int monthInt = Integer.valueOf(month);
		if (month.length() < 2)
			month = "0" + month;

		List<RadarItem> list = new ArrayList<RadarItem>();

		for (int j = 0; j < 12; ++j) {

			String start = year + "/" + month + "/01";
			String end = year + "/" + month + "/31";

			@SuppressWarnings("rawtypes")
			Object[] objs = ((List) dao
					.selectByQueryList(
							"SELECT sum(m.value), m.category.id FROM Move m WHERE ((m.category.users = ?1) AND (m.category.pay = ?2) AND (m.dateOfPay >= ?3 AND m.dateOfPay <= ?4)) AND m.category.id IN (" +
							ids + ") GROUP BY m.category.id ORDER BY m.category.id",
							user, pay, start, end)).toArray();

			Map<Integer, Double> mapCatIdSum = new HashMap<Integer, Double>();
			LOG.info("Mês: " + month + "/" + year);
			for (int i = 0; i < objs.length; i++) {
				// String name = (String) ((Object[]) objs[i])[1];
				Integer id = (Integer) ((Object[]) objs[i])[1];
				Double sum = (Double) ((Object[]) objs[i])[0];
				LOG.info("Nome: " + id + ", Soma: " + sum);
				mapCatIdSum.put(id, sum);
			}

			List<RadarItemCategory> listItems = new ArrayList<RadarItemCategory>();
			for (Category c : mapCat.keySet()) {
				Integer numberCat = mapCat.get(c);
				Double sum = mapCatIdSum.get(c.getId());
				sum = sum == null ? 0 : sum;
				RadarItemCategory ric = new RadarItemCategory();
				ric.setCategory(getCatWithNumber(c, numberCat));
				ric.setName(c.getName());
				ric.setValue(sum);
				listItems.add(ric);
			}

			RadarItem radarItem = new RadarItem();
			radarItem.setMonthYear(month + "/" + year);
			radarItem.setList(listItems);
			list.add(radarItem);

			monthInt--;
			if (monthInt == 0) {
				monthInt = 12;
				yearInt--;
			}

			year = Integer.toString(yearInt);
			month = "";
			if (monthInt < 10) {
				month += "0";
			}
			month += Integer.toString(monthInt);

		}
		
		Collections.reverse(list);

		return list;
	}

	public String getCatWithNumber(Category cat, Integer number) {
		// return (cat.getName() + "(" + cat.getId() + ")").trim();
		return "cat" + number;
	}

	/**
	 * Get List of moves
	 * 
	 * @return list of all moves
	 */
	@SuppressWarnings("unchecked")
	public List<Move> getMoves(Users user, Integer start, Integer pageSize,
			String field, String value) {
		List<Move> list = null;
		if (field != null && field.length() > 0) {
			if (field.equals("category")) {
				list = dao.selectByQueryListPaging(
						"FROM Move c WHERE c.category.users = ?1 AND c."
								+ field + ".name"
								+ " like ?2 ORDER BY c.dateOfMove DESC", start,
						pageSize, user, "%" + value + "%");
			} else {
				list = dao
						.selectByQueryListPaging(
								"FROM Move c WHERE c.category.users = ?1 AND c."
										+ field
										+ " like ?2 ORDER BY c.dateOfMove DESC",
								start, pageSize, user, "%" + value + "%");
			}
		} else {
			list = dao
					.selectByQueryListPaging(
							"FROM Move c WHERE c.category.users = ?1 ORDER BY c.dateOfMove DESC",
							start, pageSize, user);

		}
		return list;
	}

	public Move getMove(Move move) {
		return (Move) dao.selectById(move);
	}

	public Integer getTotalMove(Users user, String field, String value) {
		Long llong = null;
		if (field != null && field.length() > 0) {
			llong = dao.count("Move", "o.category.users = ?1 AND o." + field
					+ " like ?2", user, "%" + value + "%");

		} else {
			llong = dao.count("Move", "o.category.users = ?1", user);

		}
		LOG.info("getTotalMove - total: " + llong.intValue());
		return llong.intValue();
	}

	/**
	 * Delete a move with the id passed as parameter
	 * 
	 * @param id
	 */
	public void deleteMove(int id) {
		Move move = findMove(id);
		dao.remove(move);
	}

	/**
	 * Create a new Move on the list/"database"
	 * 
	 * @param newMove
	 * @return move added to DB
	 * @throws ParseException
	 */
	public Move addMove(Move newMove) throws ParseException {
		newMove.setDateOfMove(util.getFormatedString(newMove.getDateOfMove()));
		newMove.setDateOfPay(util.getFormatedString(newMove.getDateOfPay()));
		dao.insert(newMove);
		return newMove;
	}

	/**
	 * Update a current Move on the list/"database". There are only updated
	 * fields in the request (because of writeAllFields: false in Writer object
	 * in ExtJS). When it transforms JSON data to a Move Bean, the non updated
	 * fields remains null, that is why we have to verify which fields are not
	 * null. If you do not want it, you can set writeAllFields to true and
	 * overwrite the current object info with the new/updated info.
	 * 
	 * @param updatedMove
	 * @return updated move
	 * @throws ParseException
	 */
	public Move updateMove(Move updatedMove) throws ParseException {
		updatedMove.setDateOfMove(util.getFormatedString(updatedMove
				.getDateOfMove()));
		updatedMove.setDateOfPay(util.getFormatedString(updatedMove
				.getDateOfPay()));
		updatedMove = (Move) dao.update(updatedMove);
		return updatedMove;
	}

	/**
	 * Find a move by id in moves list
	 * 
	 * @param id
	 *            move id
	 * @return move if found; null otherwise
	 */
	private Move findMove(Integer id) {
		return (Move) dao.selectByQuerySingleResult(
				"SELECT c FROM Move c WHERE id = ?1", id);
	}

	/**
	 * Find a move by category
	 * 
	 * @param id
	 *            move id
	 * @return move if found; null otherwise
	 */
	@SuppressWarnings("unchecked")
	public List<Move> findMoveByCategory(Category category) {
		return (List<Move>) dao.selectByQueryList(
				"SELECT c FROM Move c WHERE c.category = ?1", category);
	}

	/**
	 * Find a move order by category
	 * 
	 * @param id
	 *            move id
	 * @return move if found; null otherwise
	 */
	@SuppressWarnings("unchecked")
	public List<Move> findMoveOrderCategory(Users user) {
		return (List<Move>) dao
				.selectByQueryList(
						"SELECT m FROM Move m WHERE m.category.users = ?1 ORDER BY m.category.name",
						user);
	}

	@SuppressWarnings("unchecked")
	public List<List<Move>> balanceMonth(Users user, String month) {
		String year = month.split("/")[1];
		month = month.split("/")[0];
		if (month.length() < 2)
			month = "0" + month;

		String start = year + "/" + month + "/01";
		String end = year + "/" + month + "/31";
		List<Move> dateMove = (List<Move>) dao
				.selectByQueryList(
						"SELECT m FROM Move m WHERE ((m.category.users = ?1) AND (m.dateOfMove >= ?2 AND m.dateOfMove <= ?3)) ORDER BY m.dateOfMove",
						user, start, end);
		List<Move> datePay = (List<Move>) dao
				.selectByQueryList(
						"SELECT m FROM Move m WHERE ((m.category.users = ?1) AND (m.dateOfPay >= ?2 AND m.dateOfPay <= ?3)) ORDER BY m.dateOfPay",
						user, start, end);

		List<List<Move>> list = new ArrayList<List<Move>>();
		list.add(dateMove);
		list.add(datePay);
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<Move> movesOfMonth(Users user, String month, Integer dateType) {
		String year = month.split("/")[1];
		month = month.split("/")[0];
		if (month.length() < 2)
			month = "0" + month;

		String dates = "(m.dateOfMove >= ?2 AND m.dateOfMove <= ?3)";
		if (dateType == 2) {
			dates = "(m.dateOfPay >= ?2 AND m.dateOfPay <= ?3)";
		}
		String start = year + "/" + month + "/01";
		String end = year + "/" + month + "/31";
		List<Move> list = (List<Move>) dao.selectByQueryList(
				"SELECT m FROM Move m WHERE ((m.category.users = ?1) AND "
						+ dates + ") ORDER BY m.dateOfMove", user, start, end);

		return list;
	}

	public List<Category> month(Users user, String month, boolean pay) {

		String year = month.split("/")[1];
		month = month.split("/")[0];
		if (month.length() < 2)
			month = "0" + month;

		String start = year + "/" + month + "/01";
		String end = year + "/" + month + "/31";

		@SuppressWarnings("rawtypes")
		Object[] objs = ((List) dao
				.selectByQueryList(
						"SELECT sum(m.value), m.category.name, count(m.category.name) FROM Move m WHERE ((m.category.users = ?1) AND (m.category.pay = ?2) AND (m.dateOfPay >= ?3 AND m.dateOfPay <= ?4)) GROUP BY m.category.name ORDER BY m.category.name",
						user, pay, start, end)).toArray();

		List<Category> list = new ArrayList<Category>();
		for (int i = 0; i < objs.length; i++) {
			list.add(new Category(((Long) ((Object[]) objs[i])[2]).intValue(),
					(String) ((Object[]) objs[i])[1],
					(Double) ((Object[]) objs[i])[0]));
		}
		return list;
	}

	/**
	 * Find a move order by category between dates
	 * 
	 * @param id
	 *            move id
	 * @return move if found; null otherwise
	 */
	@SuppressWarnings("unchecked")
	public List<Move> findMoveOrderCategoryBetweenDates(Users user,
			String start, String end) {
		return (List<Move>) dao
				.selectByQueryList(
						"SELECT m FROM Move m WHERE ((m.category.users = ?1) AND (m.dateOfMove >= ?2 AND m.dateOfMove <= ?3) AND m.category.pay = ?4) ORDER BY m.category.name",
						user, start, end, true);
	}

	/**
	 * Spring use - DI
	 * 
	 * @param util
	 */
	public void setUtil(Util util) {
		this.util = util;
	}

	/**
	 * Spring use - DI
	 * 
	 * @param dao
	 */
	public void setDao(DAO dao) {
		this.dao = dao;
	}

}
