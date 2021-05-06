package com.bn.jsp.order.model.vo;

import java.sql.Date;

public class OrderList {
	private int o_no;
	private String p_no;
	private String c_name;
	private String o_quan;
	private Date o_date;
	private int a_price;
	private String m_name;
	
	public OrderList() {
		
	}
	
	public OrderList(int o_no, String p_no, String c_name, String o_quan, Date o_date, int a_price, String m_name) {
		super();
		this.o_no = o_no;
		this.p_no = p_no;
		this.c_name = c_name;
		this.o_quan = o_quan;
		this.o_date = o_date;
		this.a_price = a_price;
		this.m_name = m_name;
	}

	@Override
	public String toString() {
		return "OrderList [o_no=" + o_no + ", p_no=" + p_no + ", c_name=" + c_name + ", o_quan=" + o_quan + ", o_date="
				+ o_date + ", a_price=" + a_price + ", m_name=" + m_name + "]";
	}

	public int getO_no() {
		return o_no;
	}
	public void setO_no(int o_no) {
		this.o_no = o_no;
	}
	public String getP_no() {
		return p_no;
	}
	public void setP_no(String p_no) {
		this.p_no = p_no;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getO_quan() {
		return o_quan;
	}
	public void setO_quan(String o_quan) {
		this.o_quan = o_quan;
	}
	public Date getO_date() {
		return o_date;
	}
	public void setO_date(Date o_date) {
		this.o_date = o_date;
	}
	public int getA_price() {
		return a_price;
	}
	public void setA_price(int a_price) {
		this.a_price = a_price;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
}
