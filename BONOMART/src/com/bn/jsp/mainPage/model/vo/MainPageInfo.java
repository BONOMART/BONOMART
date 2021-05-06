package com.bn.jsp.mainPage.model.vo;

import java.io.Serializable;

public class MainPageInfo implements Serializable{

	String date;
	String amount;
	
	public MainPageInfo() {
		super();
	}

	public MainPageInfo(String date, String amount) {
		super();
		this.date = date;
		this.amount = amount;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	
	
	
	
	
}
