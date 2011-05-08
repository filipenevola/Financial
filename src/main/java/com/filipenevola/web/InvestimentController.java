package com.filipenevola.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.filipenevola.model.Investiment;
import com.filipenevola.model.Users;
import com.filipenevola.service.InvestimentService;
import com.filipenevola.util.Util;

/**
 * Controller - Spring
 * 
 * @author Filipe N�vola
 */
public class InvestimentController extends MultiActionController {
	private static Logger LOG = Logger.getLogger(InvestimentController.class);

	private InvestimentService investimentService;
	private Util util;

	public ModelAndView view(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try {
			Users user = util.getUserLogged(request);
			if (user == null) {
				return util.getModelMapError("Nobody logged.");
			}
			List<Investiment> investiments = investimentService
					.getInvestimentList(user);
			return util.getModelMap(investiments);
		} catch (Exception e) {
			LOG.error("Error trying to retrieve investiments.", e);
			return util
					.getModelMapError("Error trying to retrieve investiments.");
		}
	}

	public ModelAndView create(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try {
			Object data = request.getParameter("data");
			Users user = util.getUserLogged(request);
			if (user == null) {
				return util.getModelMapError("Nobody logged.");
			}
			List<Investiment> investiments = investimentService.create(data, user);
			return util.getModelMap(investiments);
		} catch (Exception e) {
			LOG.error("Error trying to create investiments.", e);
			return util.getModelMapError("Error trying to create investiment.");
		}
	}

	public ModelAndView update(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try {
			Object data = request.getParameter("data");
			List<Investiment> investiments = investimentService.update(data);
			return util.getModelMap(investiments);
		} catch (Exception e) {
			LOG.error("Error trying to update investiments.", e);
			return util.getModelMapError("Error trying to update investiment.");
		}
	}

	public ModelAndView delete(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try {
			String data = request.getParameter("data");
			investimentService.delete(data);
			Map<String, Object> modelMap = new HashMap<String, Object>(1);
			modelMap.put("success", true);
			return new ModelAndView("jsonView", modelMap);
		} catch (Exception e) {
			LOG.error("Error trying to delete investiments.", e);
			return util.getModelMapError("Error trying to delete investiment.");
		}
	}

	/**
	 * Spring use - DI
	 * 
	 * @param dadoService
	 */
	public void setInvestimentService(InvestimentService investimentService) {
		this.investimentService = investimentService;
	}

	/**
	 * Spring use - DI
	 * 
	 * @param util
	 */
	public void setUtil(Util util) {
		this.util = util;
	}
}
