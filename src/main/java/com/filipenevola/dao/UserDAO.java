package com.filipenevola.dao;

import java.text.ParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.filipenevola.model.Users;

/**
 * @author Filipe Névola
 */
@Repository
public class UserDAO {

	@Autowired
	private DAO dao;

	public UserDAO() {
	}

	@SuppressWarnings("unchecked")
	public List<Users> getUsers() {
		return dao.selectByQueryList("FROM Users c");
	}

	public void deleteUser(int id) {
		Users user = findUser(id);
		dao.remove(user);
	}

	public Users addUser(Users newUser) throws ParseException {
		dao.insert(newUser);
		return newUser;
	}

	public Users updateUser(Users updatedUser) throws ParseException {
		updatedUser = (Users) dao.update(updatedUser);
		return updatedUser;
	}

	private Users findUser(Integer id) {
		return (Users) dao.selectByQuerySingleResult(
				"SELECT c FROM Users c WHERE id = ?1", id);
	}

	public Users findUser(Users user) {
		return (Users) dao.selectByQuerySingleResult(
				"SELECT c FROM Users c WHERE c.login = ?1 AND c.pass = ?2",
				user.getLogin(), user.getPass());
	}

}
