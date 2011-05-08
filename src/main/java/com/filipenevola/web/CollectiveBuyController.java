package com.filipenevola.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.filipenevola.model.CollectiveBuy;
import com.filipenevola.model.Users;
import com.filipenevola.service.CollectiveBuyService;
import com.filipenevola.util.Util;

/**
 * Controller - Spring
 * 
 * @author Filipe Névola
 */
public class CollectiveBuyController extends MultiActionController {
	private static Logger LOG = Logger.getLogger(CollectiveBuyController.class);

	private CollectiveBuyService collectiveBuyService;
	private Util util;

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
			Integer total = collectiveBuyService.getTotalCollectiveBuy(user);
			List<CollectiveBuy> collectiveBuys = collectiveBuyService
					.getCollectiveBuyList(user, start, pageSize);
			return util.getModelMapPaging(collectiveBuys, total);
		} catch (Exception e) {
			LOG.error("Error trying to retrieve collectiveBuy.", e);
			return util
					.getModelMapError("Error trying to retrieve collectiveBuys.");
		}
	}

	public ModelAndView create(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try {
			Users user = util.getUserLogged(request);
			if (user == null) {
				return util.getModelMapError("Nobody logged.");
			}
			
			Object data = request.getParameter("data");
			List<CollectiveBuy> collectiveBuys = collectiveBuyService
					.create(data, user);
			return util.getModelMap(collectiveBuys);
		} catch (Exception e) {
			LOG.error("Error trying to create collectiveBuy.", e);
			return util
					.getModelMapError("Error trying to create collectiveBuy.");
		}
	}

	public ModelAndView update(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try {
			Users user = util.getUserLogged(request);
			if (user == null) {
				return util.getModelMapError("Nobody logged.");
			}
			
			Object data = request.getParameter("data");
			List<CollectiveBuy> collectiveBuys = collectiveBuyService
					.update(data, user);
			return util.getModelMap(collectiveBuys);
		} catch (Exception e) {
			LOG.error("Error trying to update collectiveBuy.", e);
			return util
					.getModelMapError("Error trying to update collectiveBuy.");
		}
	}

	public ModelAndView delete(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try {
			String data = request.getParameter("data");
			collectiveBuyService.delete(data);
			Map<String, Object> modelMap = new HashMap<String, Object>(1);
			modelMap.put("success", true);
			return new ModelAndView("jsonView", modelMap);
		} catch (Exception e) {
			LOG.error("Error trying to delete collectiveBuy.", e);
			return util
					.getModelMapError("Error trying to delete collectiveBuy.");
		}
	}

	public void setCollectiveBuyService(
			CollectiveBuyService collectiveBuyService) {
		this.collectiveBuyService = collectiveBuyService;
	}

	public void setUtil(Util util) {
		this.util = util;
	}
}
