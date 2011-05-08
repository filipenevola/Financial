package com.filipenevola.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.filipenevola.chart.CategoryPay;
import com.filipenevola.model.Users;
import com.filipenevola.service.ChartService;
import com.filipenevola.util.Util;

public class ChartController extends MultiActionController {
	private static Logger LOG = Logger.getLogger(ChartController.class);
	private ChartService chartService;
	private Util util;
	
	public ModelAndView categoryPay(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try {
			Users user = util.getUserLogged(request);
			if(user == null) {
				return util.getModelMapError("Nobody logged.");
			}			

			Object startDt = request.getSession().getAttribute("startdt");
			Object endDt = request.getSession().getAttribute("enddt");	
			
			List<CategoryPay> categoryPay = chartService.getCategoryPayListBetweenDates(user, startDt, endDt);
			
			return util.getModelMap(categoryPay);
		} catch (Exception e) {
			LOG.error("Error trying to retrieve charts.", e);
			return util.getModelMapError("Error trying to retrieve categorys.");
		}
	}
	
	public ModelAndView setDateRange(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try {
			Users user = util.getUserLogged(request);
			if(user == null) {
				return util.getModelMapError("Nobody logged.");
			}
			
			Object startDt = request.getParameter("startdt");
			Object endDt = request.getParameter("enddt");			

			request.getSession().setAttribute("startdt", startDt);
			request.getSession().setAttribute("enddt", endDt);
			Map<String, Object> modelMap = new HashMap<String, Object>(2);
			Map<String, Object> errors = new HashMap<String, Object>(1);
			errors.put("reason", "error");
			modelMap.put("success", true);
			modelMap.put("errors", errors);
			
			return new ModelAndView("jsonView", modelMap);
		} catch (Exception e) {
			LOG.error("Error trying to retrieve charts.", e);
			return util.getModelMapError("Error trying to retrieve categorys.");
		}
	}
	
	public ModelAndView categoryPay2(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try {
			Users user = util.getUserLogged(request);
			if(user == null) {
				return util.getModelMapError("Nobody logged.");
			}			

			Object startDt = request.getSession().getAttribute("startdt");
			Object endDt = request.getSession().getAttribute("enddt");	
			
			JFreeChart chart = chartService.createBarChart(user, startDt, endDt);
			
			response.setContentType("image/png");
			ChartUtilities.writeChartAsPNG(response.getOutputStream(), chart,
					800, 600);
		} catch (Exception e) {
			LOG.error("Error trying to retrieve charts.", e);
		}

		return null;
	}
	

	public void setChartService(ChartService chartService) {
		this.chartService = chartService;
	}

	/**
	 * Spring use - DI
	 * @param util
	 */
	public void setUtil(Util util) {
		this.util = util;
	}

	

}
