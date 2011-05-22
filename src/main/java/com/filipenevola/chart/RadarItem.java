package com.filipenevola.chart;

import java.util.List;

public class RadarItem {

	private String monthYear;
	private List<RadarItemCategory> list;

	public String getMonthYear() {
		return monthYear;
	}

	public void setMonthYear(String monthYear) {
		this.monthYear = monthYear;
	}

	public void setList(List<RadarItemCategory> list) {
		this.list = list;
	}

	public List<RadarItemCategory> getList() {
		return list;
	}


}
