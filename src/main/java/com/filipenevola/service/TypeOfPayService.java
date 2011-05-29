package com.filipenevola.service;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.filipenevola.dao.TypeOfPayDAO;
import com.filipenevola.model.TypeOfPay;
import com.filipenevola.model.Users;
import com.filipenevola.util.Util;

/**
 * @author Filipe Névola
 */
@Service
public class TypeOfPayService {

	@Autowired
	private TypeOfPayDAO categoryDAO;
	@Autowired
	private Util util;

	public List<TypeOfPay> getTypeOfPayList(Users user){
		return categoryDAO.getTypeOfPays(user);
	}
	public List<TypeOfPay> create(Object data, Users user) throws ParseException{		
        List<TypeOfPay> newTypeOfPays = new ArrayList<TypeOfPay>();		
		List<TypeOfPay> list = util.getTypeOfPaysFromRequest(data);		
		for (TypeOfPay category : list) {
			category.setUsers(user);
			newTypeOfPays.add(categoryDAO.addTypeOfPay(category));
		}		
		return newTypeOfPays;
	}
	
	
	public List<TypeOfPay> update(Object data, Users user) throws ParseException{
		
		List<TypeOfPay> returnTypeOfPays = new ArrayList<TypeOfPay>();		
		List<TypeOfPay> updatedTypeOfPays = util.getTypeOfPaysFromRequest(data);		
		for (TypeOfPay category : updatedTypeOfPays){
			category.setUsers(user);
			returnTypeOfPays.add(categoryDAO.updateTypeOfPay(category));
		}
		
		return returnTypeOfPays;
	}
	
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
	
	
}
