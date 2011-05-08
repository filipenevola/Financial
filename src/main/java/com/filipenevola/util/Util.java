package com.filipenevola.util;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;

import com.filipenevola.model.Category;
import com.filipenevola.model.CollectiveBuy;
import com.filipenevola.model.Investiment;
import com.filipenevola.model.Move;
import com.filipenevola.model.TypeOfPay;
import com.filipenevola.model.Users;

/**
 * Util class. Contains some common methods that can be used for any class
 * 
 * @author Loiane Groner
 */
public class Util {
	private static Logger LOG = Logger.getLogger(Util.class);

	private static DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");

	private static DateFormat dfString = new SimpleDateFormat("yyyy/MM/dd");

	private static NumberFormat nfString = new DecimalFormat();

	/**
	 * Tranform array of numbers in json data format into list of Integer
	 * 
	 * @param data
	 *            - json data from request
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Integer> getListIdFromJSON(Object data) {
		JSONArray jsonArray = JSONArray.fromObject(data);
		List<Integer> idContacts = (List<Integer>) JSONArray.toCollection(
				jsonArray, Integer.class);
		return idContacts;
	}

	/**
	 * Get list of Contacts from request.
	 * 
	 * @param data
	 *            - json data from request
	 * @return list of Contacts
	 */
	public List<Category> getCategorysFromRequest(Object data) {
		List<Category> list;
		// it is an array - have to cast to array object
		if (data.toString().indexOf('[') > -1) {
			list = getListCategorysFromJSON(data);
		} else { // it is only one object - cast to object/bean
			Category move = getCategorysFromJSON(data);
			list = new ArrayList<Category>();
			list.add(move);
		}
		return list;
	}

	/**
	 * Transform json data format into Contact object
	 * 
	 * @param data
	 *            - json data from request
	 * @return
	 */
	public Category getCategorysFromJSON(Object data) {
		JSONObject jsonObject = JSONObject.fromObject(data);
		Category newCategory = (Category) JSONObject.toBean(jsonObject,
				Category.class);
		return newCategory;
	}

	/**
	 * Transform json data format into list of Contact objects
	 * 
	 * @param data
	 *            - json data from request
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Category> getListCategorysFromJSON(Object data) {
		JSONArray jsonArray = JSONArray.fromObject(data);
		List<Category> newCategorys = (List<Category>) JSONArray.toCollection(
				jsonArray, Category.class);
		return newCategorys;
	}

	/**
	 * Get list of Contacts from request.
	 * 
	 * @param data
	 *            - json data from request
	 * @return list of Contacts
	 */
	public List<TypeOfPay> getTypeOfPaysFromRequest(Object data) {
		List<TypeOfPay> list;
		// it is an array - have to cast to array object
		if (data.toString().indexOf('[') > -1) {
			list = getListTypeOfPaysFromJSON(data);
		} else { // it is only one object - cast to object/bean
			TypeOfPay typeOfPays = getTypeOfPaysFromJSON(data);
			list = new ArrayList<TypeOfPay>();
			list.add(typeOfPays);
		}
		return list;
	}

	/**
	 * Transform json data format into Contact object
	 * 
	 * @param data
	 *            - json data from request
	 * @return
	 */
	public TypeOfPay getTypeOfPaysFromJSON(Object data) {
		JSONObject jsonObject = JSONObject.fromObject(data);
		TypeOfPay newTypeOfPay = (TypeOfPay) JSONObject.toBean(jsonObject,
				TypeOfPay.class);
		return newTypeOfPay;
	}

	/**
	 * Transform json data format into list of Contact objects
	 * 
	 * @param data
	 *            - json data from request
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<TypeOfPay> getListTypeOfPaysFromJSON(Object data) {
		JSONArray jsonArray = JSONArray.fromObject(data);
		List<TypeOfPay> newTypeOfPays = (List<TypeOfPay>) JSONArray
				.toCollection(jsonArray, TypeOfPay.class);
		return newTypeOfPays;
	}

	/**
	 * Get list of Contacts from request.
	 * 
	 * @param data
	 *            - json data from request
	 * @return list of Contacts
	 */
	public List<Move> getMovesFromRequest(Object data) {
		List<Move> list;
		// it is an array - have to cast to array object
		if (data.toString().indexOf('[') > -1) {
			list = getListMovesFromJSON(data);
		} else { // it is only one object - cast to object/bean
			Move move = getMovesFromJSON(data);
			list = new ArrayList<Move>();
			list.add(move);
		}
		return list;
	}

