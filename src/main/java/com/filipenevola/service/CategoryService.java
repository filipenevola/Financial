package com.filipenevola.service;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import com.filipenevola.dao.CategoryDAO;
import com.filipenevola.model.Category;
import com.filipenevola.model.Users;
import com.filipenevola.util.Util;

/**
 * Category Business Delegate
 * 
 * @author Filipe Névola
 */
public class CategoryService {
	
	private CategoryDAO categoryDAO;
	private Util util;

	/**
	 * Get all categorys
	 * @return
	 */
	public List<Category> getCategoryList(Users user){
		return categoryDAO.getCategorys(user);
	}
	
	/**
	 * Create new Category/Categorys
	 * @param data - json data from request
	 * @return created categorys
	 * @throws ParseException 
	 */
	public List<Category> create(Object data, Users user) throws ParseException{
		
        List<Category> newCategorys = new ArrayList<Category>();
		
		List<Category> list = util.getCategorysFromRequest(data);
		
		for (Category category : list) {
			category.setUsers(user);
			newCategorys.add(categoryDAO.addCategory(category));
		}
		
		return newCategorys;
	}
	
	
	/**
	 * Update category/categorys
	 * @param data - json data from request
	 * @return updated categorys
	 * @throws ParseException 
	 */
	public List<Category> update(Object data, Users user) throws ParseException{
		
		List<Category> returnCategorys = new ArrayList<Category>();		
		List<Category> updatedCategorys = util.getCategorysFromRequest(data);		
		for (Category category : updatedCategorys){
			category.setUsers(user);
			returnCategorys.add(categoryDAO.updateCategory(category));
		}
		
		return returnCategorys;
	}
	
	/**
	 * Delete category/categorys
	 * @param data - json data from request
	 */
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
	

	/**
	 * Spring use - DI
	 * @param categoryDAO
	 */
	public void setCategoryDAO(CategoryDAO categoryDAO) {
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
