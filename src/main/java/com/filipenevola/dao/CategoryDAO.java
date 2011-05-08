package com.filipenevola.dao;

import java.text.ParseException;
import java.util.List;

import com.filipenevola.model.Category;
import com.filipenevola.model.Users;

/**
 * @author Filipe Névola
 */
public class CategoryDAO {

	private DAO dao;

	public CategoryDAO() {
	}

	/**
	 * Get List of categorys
	 * 
	 * @return list of all categorys
	 */
	@SuppressWarnings("unchecked")
	public List<Category> getCategorys(Users user) {
		return dao
				.selectByQueryList("FROM Category c WHERE c.users = ?1 ORDER BY c.name", user);
	}

	/**
	 * Delete a category with the id passed as parameter
	 * 
	 * @param id
	 */
	public void deleteCategory(int id) {
		Category category = findCategory(id);
		dao.remove(category);
	}

	/**
	 * Create a new Category on the list/"database"
	 * 
	 * @param newCategory
	 * @return category added to DB
	 * @throws ParseException
	 */
	public Category addCategory(Category newCategory) throws ParseException {
		dao.insert(newCategory);
		return newCategory;
	}

	/**
	 * Update a current Category on the list/"database". There are only updated
	 * fields in the request (because of writeAllFields: false in Writer object
	 * in ExtJS). When it transforms JSON data to a Category Bean, the non
	 * updated fields remains null, that is why we have to verify which fields
	 * are not null. If you do not want it, you can set writeAllFields to true
	 * and overwrite the current object info with the new/updated info.
	 * 
	 * @param updatedCategory
	 * @return updated category
	 * @throws ParseException
	 */
	public Category updateCategory(Category updatedCategory)
			throws ParseException {
		updatedCategory = (Category) dao.update(updatedCategory);
		return updatedCategory;
	}

	/**
	 * Find a category by id in categorys list
	 * 
	 * @param id
	 *            category id
	 * @return category if found; null otherwise
	 */
	private Category findCategory(Integer id) {
		return (Category) dao.selectByQuerySingleResult(
				"SELECT c FROM Category c WHERE id = ?1", id);
	}

	/**
	 * Spring use - DI
	 * 
	 * @param dao
	 */
	public void setDao(DAO dao) {
		this.dao = dao;
	}

}
