package com.bn.jsp.product.model.vo;

import java.io.Serializable;

public class ProductIn implements Serializable {

	private static final long serialVersionUID = 1001L;
	
	private String p_no;
	private String g_code;
	private String p_name;
	private int min_quan;
	private int r_price;
	private int s_price;
	
	public ProductIn () {}
	
	public ProductIn(String p_no, String g_code, String p_name, int min_quan, int r_price, int s_price) {
		super();
		this.p_no = p_no;
		this.g_code = g_code;
		this.p_name = p_name;
		this.min_quan = min_quan;
		this.r_price = r_price;
		this.s_price = s_price;
	}

	@Override
	public String toString() {
		return "ProductInsert [p_no=" + p_no + ", g_code=" + g_code + ", p_name=" + p_name + ", min_quan=" + min_quan
				+ ", r_price=" + r_price + ", s_price=" + s_price + "]";
	}

	public String getP_no() {
		return p_no;
	}

	public void setP_no(String p_no) {
		this.p_no = p_no;
	}

	public String getG_code() {
		return g_code;
	}

	public void setG_code(String g_code) {
		this.g_code = g_code;
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
	
	
	
	
}
