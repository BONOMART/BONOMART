package com.bn.jsp.product.model.vo;

public class G_name {
	private String g_name;

	public G_name () {} 
	
	public G_name(String g_name) {
		super();
		this.g_name = g_name;
	}

	@Override
	public String toString() {
		return "G_name [g_name=" + g_name + "]";
	}

	public String getG_name() {
		return g_name;
	}

	public void setG_name(String g_name) {
		this.g_name = g_name;
	}
	
	
}
