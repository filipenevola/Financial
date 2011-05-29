package com.filipenevola.dao;

import java.text.ParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.filipenevola.model.Investiment;
import com.filipenevola.model.Users;
import com.filipenevola.util.Util;

/**
 * @author Filipe Névola
 */
@Repository
public class InvestimentDAO {

	@Autowired
	private Util util;

	@Autowired
	private DAO dao;

	public InvestimentDAO() {
	}

	@SuppressWarnings("unchecked")
	public List<Investiment> getInvestiments(Users user) {
		return dao
				.selectByQueryList(
						"FROM Investiment c WHERE c.users = ?1 ORDER BY c.dateOfInvestiment DESC",
						user);
	}
	public void deleteInvestiment(int id) {
		Investiment move = findInvestiment(id);
		dao.remove(move);
	}

	public Investiment addInvestiment(Investiment newInvestiment) throws ParseException {
		newInvestiment.setDateOfInvestiment(util.getFormatedString(newInvestiment.getDateOfInvestiment()));
		dao.insert(newInvestiment);
		return newInvestiment;
	}

	public Investiment updateInvestiment(Investiment updatedInvestiment) throws ParseException {
		updatedInvestiment.setDateOfInvestiment(util.getFormatedString(updatedInvestiment
				.getDateOfInvestiment()));
		updatedInvestiment = (Investiment) dao.update(updatedInvestiment);
		return updatedInvestiment;
	}

	private Investiment findInvestiment(Integer id) {
		return (Investiment) dao.selectByQuerySingleResult(
				"SELECT c FROM Investiment c WHERE id = ?1", id);
	}
	
	@SuppressWarnings("unchecked")
	public List<Investiment> findInvestimentOrderCategory(Users user) {
		return (List<Investiment>) dao
				.selectByQueryList(
						"SELECT m FROM Investiment m WHERE m.users = ?1 ORDER BY m.dateOfInvestiment DESC",
						user);
	}

	@SuppressWarnings("unchecked")
	public List<Investiment> findInvestimentBetweenDates(Users user,
			String start, String end) {
		return (List<Investiment>) dao
				.selectByQueryList(
						"SELECT m FROM Investiment m WHERE ((m.users = ?1) AND (m.dateOfInvestiment >= ?2 AND m.dateOfInvestiment <= ?3)) ORDER BY m.category.name",
						user, start, end);
	}


}
