package com.filipenevola.dao;

import java.text.ParseException;
import java.util.List;

import com.filipenevola.model.Investiment;
import com.filipenevola.model.Users;
import com.filipenevola.util.Util;

/**
 * @author Filipe Névola
 */
public class InvestimentDAO {

	private Util util;

	private DAO dao;

	public InvestimentDAO() {
	}

	/**
	 * Get List of moves
	 * 
	 * @return list of all moves
	 */
	@SuppressWarnings("unchecked")
	public List<Investiment> getInvestiments(Users user) {
		return dao
				.selectByQueryList(
						"FROM Investiment c WHERE c.users = ?1 ORDER BY c.dateOfInvestiment DESC",
						user);
	}

	/**
	 * Delete a move with the id passed as parameter
	 * 
	 * @param id
	 */
	public void deleteInvestiment(int id) {
		Investiment move = findInvestiment(id);
		dao.remove(move);
	}

	/**
	 * Create a new Investiment on the list/"database"
	 * 
	 * @param newInvestiment
	 * @return move added to DB
	 * @throws ParseException
	 */
	public Investiment addInvestiment(Investiment newInvestiment) throws ParseException {
		newInvestiment.setDateOfInvestiment(util.getFormatedString(newInvestiment.getDateOfInvestiment()));
		dao.insert(newInvestiment);
		return newInvestiment;
	}

	/**
	 * Update a current Investiment on the list/"database". There are only updated
	 * fields in the request (because of writeAllFields: false in Writer object
	 * in ExtJS). When it transforms JSON data to a Investiment Bean, the non updated
	 * fields remains null, that is why we have to verify which fields are not
	 * null. If you do not want it, you can set writeAllFields to true and
	 * overwrite the current object info with the new/updated info.
	 * 
	 * @param updatedInvestiment
	 * @return updated move
	 * @throws ParseException
	 */
	public Investiment updateInvestiment(Investiment updatedInvestiment) throws ParseException {
		updatedInvestiment.setDateOfInvestiment(util.getFormatedString(updatedInvestiment
				.getDateOfInvestiment()));
		updatedInvestiment = (Investiment) dao.update(updatedInvestiment);
		return updatedInvestiment;
	}

	/**
	 * Find a move by id in moves list
	 * 
	 * @param id
	 *            move id
	 * @return move if found; null otherwise
	 */
	private Investiment findInvestiment(Integer id) {
		return (Investiment) dao.selectByQuerySingleResult(
				"SELECT c FROM Investiment c WHERE id = ?1", id);
	}
	
	/**
	 * Find a move order by category
	 * 
	 * @param id
	 *            move id
	 * @return move if found; null otherwise
	 */
	@SuppressWarnings("unchecked")
	public List<Investiment> findInvestimentOrderCategory(Users user) {
		return (List<Investiment>) dao
				.selectByQueryList(
						"SELECT m FROM Investiment m WHERE m.users = ?1 ORDER BY m.dateOfInvestiment DESC",
						user);
	}

	/**
	 * Find a move order by category between dates
	 * 
	 * @param id
	 *            move id
	 * @return move if found; null otherwise
	 */
	@SuppressWarnings("unchecked")
	public List<Investiment> findInvestimentBetweenDates(Users user,
			String start, String end) {
		return (List<Investiment>) dao
				.selectByQueryList(
						"SELECT m FROM Investiment m WHERE ((m.users = ?1) AND (m.dateOfInvestiment >= ?2 AND m.dateOfInvestiment <= ?3)) ORDER BY m.category.name",
						user, start, end);
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
