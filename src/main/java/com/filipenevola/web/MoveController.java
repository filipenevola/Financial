package com.filipenevola.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.filipenevola.chart.DataItem;
import com.filipenevola.chart.RadarItem;
import com.filipenevola.model.Category;
import com.filipenevola.model.Move;
import com.filipenevola.model.Users;
import com.filipenevola.service.MoveService;
import com.filipenevola.util.Util;

/**
 * @author Filipe Névola
 */
@Controller
public class MoveController extends MultiActionController {
	private static Logger LOG = Logger.getLogger(MoveController.class);

	@Autowired
	private MoveService moveService;
	@Autowired
	private Util util;

	public ModelAndView setField(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String field = request.getParameter("field");
		String value = request.getParameter("value");
		request.getSession().setAttribute("field", field);
		request.getSession().setAttribute("value", value);
		Map<String, String> map = new HashMap<String, String>();
		map.put("success", "true");
		return new ModelAndView("jsonView", map);
	}

	public ModelAndView view(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try {
			Users user = util.getUserLogged(request);
			if (user == null) {
				return util.getModelMapError("Nobody logged.");
			}

			Integer start = Integer.valueOf((String) request
					.getParameter("start"));
			Integer pageSize = Integer.valueOf((String) request
					.getParameter("limit"));
			String field = (String) request.getSession().getAttribute("field");
			String value = (String) request.getSession().getAttribute("value");
			Integer total = moveService.getTotalMove(user, field, value);
			List<Move> moves = moveService.getMoveList(user, start, pageSize,
					field, value);
			return util.getModelMapPaging(moves, total);
		} catch (Exception e) {
			LOG.error("Error trying to retrieve moves.", e);
			return util.getModelMapError("Error trying to retrieve moves.");
		}
	}

	public ModelAndView create(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try {
			Object data = request.getParameter("data");
			List<Move> moves = moveService.create(data);
			return util.getModelMap(moves);
		} catch (Exception e) {
			LOG.error("Error trying to create moves.", e);
			return util.getModelMapError("Error trying to create move.");
		}
	}

	public ModelAndView createFromForm(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		LOG.info("move/createFromForm");
		System.out.println("move/createFromForm");
		try {
			String dateOfMove = request.getParameter("dateOfMove");
			String name = request.getParameter("name");
			Double value = Double.parseDouble((String) request
					.getParameter("value"));
			Integer category = Integer.parseInt((String) request
					.getParameter("category"));
			String dateOfPay = request.getParameter("dateOfPay");
			Integer typeOfPay = Integer.parseInt((String) request
					.getParameter("typeOfPay"));
			String place = request.getParameter("place");
			System.out.println("dateOfMove: " + dateOfMove);
			System.out.println("name: " + name);
			System.out.println("value: " + value);
			System.out.println("category: " + category);
			System.out.println("dateOfPay: " + dateOfPay);
			System.out.println("typeOfPay: " + typeOfPay);
			System.out.println("place: " + place);
			Move move = new Move();
			move.setDateOfMove(dateOfMove);
			move.setName(name);
			move.setValue(value);
			move.setCategoryId(category);
			move.setDateOfPay(dateOfPay);
			move.setTypeOfPayId(typeOfPay);
			move.setPlace(place);
			moveService.createFromForm(move);
			Map<String, String> map = new HashMap<String, String>();
			map.put("success", "true");
			return new ModelAndView("jsonView", map);
		} catch (Exception e) {
			LOG.error("Error trying to create moves from form.", e);
			return util.getModelMapError("Error trying to create move.");
		}
	}

	public ModelAndView update(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try {
			Object data = request.getParameter("data");
			List<Move> moves = moveService.update(data);
			return util.getModelMap(moves);
		} catch (Exception e) {
			LOG.error("Error trying to update moves.", e);
			return util.getModelMapError("Error trying to update move.");
		}
	}

	public ModelAndView delete(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try {
			String data = request.getParameter("data");
			moveService.delete(data);
			Map<String, Object> modelMap = new HashMap<String, Object>(1);
			modelMap.put("success", true);
			return new ModelAndView("jsonView", modelMap);
		} catch (Exception e) {
			LOG.error("Error trying to delete moves.", e);
			return util.getModelMapError("Error trying to delete move.");
		}
	}

	public ModelAndView movesByMonth(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try {
			Users user = util.getUserLogged(request);
			if (user == null) {
				return util.getModelMapError("Nobody logged.");
			}
			String month = (String) request.getSession().getAttribute("month");
			Integer dateType = Integer.valueOf((String) request.getSession()
					.getAttribute("dateType"));
			List<Move> moves = moveService.movesByMonth(user, month, dateType);
			return util.getModelMap(moves);
		} catch (Exception e) {
			LOG.error("Error trying to retrieve moves by month.", e);
			return util
					.getModelMapError("Error trying to retrieve moves by month.");
		}
	}

	public ModelAndView setMonth(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try {
			request.getSession().setAttribute("month",
					request.getParameter("month"));
			request.getSession().setAttribute("dateType",
					request.getParameter("dateType"));
		} catch (Exception e) {
			LOG.error("Error trying to set month.", e);
			return util.getModelMapError("Error trying to set month.");
		}
		return null;
	}

	public ModelAndView radarCategories(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try {
			Users user = util.getUserLogged(request);
			if (user == null) {
				return util.getModelMapError("Nobody logged.");
			}

			List<Category> list = moveService.getCategories(user);
			return util.getModelMap(list);
		} catch (Exception e) {
			LOG.error("Error trying to set month.", e);
			return util.getModelMapError("Error trying to set month.");
		}
	}

	public ModelAndView radar(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try {
			Users user = util.getUserLogged(request);
			if (user == null) {
				return util.getModelMapError("Nobody logged.");
			}

			Integer[] categories = new Integer[] {
					Integer.valueOf(request.getParameter("cat1")),
					Integer.valueOf(request.getParameter("cat2")),
					Integer.valueOf(request.getParameter("cat3")) };
			List<RadarItem> list = moveService.sumByMonthByCategory(user, categories, true);

			return util.getModelMap(list);
		} catch (Exception e) {
			LOG.error("Error trying to set month.", e);
			return util.getModelMapError("Error trying to set month.");
		}
	}
	
	public ModelAndView movesCategoryMonthYear(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try {
			Users user = util.getUserLogged(request);
			if (user == null) {
				return util.getModelMapError("Nobody logged.");
			}

			String monthYear = request.getParameter("monthYear");
			Integer categoryId = Integer.valueOf(request.getParameter("categoryId"));
			
			List<DataItem> list = moveService.movesDataByCategoryAndMonth(user, monthYear, categoryId);

			return util.getModelMap(list);
		} catch (Exception e) {
			LOG.error("Error trying to set month.", e);
			return util.getModelMapError("Error trying to set month.");
		}
	}

}
