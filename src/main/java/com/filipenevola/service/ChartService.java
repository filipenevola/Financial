package com.filipenevola.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.CategoryLabelPosition;
import org.jfree.chart.axis.CategoryLabelPositions;
import org.jfree.chart.axis.CategoryLabelWidthType;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.text.TextBlockAnchor;
import org.jfree.ui.RectangleAnchor;
import org.jfree.ui.TextAnchor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.filipenevola.chart.CategoryPay;
import com.filipenevola.dao.MoveDAO;
import com.filipenevola.model.Move;
import com.filipenevola.model.Users;
import com.filipenevola.util.Util;

@Service
public class ChartService {
	private static Logger LOG = Logger.getLogger(ChartService.class);
	@Autowired
	private MoveDAO moveDAO;
	@Autowired
	private Util util;

	public void setMoveDAO(MoveDAO moveDAO) {
		this.moveDAO = moveDAO;
	}

	public List<CategoryPay> getCategoryPayList(Users user) {
		List<CategoryPay> ret = new ArrayList<CategoryPay>();

		List<Move> moves = (List<Move>) moveDAO.findMoveOrderCategory(user);
		CategoryPay cat = null;
		boolean newCat = true;
		for (Move m : moves) {
			if (!newCat && !cat.getCategory().equals(m.getCategory().getName())) {
				// Add when change category
				ret.add(cat);
				newCat = true;
			}
			if (newCat) {
				newCat = false;
				cat = new CategoryPay();
				cat.setCategory(m.getCategory().getName());
				cat.setShortCategory(m.getCategory().getName());
				cat.setPay(m.getCategory().getValue());
				cat.setTotal(0.0);
			}
			cat.setTotal(cat.getTotal() + m.getValue());
		}
		// Add last category
		ret.add(cat);

		return ret;
	}

	public List<CategoryPay> getCategoryPayListBetweenDates(Users user,
			Object startDt, Object endDt) {
		Double totalOfPlanned = 0.0;
		Double totalOfSpent = 0.0;
		List<CategoryPay> ret = new ArrayList<CategoryPay>();

		String month = util.getFormatedStringTodayDate().split("/")[0];
		String year = util.getFormatedStringTodayDate().split("/")[2];
		
		String startDefault = month + "/01/" + year;
		String endDefault = month + "/31/" + year;
		
		String start = (startDt == null || endDt.toString().length() == 0) ? startDefault : (String) startDt;
		String end = (endDt == null || endDt.toString().length() == 0) ? endDefault : (String) endDt;

		LOG.info("Will search between " + start + " and " + end);
		List<Move> moves = (List<Move>) moveDAO
				.findMoveOrderCategoryBetweenDates(user, start, end);
		CategoryPay cat = null;
		boolean newCat = true;
		for (Move m : moves) {
			if (!newCat && !cat.getCategory().equals(m.getCategory().getName())) {
				// Add when change category
				cat.setShortCategory(cat.getShortCategory() + " ("
						+ util.getPercent(cat.getTotal() / cat.getPay() * 100)
						+ ")");
				ret.add(cat);
				totalOfSpent += cat.getTotal();
				newCat = true;
			}
			if (newCat) {
				newCat = false;
				cat = new CategoryPay();
				cat.setCategory(m.getCategory().getName());
				cat.setShortCategory(m.getCategory().getName());
				cat.setPay(m.getCategory().getValue());
				cat.setTotal(0.0);
				totalOfPlanned += m.getCategory().getValue();
			}
			cat.setTotal(cat.getTotal() + m.getValue());
		}
		// Add last category
		if (moves != null && moves.size() > 0) {
			cat.setShortCategory(cat.getShortCategory() + " ("
					+ util.getPercent(cat.getTotal() / cat.getPay() * 100)
					+ ")");
			ret.add(cat);
			totalOfSpent += cat.getTotal();
		}

		cat = new CategoryPay();
		cat.setPay(totalOfPlanned);
		cat.setTotal(totalOfSpent);
		cat.setCategory("total");
		cat.setShortCategory("total" + " ("
				+ util.getPercent(cat.getTotal() / cat.getPay() * 100) + ")");
		ret.add(cat);

		return ret;
	}

	public JFreeChart createBarChart(Users user, Object startDt, Object endDt) {
		List<CategoryPay> list = getCategoryPayListBetweenDates(user, startDt,
				endDt);
		list.remove(list.size() - 1);
		// create the chart...
		final DefaultCategoryDataset dataset = new DefaultCategoryDataset();
		for (CategoryPay c : list) {
			dataset.addValue(c.getPay(), "Planned", c.getShortCategory());
			dataset.addValue(c.getTotal(), "Pay", c.getShortCategory());
		}

		final JFreeChart chart = createChart(dataset);

		return chart;

	}
	private JFreeChart createChart(final CategoryDataset dataset) {

		final JFreeChart chart = ChartFactory.createBarChart3D(
				"Pay per Category (just with Move\'s)", // chart title
				"Category", // domain axis label
				"Value", // range axis label
				dataset, // data
				PlotOrientation.HORIZONTAL, // orientation
				true, // include legend
				true, // tooltips
				false // urls
				);

		final CategoryPlot plot = chart.getCategoryPlot();
		plot.setForegroundAlpha(1.0f);

		// left align the category labels...
		final CategoryAxis axis = plot.getDomainAxis();
		final CategoryLabelPositions p = axis.getCategoryLabelPositions();

		final CategoryLabelPosition left = new CategoryLabelPosition(
				RectangleAnchor.LEFT, TextBlockAnchor.CENTER_LEFT,
				TextAnchor.CENTER_LEFT, 0.0, CategoryLabelWidthType.RANGE,
				0.30f);
		axis.setCategoryLabelPositions(CategoryLabelPositions
				.replaceLeftPosition(p, left));

		return chart;

	}

}
