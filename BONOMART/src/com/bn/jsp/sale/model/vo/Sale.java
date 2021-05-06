package com.bn.jsp.sale.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Sale implements Serializable {

	private static final long serialVersionUID = 2001L;
	
	private int s_no;
	private String p_no;
	private int s_quan;
	private Date s_date;
	
	public Sale() {
		super();
	}

	public Sale(int s_no, String p_no, int s_quan, Date s_date) {
		super();
		this.s_no = s_no;
		this.p_no = p_no;
		this.s_quan = s_quan;
		this.s_date = s_date;
	}

	public Sale(String p_no, int s_quan, Date s_date) {
		super();
		this.p_no = p_no;
		this.s_quan = s_quan;
		this.s_date = s_date;
	}
	
	public Sale(int s_no, int s_quan) {
		super();
		this.s_no = s_no;
		this.s_quan = s_quan;
	}

	@Override
	public String toString() {
		return "Sale [s_no=" + s_no + ", p_no=" + p_no + ", s_quan=" + s_quan + ", s_date=" + s_date + "]";
	}

	public int getS_no() {
		return s_no;
	}

	public void setS_no(int s_no) {
		this.s_no = s_no;
	}

	public String getP_no() {
		return p_no;
	}

	public void setP_no(String p_no) {
		this.p_no = p_no;
	}

	public int getS_quan() {
		return s_quan;
	}

	public void setS_quan(int s_quan) {
		this.s_quan = s_quan;
	}

	public Date getS_date() {
		return s_date;
	}

	public void setS_date(Date s_date) {
		this.s_date = s_date;
	} 
	
	
	
	
	
	
	
}
