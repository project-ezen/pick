package com.edu.shopping.dto;

import java.sql.Date;
import java.text.DateFormat;
//import java.text.SimpleDateFormat;

public class OrderSearch extends OrderPageCriterion {
	private String startDate;
	private String endDate;
	
	public String getStartDate() {
//		DateFormat dtFormat = new SimpleDateFormat("yy/MM/dd");
//		
//		Date date = dtFormat.parse(startDate);
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	@Override
	public String toString() {
		return "OrderSearch [startDate=" + startDate + ", endDate=" + endDate + "]";
	}
}
