package com.filipenevola.test;

import com.filipenevola.dao.DAO;

public class Main {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		DAO dao = new DAO();
		
		dao.selectByQueryList("SELECT c FROM Category c");
		dao.selectByQueryList("SELECT c FROM Move c");
		dao.selectByQueryList("SELECT c FROM Users c");

	}

}
