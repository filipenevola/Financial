package com.filipenevola.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.filipenevola.model.Users;
import com.filipenevola.service.CalculationService;
import com.filipenevola.util.Util;

public class CalculationController  extends MultiActionController {

	private CalculationService calculationService;
	private Util util;
	
	public ModelAndView balanceMonth(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Users user = util.getUserLogged(request);
		if(user == null) {
			return util.getModelMapError("Nobody logged.");
		}
		String month = (String) request.getParameter("month");
		List<Double> list = calculationService.balanceMonth(user, month);
		Map<String, Double> map = new HashMap<String, Double>();
		
		map.put("move", list.get(0));
		map.put("pay", list.get(1));
		map.put("rec", list.get(2));
		map.put("recPay", list.get(2) - list.get(1));
		map.put("recMove", list.get(2) - list.get(0));
		return new ModelAndView("jsonView", map);
	}
	
	public ModelAndView month(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Users user = util.getUserLogged(request);
		if(user == null) {
			return util.getModelMapError("Nobody logged.");
		}
		String month = (String) request.getParameter("month");
		boolean pay = Boolean.valueOf(request.getParameter("pay"));
		String html = calculationService.monthHtml(user, month, pay);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("content", html);
		return new ModelAndView("jsonView", map);
	}
	
	
	public void setCalculationService(CalculationService calculationService) {
		this.calculationService = calculationService;
	}
	public void setUtil(Util util) {
		this.util = util;
	}
	
	

}
