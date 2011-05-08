package com.filipenevola.dao;

import java.text.ParseException;
import java.util.List;

import com.filipenevola.model.Users;

/**
 * @author Filipe Névola
 */
public class UserDAO {

	private DAO dao;
	
	
	public UserDAO() {
	}
	
	/**
	 * Get List of users
	 * @return list of all users
	 */
	@SuppressWarnings("unchecked")
	public List<Users> getUsers() {
		return dao.selectByQueryList("FROM Users c");
	}

	/**
	 * Delete a user with the id passed as parameter
	 * @param id
	 */
	public void deleteUser(int id){
		Users user = findUser(id);
		dao.remove(user);
	}
	
	/**
	 * Create a new User on the list/"database"
	 * @param newUser
	 * @return user added to DB
	 * @throws ParseException 
	 */
	public Users addUser(Users newUser) throws ParseException{
		dao.insert(newUser);
		return newUser;
	}
	
	
	/**
	 * Update a current User on the list/"database".
	 * There are only updated fields in the request (because of 
	 * writeAllFields: false in Writer object in ExtJS). When it transforms
	 * JSON data to a User Bean, the non updated fields remains null, that
	 * is why we have to verify which fields are not null.
	 * If you do not want it, you can set writeAllFields to true and
	 * overwrite the current object info with the new/updated info.
	 * @param updatedUser
	 * @return updated user
	 * @throws ParseException 
	 */
	public Users updateUser(Users updatedUser) throws ParseException{
		updatedUser = (Users) dao.update(updatedUser);		
		return updatedUser;
	}
	
	/**
	 * Find a user by id in users list
	 * @param id user id
	 * @return user if found; null otherwise
	 */
	private Users findUser(Integer id){
		return (Users) dao.selectByQuerySingleResult("SELECT c FROM Users c WHERE id = ?1", id);
	}
	
	/**
	 * Find a user by login and pass
	 * @param id user id
	 * @return true if found; false otherwise
	 */
	public Users findUser(Users user){
		return (Users) dao.selectByQuerySingleResult("SELECT c FROM Users c WHERE c.login = ?1 AND c.pass = ?2", user.getLogin(), user.getPass());
	}
	
	/**
	 * Spring use - DI
	 * @param dao
	 */
	public void setDao(DAO dao) {
		this.dao = dao;
	}

}
