package com.filipenevola.service;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import com.filipenevola.dao.UserDAO;
import com.filipenevola.model.Users;
import com.filipenevola.util.Util;

/**
 * User Business Delegate
 * 
 * @author Filipe Névola
 */
public class UserService {
	
	private UserDAO userDAO;
	private Util util;

	/**
	 * Get all users
	 * @return
	 */
	public List<Users> getUserList(){

		return userDAO.getUsers();
	}
	
	/**
	 * Create new User/Users
	 * @param data - json data from request
	 * @return created users
	 * @throws ParseException 
	 */
	public List<Users> create(Object data) throws ParseException{
		
        List<Users> newUsers = new ArrayList<Users>();
		
		List<Users> list = util.getUsersFromRequest(data);
		
		for (Users user : list){
			newUsers.add(userDAO.addUser(user));
		}
		
		return newUsers;
	}
	
	
	/**
	 * Update user/users
	 * @param data - json data from request
	 * @return updated users
	 * @throws ParseException 
	 */
	public List<Users> update(Object data) throws ParseException{
		
		List<Users> returnUsers = new ArrayList<Users>();
		
		List<Users> updatedUsers = util.getUsersFromRequest(data);
		
		for (Users user : updatedUsers){
			returnUsers.add(userDAO.updateUser(user));
		}
		
		return returnUsers;
	}
	
	/**
	 * Delete user/users
	 * @param data - json data from request
	 */
	public void delete(Object data){
		
		//it is an array - have to cast to array object
		if (data.toString().indexOf('[') > -1){
			
			List<Integer> deleteUsers = util.getListIdFromJSON(data);
			
			for (Integer id : deleteUsers){
				userDAO.deleteUser(id);
			}
			
		} else { //it is only one object - cast to object/bean
			
			Integer id = Integer.parseInt(data.toString());
			
			userDAO.deleteUser(id);
		}
	}
	
	/**
	 * Login user
	 * @param data - json data from request
	 */
	public Users login(Users user){			
		return userDAO.findUser(user);
	}
	

	/**
	 * Spring use - DI
	 * @param userDAO
	 */
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	/**
	 * Spring use - DI
	 * @param util
	 */
	public void setUtil(Util util) {
		this.util = util;
	}
	
}
