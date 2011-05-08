package com.filipenevola.dao;

import java.text.ParseException;
import java.util.List;

import com.filipenevola.model.TypeOfPay;
import com.filipenevola.model.Users;

/**
 * @author Filipe Névola
 */
public class TypeOfPayDAO {

	private DAO dao;

	public TypeOfPayDAO() {
	}

	/**
	 * Get List of typeOfPays
	 * 
	 * @return list of all typeOfPays
	 */
	@SuppressWarnings("unchecked")
	public List<TypeOfPay> getTypeOfPays(Users user) {
		return dao.selectByQueryList("FROM TypeOfPay c WHERE c.users = ?1 ORDER BY c.name",
				user);
	}

	/**
	 * Delete a typeOfPay with the id passed as parameter
	 * 
	 * @param id
	 */
	public void deleteTypeOfPay(int id) {
		TypeOfPay typeOfPay = findTypeOfPay(id);
		dao.remove(typeOfPay);
	}

	/**
	 * Create a new TypeOfPay on the list/"database"
	 * 
	 * @param newTypeOfPay
	 * @return typeOfPay added to DB
	 * @throws ParseException
	 */
	public TypeOfPay addTypeOfPay(TypeOfPay newTypeOfPay) throws ParseException {
		dao.insert(newTypeOfPay);
		return newTypeOfPay;
	}

	/**
	 * Update a current TypeOfPay on the list/"database". There are only updated
	 * fields in the request (because of writeAllFields: false in Writer object
	 * in ExtJS). When it transforms JSON data to a TypeOfPay Bean, the non
	 * updated fields remains null, that is why we have to verify which fields
	 * are not null. If you do not want it, you can set writeAllFields to true
	 * and overwrite the current object info with the new/updated info.
	 * 
	 * @param updatedTypeOfPay
	 * @return updated typeOfPay
	 * @throws ParseException
	 */
	public TypeOfPay updateTypeOfPay(TypeOfPay updatedTypeOfPay)
			throws ParseException {
		updatedTypeOfPay = (TypeOfPay) dao.update(updatedTypeOfPay);
		return updatedTypeOfPay;
	}

	/**
	 * Find a typeOfPay by id in typeOfPays list
	 * 
	 * @param id
	 *            typeOfPay id
	 * @return typeOfPay if found; null otherwise
	 */
	private TypeOfPay findTypeOfPay(Integer id) {
		return (TypeOfPay) dao.selectByQuerySingleResult(
				"SELECT c FROM TypeOfPay c WHERE id = ?1", id);
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