	/**
	 * Transform json data format into Contact object
	 * 
	 * @param data
	 *            - json data from request
	 * @return
	 */
	public Move getMovesFromJSON(Object data) {
		JSONObject jsonObject = JSONObject.fromObject(data);
		Move newMove = (Move) JSONObject.toBean(jsonObject, Move.class);
		return newMove;
	}

	/**
	 * Transform json data format into list of Contact objects
	 * 
	 * @param data
	 *            - json data from request
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Move> getListMovesFromJSON(Object data) {
		JSONArray jsonArray = JSONArray.fromObject(data);
		List<Move> newMoves = (List<Move>) JSONArray.toCollection(jsonArray,
				Move.class);
		return newMoves;
	}

	/**
	 * Get list of Users from request.
	 * 
	 * @param data
	 *            - json data from request
	 * @return list of Users
	 */
	public List<Users> getUsersFromRequest(Object data) {
		List<Users> list;
		// it is an array - have to cast to array object
		if (data.toString().indexOf('[') > -1) {
			list = getListUsersFromJSON(data);
		} else { // it is only one object - cast to object/bean
			Users user = getUsersFromJSON(data);
			list = new ArrayList<Users>();
			list.add(user);
		}
		return list;
	}

	/**
	 * Transform json data format into User object
	 * 
	 * @param data
	 *            - json data from request
	 * @return
	 */
	public Users getUsersFromJSON(Object data) {
		JSONObject jsonObject = JSONObject.fromObject(data);
		Users newUser = (Users) JSONObject.toBean(jsonObject, Users.class);
		return newUser;
	}

	/**
	 * Transform json data format into list of User objects
	 * 
	 * @param data
	 *            - json data from request
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Users> getListUsersFromJSON(Object data) {
		JSONArray jsonArray = JSONArray.fromObject(data);
		List<Users> newUsers = (List<Users>) JSONArray.toCollection(jsonArray,
				Users.class);
		return newUsers;
	}

	/**
	 * Get list of Users from request.
	 * 
	 * @param data
	 *            - json data from request
	 * @return list of Users
	 */
	public List<Investiment> getInvestimentsFromRequest(Object data) {
		List<Investiment> list;
		// it is an array - have to cast to array object
		if (data.toString().indexOf('[') > -1) {
			list = getListInvestimentsFromJSON(data);
		} else { // it is only one object - cast to object/bean
			Investiment investiment = getInvestimentsFromJSON(data);
			list = new ArrayList<Investiment>();
			list.add(investiment);
		}
		return list;
	}

	/**
	 * Transform json data format into User object
	 * 
	 * @param data
	 *            - json data from request
	 * @return
	 */
	public Investiment getInvestimentsFromJSON(Object data) {
		JSONObject jsonObject = JSONObject.fromObject(data);
		Investiment newInvestiment = (Investiment) JSONObject.toBean(
				jsonObject, Investiment.class);
		return newInvestiment;
	}

	/**
	 * Transform json data format into list of User objects
	 * 
	 * @param data
	 *            - json data from request
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Investiment> getListInvestimentsFromJSON(Object data) {
		JSONArray jsonArray = JSONArray.fromObject(data);
		List<Investiment> newInvestiments = (List<Investiment>) JSONArray
				.toCollection(jsonArray, Investiment.class);
		return newInvestiments;
	}

	public List<CollectiveBuy> getCollectiveBuysFromRequest(Object data) {
		List<CollectiveBuy> list;
		// it is an array - have to cast to array object
		if (data.toString().indexOf('[') > -1) {
			list = getListCollectiveBuysFromJSON(data);
		} else { // it is only one object - cast to object/bean
			CollectiveBuy move = getCollectiveBuysFromJSON(data);
			list = new ArrayList<CollectiveBuy>();
			list.add(move);
		}
		return list;
	}

	public CollectiveBuy getCollectiveBuysFromJSON(Object data) {
		JSONObject jsonObject = JSONObject.fromObject(data);
		CollectiveBuy newMove = (CollectiveBuy) JSONObject.toBean(jsonObject,
				CollectiveBuy.class);
		return newMove;
	}

	@SuppressWarnings("unchecked")
	public List<CollectiveBuy> getListCollectiveBuysFromJSON(Object data) {
		JSONArray jsonArray = JSONArray.fromObject(data);
		List<CollectiveBuy> newMoves = (List<CollectiveBuy>) JSONArray
				.toCollection(jsonArray, CollectiveBuy.class);
		return newMoves;
	}

	/**
	 * Generates modelMap to return in the modelAndView
	 * 
	 * @param ? extends Object
	 * @return
	 */
	public ModelAndView getModelMap(List<? extends Object> list) {
		Map<String, Object> modelMap = new HashMap<String, Object>(3);
		modelMap.put("total", list == null ? 0 : list.size());
		modelMap.put("data", list);
		modelMap.put("success", true);
		return new ModelAndView("jsonView", modelMap);
	}

