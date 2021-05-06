package com.bn.jsp.client.model.vo;

import java.io.Serializable;

public class Bank implements Serializable {
	
	private static final long serialVersionUID = 1001L;
	
	private String b_code;
	private String b_title;
	
	public Bank() {}
	
	public Bank(String b_code, String b_title) {
		this.b_code = b_code;
		this.b_title = b_title;
	}

	@Override
	public String toString() {
		return "Bank [b_code=" + b_code + ", b_title=" + b_title + "]";
	}
	
	public String getB_code() {
		return b_code;
	}

	public void setB_code(String b_code) {
		this.b_code = b_code;
	}


	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	
	
}
