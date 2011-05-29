package com.filipenevola.service;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.filipenevola.dao.CategoryDAO;
import com.filipenevola.model.Category;
import com.filipenevola.model.Users;
import com.filipenevola.util.Util;

/**
 * @author Filipe Névola
 */
@Service
public class CategoryService {

	@Autowired
	private CategoryDAO categoryDAO;
	@Autowired
	private Util util;

	public List<Category> getCategoryList(Users user){
		return categoryDAO.getCategorys(user);
	}
	
	public List<Category> create(Object data, Users user) throws ParseException{
		
        List<Category> newCategorys = new ArrayList<Category>();
		
		List<Category> list = util.getCategorysFromRequest(data);
		
		for (Category category : list) {
			category.setUsers(user);
			newCategorys.add(categoryDAO.addCategory(category));
		}
		
		return newCategorys;
	}
	
	
	public List<Category> update(Object data, Users user) throws ParseException{
		
		List<Category> returnCategorys = new ArrayList<Category>();		
		List<Category> updatedCategorys = util.getCategorysFromRequest(data);		
		for (Category category : updatedCategorys){
			category.setUsers(user);
			returnCategorys.add(categoryDAO.updateCategory(category));
		}
		
		return returnCategorys;
	}
	
	public void delete(Object data){
		
		//it is an array - have to cast to array object
		if (data.toString().indexOf('[') > -1){			
			List<Integer> deleteCategorys = util.getListIdFromJSON(data);			
			for (Integer id : deleteCategorys){
				categoryDAO.deleteCategory(id);
			}			
		} else { //it is only one object - cast to object/bean
			
			Integer id = Integer.parseInt(data.toString());			
			categoryDAO.deleteCategory(id);
		}
	}
	

	
}
