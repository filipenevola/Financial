package com.filipenevola.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.filipenevola.dao.MoveDAO;
import com.filipenevola.model.Category;
import com.filipenevola.model.Move;
import com.filipenevola.model.Users;
import com.filipenevola.util.Util;

@Service
public class CalculationService {
	@Autowired
	private MoveDAO moveDAO;

	@Autowired
	private Util util;

	public List<Double> balanceMonth(Users user, String month) throws Exception {
		List<List<Move>> list = moveDAO.balanceMonth(user, month);
		List<Double> ret = new ArrayList<Double>();
		Double sumValueRec = 0.0;
		for (List<Move> l : list) {
			Double sumValue = 0.0;
			sumValueRec = 0.0;
			for (Move m : l) {
				/*
				 * if(ret.size() == 0) { System.out.println("Move: " +
				 * m.getDateOfMove()); } else { System.out.println("Pay: " +
				 * m.getDateOfPay()); }
				 */
				if (m.getCategory().getPay()) {
					sumValue += m.getValue();
				} else {
					sumValueRec += m.getValue();
				}
			}
			ret.add(sumValue);
		}
		ret.add(sumValueRec);

		return ret;
	}

	public String monthHtml(Users user, String month, boolean pay) {

		List<Category> list = moveDAO.month(user, month, pay);
		String color = pay ? "red" : "green";
		StringBuilder sb = new StringBuilder("<p style=\"line-height: 24pt; font-size: 16pt;\">");
		for (Category c : list) {
			sb.append("<b>");
			sb.append(c.getName());
			sb.append("</b>: R$ <font style=\"color: " + color + "\"> ");
			sb.append(util.getMoney(c.getValue()));
			sb.append("</font>");
			sb.append(" (");
			sb.append(c.getId());//number of occurencies
			sb.append(")<br/>");			
		}
		sb.append("</p>");
		return sb.toString();
	}
	

}
