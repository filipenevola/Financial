package com.filipenevola.service;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import com.filipenevola.dao.TypeOfPayDAO;
import com.filipenevola.model.TypeOfPay;
import com.filipenevola.model.Users;
import com.filipenevola.util.Util;

/**
 * TypeOfPay Business Delegate
 * 
 * @author Filipe Névola
 */
public class TypeOfPayService {
	
	private TypeOfPayDAO categoryDAO;
	private Util util;

	/**
	 * Get all categorys
	 * @return
	 */
	public List<TypeOfPay> getTypeOfPayList(Users user){
		return categoryDAO.getTypeOfPays(user);
	}
	
	/**
	 * Create new TypeOfPay/TypeOfPays
	 * @param data - json data from request
	 * @return created categorys
	 * @throws ParseException 
	 */
	public List<TypeOfPay> create(Object data, Users user) throws ParseException{		
        List<TypeOfPay> newTypeOfPays = new ArrayList<TypeOfPay>();		
		List<TypeOfPay> list = util.getTypeOfPaysFromRequest(data);		
		for (TypeOfPay category : list) {
			category.setUsers(user);
			newTypeOfPays.add(categoryDAO.addTypeOfPay(category));
		}		
		return newTypeOfPays;
	}
	
	
	/**
	 * Update category/categorys
	 * @param data - json data from request
	 * @return updated categorys
	 * @throws ParseException 
	 */
	public List<TypeOfPay> update(Object data, Users user) throws ParseException{
		
		List<TypeOfPay> returnTypeOfPays = new ArrayList<TypeOfPay>();		
		List<TypeOfPay> updatedTypeOfPays = util.getTypeOfPaysFromRequest(data);		
		for (TypeOfPay category : updatedTypeOfPays){
			category.setUsers(user);
			returnTypeOfPays.add(categoryDAO.updateTypeOfPay(category));
		}
		
		return returnTypeOfPays;
	}
	
	/**
	 * Delete category/categorys
	 * @param data - json data from request
	 */
	public void delete(Object data){
		
		//it is an array - have to cast to array object
		if (data.toString().indexOf('[') > -1){			
			List<Integer> deleteTypeOfPays = util.getListIdFromJSON(data);			
			for (Integer id : deleteTypeOfPays){
				categoryDAO.deleteTypeOfPay(id);
			}			
		} else { //it is only one object - cast to object/bean			
			Integer id = Integer.parseInt(data.toString());			
			categoryDAO.deleteTypeOfPay(id);
		}
	}
	

	/**
	 * Spring use - DI
	 * @param categoryDAO
	 */
	public void setTypeOfPayDAO(TypeOfPayDAO categoryDAO) {
		this.categoryDAO = categoryDAO;
	}

	/**
	 * Spring use - DI
	 * @param util
	 */
	public void setUtil(Util util) {
		this.util = util;
	}
	
}
