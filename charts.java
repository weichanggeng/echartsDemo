package com.chart.model;
/**
*@author WCG
*@date: 2019年3月8日 上午10:25:56
*/
public class charts {
	
	private int value;
	
	private String name;

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public charts(int value,String name) {
		this.value = value;
		this.name = name;
	}
}
