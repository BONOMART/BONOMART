package com.bn.jsp.product.model.vo;

public class C_name {
	
	private String c_no;
	private String c_name;
	
	
	public C_name () {}
	
	public C_name(String c_no, String c_name) {
		super();
		this.c_no = c_no;
		this.c_name = c_name;
	}

	@Override
	public String toString() {
		return "C_name [c_no=" + c_no + ", c_name=" + c_name + "]";
	}

	public String getC_no() {
		return c_no;
	}

	public void setC_no(String c_no) {
		this.c_no = c_no;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	
	
	
	
	
	
	
	
}
