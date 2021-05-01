package com.bn.jsp.product.model.vo;

import java.io.Serializable;

public class Product implements Serializable {

	private static final long serialVersionUID = 1001L;
	
	private int p_no;
	private String p_name;
	private int r_price;
	private int s_price;
	private int min_quan;
	private String p_status;
	private String g_code;
	private String c_no;
	
	
	public Product () {}
	
	public Product(int p_no, String p_name, int r_price, int s_price, int min_quan, String p_status, String g_code,
			String c_no) {
		super();
		this.p_no = p_no;
		this.p_name = p_name;
		this.r_price = r_price;
		this.s_price = s_price;
		this.min_quan = min_quan;
		this.p_status = p_status;
		this.g_code = g_code;
		this.c_no = c_no;
	}

	


	@Override
	public String toString() {
		return "Product [p_no=" + p_no + ", p_name=" + p_name + ", r_price=" + r_price + ", s_price=" + s_price
				+ ", min_quan=" + min_quan + ", p_status=" + p_status + ", g_code=" + g_code + ", c_no=" + c_no + "]";
	}
	
	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public int getR_price() {
		return r_price;
	}

	public void setR_price(int r_price) {
		this.r_price = r_price;
	}

	public int getS_price() {
		return s_price;
	}

	public void setS_price(int s_price) {
		this.s_price = s_price;
	}

	public int getMin_quan() {
		return min_quan;
	}

	public void setMin_quan(int min_quan) {
		this.min_quan = min_quan;
	}

	public String getP_status() {
		return p_status;
	}

	public void setP_status(String p_status) {
		this.p_status = p_status;
	}

	public String getG_code() {
		return g_code;
	}

	public void setG_code(String g_code) {
		this.g_code = g_code;
	}

	public String getC_no() {
		return c_no;
	}

	public void setC_no(String c_no) {
		this.c_no = c_no;
	}

	
	
	
	
}
