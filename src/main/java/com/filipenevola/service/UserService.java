package com.filipenevola.service;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.filipenevola.dao.UserDAO;
import com.filipenevola.model.Users;
import com.filipenevola.util.Util;

/**
 * @author Filipe Névola
 */
@Service
public class UserService {

	@Autowired
	private UserDAO userDAO;
	@Autowired
	private Util util;

	public List<Users> getUserList() {

		return userDAO.getUsers();
	}

	public List<Users> create(Object data) throws ParseException {

		List<Users> newUsers = new ArrayList<Users>();

		List<Users> list = util.getUsersFromRequest(data);

		for (Users user : list) {
			newUsers.add(userDAO.addUser(user));
		}

		return newUsers;
	}

	public List<Users> update(Object data) throws ParseException {

		List<Users> returnUsers = new ArrayList<Users>();

		List<Users> updatedUsers = util.getUsersFromRequest(data);

		for (Users user : updatedUsers) {
			returnUsers.add(userDAO.updateUser(user));
		}

		return returnUsers;
	}

	public void delete(Object data) {

		// it is an array - have to cast to array object
		if (data.toString().indexOf('[') > -1) {

			List<Integer> deleteUsers = util.getListIdFromJSON(data);

			for (Integer id : deleteUsers) {
				userDAO.deleteUser(id);
			}

		} else { // it is only one object - cast to object/bean

			Integer id = Integer.parseInt(data.toString());

			userDAO.deleteUser(id);
		}
	}

	public Users login(Users user) {
		return userDAO.findUser(user);
	}
}
