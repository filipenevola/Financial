package com.filipenevola.chart;

public class DataItem {

	private Double data;
	private String name;

	public DataItem(Double data, String name) {
		super();
		this.data = data;
		this.name = name;
	}

	public Double getData() {
		return data;
	}

	public void setData(Double data) {
		this.data = data;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
