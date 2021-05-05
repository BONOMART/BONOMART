package com.bn.jsp.sale.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class SaleJoin implements Serializable{
	
	private int s_no;
	private Date s_date;
	private String p_no;
	private String p_name;
	private int s_quan;
	private int s_total;
	
	public SaleJoin() {
		super();
	}

	public SaleJoin(int s_no, Date s_date, String p_no, String p_name, int s_quan, int s_total) {
		super();
		this.s_no = s_no;
		this.s_date = s_date;
		this.p_no = p_no;
		this.p_name = p_name;
		this.s_quan = s_quan;
		this.s_total = s_total;
	}

	public int getS_no() {
		return s_no;
	}

	public void setS_no(int s_no) {
		this.s_no = s_no;
	}

	public Date getS_date() {
		return s_date;
	}

	public void setS_date(Date s_date) {
		this.s_date = s_date;
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

	public int getS_quan() {
		return s_quan;
	}

	public void setS_quan(int s_quan) {
		this.s_quan = s_quan;
	}

	public int getS_total() {
		return s_total;
	}

	public void setS_total(int s_total) {
		this.s_total = s_total;
	}
	
	
	
	
}    
