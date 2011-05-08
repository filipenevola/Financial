package com.filipenevola.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.filipenevola.model.TypeOfPay;
import com.filipenevola.model.Users;
import com.filipenevola.service.TypeOfPayService;
import com.filipenevola.service.UserService;
import com.filipenevola.util.Util;

/**
 * Controller - Spring
 * 
 * @author Filipe Névola
 */
public class TypeOfPayController extends MultiActionController {
	private static Logger LOG = Logger.getLogger(TypeOfPayController.class);

	private TypeOfPayService typeOfPayService;
	private UserService userService;
	private Util util;

	public ModelAndView view(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try {			
			Users user = util.getUserLogged(request);
			if(user == null) {
				return util.getModelMapError("Nobody logged.");
			}
			List<TypeOfPay> typeOfPays = typeOfPayService.getTypeOfPayList(user);
			return util.getModelMap(typeOfPays);
		} catch (Exception e) {
			LOG.error("Error trying to retrieve typeOfPays.", e);
			return util.getModelMapError("Error trying to retrieve typeOfPays.");
		}
	}
	private void logar(HttpServletRequest request) {
		Users user = new Users();
//		user.setLogin(request.getParameter("login"));
//		user.setPass(request.getParameter("pass"));

		user.setLogin("f");
		user.setPass("zxc");
		
		user = userService.login(user);
		
		boolean loginSuccess = user != null;
		if (loginSuccess) {
			request.getSession().setAttribute("login", user);
		}
	}
	public ModelAndView viewFromForm(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logar(request);
		return view(request, response);
	}
	public ModelAndView create(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try {
			Object data = request.getParameter("data");
			Users user = util.getUserLogged(request);
			if(user == null) {
				return util.getModelMapError("Nobody logged.");
			}
			List<TypeOfPay> typeOfPays = typeOfPayService.create(data, user);
			return util.getModelMap(typeOfPays);
		} catch (Exception e) {
			LOG.error("Error trying to create typeOfPays.", e);
			return util.getModelMapError("Error trying to create typeOfPay.");
		}
	}

	public ModelAndView update(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try {
			Object data = request.getParameter("data");
			Users user = util.getUserLogged(request);
			if(user == null) {
				return util.getModelMapError("Nobody logged.");
			}
			List<TypeOfPay> typeOfPays = typeOfPayService.update(data, user);
			return util.getModelMap(typeOfPays);
		} catch (Exception e) {
			LOG.error("Error trying to update typeOfPays.", e);
			return util.getModelMapError("Error trying to update typeOfPay.");
		}
	}

	public ModelAndView delete(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try {
			String data = request.getParameter("data");
			typeOfPayService.delete(data);
			Map<String, Object> modelMap = new HashMap<String, Object>(1);
			modelMap.put("success", true);
			return new ModelAndView("jsonView", modelMap);
		} catch (Exception e) {
			LOG.error("Error trying to delete typeOfPays.", e);
			return util.getModelMapError("Error trying to delete typeOfPay.");
		}
	}

	/**
	 * Spring use - DI
	 * 
	 * @param dadoService
	 */
	public void setTypeOfPayService(TypeOfPayService typeOfPayService) {
		this.typeOfPayService = typeOfPayService;
	}



	/**
	 * Spring use - DI
	 * 
	 * @param dadoService
	 */
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	/**
	 * Spring use - DI
	 * @param util
	 */
	public void setUtil(Util util) {
		this.util = util;
	}
}
