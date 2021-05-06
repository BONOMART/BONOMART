package com.bn.jsp.product.model.vo;

import java.io.Serializable;

public class G_name  implements Serializable{
	
	private static final long serialVersionUID = 1001L;
	
	private String g_name;
	private String g_code;
	
	
	
	public G_name () {}
	
	public G_name(String g_name, String g_code) {
		super();
		this.g_name = g_name;
		this.g_code = g_code;
	}

	
	

	public G_name(String g_name, String g_code, String c_name, String c_code) {
		super();
		this.g_name = g_name;
		this.g_code = g_code;

	}

	

	@Override
	public String toString() {
		return "G_name [g_name=" + g_name + ", g_code=" + g_code + "]";
	}

	public String getG_name() {
		return g_name;
	}

	public void setG_name(String g_name) {
		this.g_name = g_name;
	}

	public String getG_code() {
		return g_code;
	}

	public void setG_code(String g_code) {
		this.g_code = g_code;
	}

	
	
	
	
	
	
	
	
	
	
	
	
}	