package com.bn.jsp.mainPage.model.vo;

public class MainOrderV {
	private String p_no;
	private String p_name;
	private int min_quan;
	private String c_no;
	private int p_quan;
	
	public MainOrderV() {
		
	}

	public MainOrderV(String p_no, String p_name, int min_quan, String c_no, int p_quan) {
		super();
		this.p_no = p_no;
		this.p_name = p_name;
		this.min_quan = min_quan;
		this.c_no = c_no;
		this.p_quan = p_quan;
	}

	public String getP_no() {
		return p_no;
	}

	public void setP_no(String p_no) {
		this.p_no = p_no;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public int getMin_quan() {
		return min_quan;
	}

	public void setMin_quan(int min_quan) {
		this.min_quan = min_quan;
	}


	public int getP_quan() {
		return p_quan;
	}

	public String getC_no() {
		return c_no;
	}

	public void setC_no(String c_no) {
		this.c_no = c_no;
	}

	public void setP_quan(int p_quan) {
		this.p_quan = p_quan;
	}

	@Override
	public String toString() {
		return "MainOrderV [p_no=" + p_no + ", p_name=" + p_name + ", min_quan=" + min_quan + ", c_no=" + c_no
				+ ", p_quan=" + p_quan + "]";
	}


	
	
	
}