	/**
	 * Generates modelMap to return in the modelAndView
	 * 
	 * @param ? extends Object
	 * @return
	 */
	public ModelAndView getModelMapPaging(List<? extends Object> list,
			Integer total) {
		Map<String, Object> modelMap = new HashMap<String, Object>(3);
		modelMap.put("total", total);
		modelMap.put("data", list);
		modelMap.put("success", true);
		return new ModelAndView("jsonView", modelMap);
	}

	/**
	 * Generates modelMap to return in the modelAndView in case of exception
	 * 
	 * @param msg
	 *            message
	 * @return
	 */
	public ModelAndView getModelMapError(String msg) {
		Map<String, Object> modelMap = new HashMap<String, Object>(2);
		modelMap.put("message", msg);
		modelMap.put("success", false);
		return new ModelAndView("jsonView", modelMap);
	}

	/**
	 * Format a yyyy-MM-dd'T'HH:mm:ss string to MM/dd/yyyy string JSON date has
	 * the following format: yyyy-MM-dd'T'HH:mm:ss
	 * 
	 * @param jsonDate
	 * @return MM/dd/yyyy string date
	 * @throws ParseException
	 */
	public String getFormatedString(String jsonDate) {
		Date date = null;
		try {
			date = df.parse(jsonDate);
		} catch (Exception e) {
			// Map<String, Integer> months = new HashMap<String, Integer>();
			// months.put("Jan", 1);
			// months.put("Feb", 2);
			// months.put("Mar", 3);
			// months.put("Apr", 4);
			// months.put("May", 5);
			// months.put("Jun", 6);
			// months.put("Jul", 7);
			// months.put("Aug", 8);
			// months.put("Set", 9);
			// months.put("Oct", 10);
			// months.put("Nov", 11);
			// months.put("Dec", 12);
			try {
				// String d = months.get(jsonDate.split("/")[0]).toString();
				// d += "/" + jsonDate.split("/")[1];
				// d += "/" + jsonDate.split("/")[2];
				date = dfString.parse(jsonDate);
			} catch (Exception e2) {
				LOG.error("Error while convert jsonDate: " + jsonDate, e2);
				return "";
			}
		}
		return dfString.format(date);
	}

	/**
	 * Format a yyyy-MM-dd'T'HH:mm:ss string to MM/dd/yyyy string JSON date has
	 * the following format: yyyy-MM-dd'T'HH:mm:ss
	 * 
	 * @param jsonDate
	 * @return yyyy/MM/dd string date
	 * @throws ParseException
	 */
	public String getFormatedStringTodayDate() {
		String ret = null;
		ret = dfString.format(Calendar.getInstance().getTime());
		return ret;
	}

	public String getFormatedString(Date date) {
		String ret = null;
		ret = dfString.format(date);
		return ret;
	}

	public String getFormatedStringOneMonthEarlier() {
		String ret = null;
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.MONTH, -1);
		ret = dfString.format(cal.getTime());
		return ret;
	}

	public String getPercent(double perc) {
		nfString.setMaximumFractionDigits(1);
		return nfString.format(perc) + "%";
	}

	public String getMoney(double value) {
		nfString.setMaximumFractionDigits(2);
		nfString.setMinimumFractionDigits(2);
		return nfString.format(value);
	}

	public Integer diferencaEmDias(Date dataInicial, Date dataFinal) {
		long diferenca = dataFinal.getTime() - dataInicial.getTime();
		Integer diferencaEmDias = Double.valueOf(
				(diferenca / 1000) / 60 / 60 / 24).intValue();
		return diferencaEmDias;
	}

	public static Date getDate(String string) {
		try {
			return dfString.parse(string);
		} catch (ParseException e) {
			LOG.error("Error while parse string to date: " + string);
		}
		return null;
	}

	public static String getJsonDate(String string) {
		try {
			Date date = dfString.parse(string);
			return df.format(date);

		} catch (ParseException e) {
			LOG.error("Error while parse string to date: " + string);
		}
		return null;
	}

	/**
	 * Get logged user or null
	 * 
	 * @param request
	 * @return
	 */
	public Users getUserLogged(HttpServletRequest request) {
		Users user = null;
		Object logged = request.getSession().getAttribute("login");
		if (logged != null) {
			user = (Users) logged;
			LOG.info("Login of logged user: " + user.getLogin());
		}
		return user;
	}
}
