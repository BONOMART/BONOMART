package com.bn.jsp.mainPage.model.vo;

public class MainPageDonut {
	private int s_quan;
	private String c_name;

	public MainPageDonut () {};
	
	

	public MainPageDonut(int s_quan, String c_name) {
		super();
		this.s_quan = s_quan;
		this.c_name = c_name;
	}

	


	@Override
	public String toString() {
		return "MainPageDonut [s_quan=" + s_quan + ", c_name=" + c_name + "]";
	}



	public String getC_name() {
		return c_name;
	}



	public void setC_name(String c_name) {
		this.c_name = c_name;
	}



	public int getS_quan() {
		return s_quan;
	}

	public void setS_quan(int s_quan) {
		this.s_quan = s_quan;
	}
	
	
}
