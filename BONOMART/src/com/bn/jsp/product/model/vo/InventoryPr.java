package com.bn.jsp.product.model.vo;

import java.io.Serializable;

public class InventoryPr  implements Serializable{

	private static final long serialVersionUID = 1001L;
	
	private String P_no;
	private int p_quan;
	
	public InventoryPr () {};
	
	public InventoryPr(String p_no, int p_quan) {
		super();
		P_no = p_no;
		this.p_quan = p_quan;
	}

	@Override
	public String toString() {
		return "InventoryPr [P_no=" + P_no + ", p_quan=" + p_quan + "]";
	}

	public String getP_no() {
		return P_no;
	}

	public void setP_no(String p_no) {
		P_no = p_no;
	}

	public int getP_quan() {
		return p_quan;
	}

	public void setP_quan(int p_quan) {
		this.p_quan = p_quan;
	}
	
	
	
	
}
