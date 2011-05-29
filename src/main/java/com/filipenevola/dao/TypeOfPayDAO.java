package com.filipenevola.dao;

import java.text.ParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.filipenevola.model.TypeOfPay;
import com.filipenevola.model.Users;

/**
 * @author Filipe Névola
 */
@Repository
public class TypeOfPayDAO {

	@Autowired
	private DAO dao;

	public TypeOfPayDAO() {
	}

	@SuppressWarnings("unchecked")
	public List<TypeOfPay> getTypeOfPays(Users user) {
		return dao.selectByQueryList("FROM TypeOfPay c WHERE c.users = ?1 ORDER BY c.name",
				user);
	}

	public void deleteTypeOfPay(int id) {
		TypeOfPay typeOfPay = findTypeOfPay(id);
		dao.remove(typeOfPay);
	}

	public TypeOfPay addTypeOfPay(TypeOfPay newTypeOfPay) throws ParseException {
		dao.insert(newTypeOfPay);
		return newTypeOfPay;
	}

	
	public TypeOfPay updateTypeOfPay(TypeOfPay updatedTypeOfPay)
			throws ParseException {
		updatedTypeOfPay = (TypeOfPay) dao.update(updatedTypeOfPay);
		return updatedTypeOfPay;
	}

	private TypeOfPay findTypeOfPay(Integer id) {
		return (TypeOfPay) dao.selectByQuerySingleResult(
				"SELECT c FROM TypeOfPay c WHERE id = ?1", id);
	}


}
