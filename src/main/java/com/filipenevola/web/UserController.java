package com.filipenevola.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.filipenevola.model.Users;
import com.filipenevola.service.UserService;
import com.filipenevola.util.Util;

/**
 * @author Filipe Névola
 */
@Controller
public class UserController extends MultiActionController {
	private static Logger LOG = Logger.getLogger(UserController.class);

	@Autowired
	private UserService userService;
	@Autowired
	private Util util;

	public ModelAndView view(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try {
			List<Users> users = userService.getUserList();
			return util.getModelMap(users);
		} catch (Exception e) {
			LOG.error("Error trying to retrieve users.", e);
			return util.getModelMapError("Error trying to retrieve users.");
		}
	}

	public ModelAndView create(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try {
			Object data = request.getParameter("data");
			List<Users> users = userService.create(data);
			return util.getModelMap(users);
		} catch (Exception e) {
			LOG.error("Error trying to create users.", e);
			return util.getModelMapError("Error trying to create user.");
		}
	}

	public ModelAndView update(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try {
			Object data = request.getParameter("data");
			List<Users> users = userService.update(data);
			return util.getModelMap(users);
		} catch (Exception e) {
			LOG.error("Error trying to update users.", e);
			return util.getModelMapError("Error trying to update user.");
		}
	}

	public ModelAndView delete(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try {
			String data = request.getParameter("data");
			userService.delete(data);
			Map<String, Object> modelMap = new HashMap<String, Object>(1);
			modelMap.put("success", true);
			return new ModelAndView("jsonView", modelMap);
		} catch (Exception e) {
			LOG.error("Error trying to delete users.", e);
			return util.getModelMapError("Error trying to delete user.");
		}
	}

	public ModelAndView login(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try {
			Users user = new Users();
			user.setLogin(request.getParameter("login"));
			user.setPass(request.getParameter("pass"));

			user = userService.login(user);

			boolean loginSuccess = user != null;
			if (loginSuccess) {
				request.getSession().setAttribute("login", user);
			}

			Map<String, Object> modelMap = new HashMap<String, Object>();
			modelMap.put("success", loginSuccess);

			return new ModelAndView("jsonView", modelMap);
		} catch (Exception e) {
			LOG.error("Error trying to login user.", e);
			return util.getModelMapError("Error trying login user.");
		}
	}
}
