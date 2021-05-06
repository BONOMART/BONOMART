package com.bn.jsp.order.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Order implements Serializable {

	private static final long serialVersionUID = 1000L;

	private int o_no; // 발주번호
	private String o_quan; // 발주수량
	private Date o_date; // 발주날짜
	private String o_status; // 사용처리
	private String p_no; // 상품번호
	private String c_no; // 거래처코드
	private int m_no; // 회원번호
	private String m_name; // member name
	
	public Order() {

	}
	
	public Order(String o_quan, Date o_date, String o_status, String p_no, int m_no, String c_no) {
		super();
		this.o_quan = o_quan;
		this.o_date = o_date;
		this.o_status = o_status;
		this.p_no = p_no;
		this.m_no = m_no;
		this.c_no = c_no;
	}

	public Order(int o_no, String o_quan, Date o_date, String o_status, String p_no, int m_no) {
		super();
		this.o_no = o_no;
		this.o_quan = o_quan;
		this.o_date = o_date;
		this.o_status = o_status;
		this.p_no = p_no;
		this.m_no = m_no;
	}

	public Order(int o_no, String o_quan) {
		this.o_no = o_no;
		this.o_quan = o_quan;
	}

	@Override
	public String toString() {
		return "Order [o_no=" + o_no + ", o_quan=" + o_quan + ", o_date=" + o_date + ", o_status=" + o_status
				+ ", p_no=" + p_no + ", c_no=" + c_no + ", m_no=" + m_no + ", m_name=" + m_name + "]";
	}

	public int getO_no() {
		return o_no;
	}

	public void setO_no(int o_no) {
		this.o_no = o_no;
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

	public String getO_status() {
		return o_status;
	}

	public void setO_status(String o_status) {
		this.o_status = o_status;
	}

	public String getP_no() {
		return p_no;
	}

	public void setP_no(String p_no) {
		this.p_no = p_no;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getC_no() {
		return c_no;
	}

	public void setC_no(String c_no) {
		this.c_no = c_no;
	}

	public String getm_name() {
		return m_name;
	}

	public void setm_name(String m_name) {
		this.m_name = m_name;
	}

}
