package com.filipenevola.dao;

import java.text.ParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.filipenevola.model.Category;
import com.filipenevola.model.Users;

/**
 * @author Filipe Névola
 */
@Repository
public class CategoryDAO {

	@Autowired
	private DAO dao;

	public CategoryDAO() {
	}

	@SuppressWarnings("unchecked")
	public List<Category> getCategorys(Users user) {
		return dao.selectByQueryList(
				"FROM Category c WHERE c.users = ?1 ORDER BY c.name", user);
	}

	public void deleteCategory(int id) {
		Category category = findCategory(id);
		dao.remove(category);
	}

	public Category addCategory(Category newCategory) throws ParseException {
		dao.insert(newCategory);
		return newCategory;
	}

	public Category updateCategory(Category updatedCategory)
			throws ParseException {
		updatedCategory = (Category) dao.update(updatedCategory);
		return updatedCategory;
	}

	private Category findCategory(Integer id) {
		return (Category) dao.selectByQuerySingleResult(
				"SELECT c FROM Category c WHERE id = ?1", id);
	}

}
