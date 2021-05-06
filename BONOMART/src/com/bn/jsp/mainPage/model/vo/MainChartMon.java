package com.bn.jsp.mainPage.model.vo;

public class MainChartMon {

	private int amount;
	private String month;
	
	public MainChartMon () {}
	
	public MainChartMon(int amount, String month) {
		super();
		this.amount = amount;
		this.month = month;
	}

	@Override
	public String toString() {
		return "MainChartMon [amount=" + amount + ", month=" + month + "]";
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}
	
	
	
	

	
	
}
