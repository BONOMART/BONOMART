package com.bn.jsp.client.model.vo;

import java.io.Serializable;

public class Client implements Serializable {
	
	private static final long serialVersionUID = 1001L;

	private String c_no;
	private String c_name;
	private String c_manager;
	private String c_tel;
	private String c_address;
	private String b_code;
	private String b_title;
	private String c_account;
	
	public Client() {}
	


	public Client(String c_no, String c_name, String c_manager, String c_tel, String c_address, String b_code,
			String b_title, String c_account) {
		super();
		this.c_no = c_no;
		this.c_name = c_name;
		this.c_manager = c_manager;
		this.c_tel = c_tel;
		this.c_address = c_address;
		this.b_code = b_code;
		this.b_title = b_title;
		this.c_account = c_account;
	}



	public Client(String c_no, String c_name, String c_manager, String c_tel, String c_address, String b_title,
			String c_account) {
		super();
		this.c_no = c_no;
		this.c_name = c_name;
		this.c_manager = c_manager;
		this.c_tel = c_tel;
		this.c_address = c_address;
		this.b_title = b_title;
		this.c_account = c_account;
	}







	public String getB_title() {
		return b_title;
	}



	public void setB_title(String b_title) {
		this.b_title = b_title;
	}



	public String getC_no() {
		return c_no;
	}

	public void setC_no(String c_no) {
		this.c_no = c_no;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public String getC_manager() {
		return c_manager;
	}

	public void setC_manager(String c_manager) {
		this.c_manager = c_manager;
	}

	public String getC_tel() {
		return c_tel;
	}

	public void setC_tel(String c_tel) {
		this.c_tel = c_tel;
	}

	public String getC_address() {
		return c_address;
	}

	public void setC_address(String c_address) {
		this.c_address = c_address;
	}

	public String getB_code() {
		return b_code;
	}

	public void setB_code(String b_code) {
		this.b_code = b_code;
	}

	public String getC_account() {
		return c_account;
	}

	public void setC_account(String c_account) {
		this.c_account = c_account;
	}

	@Override
	public String toString() {
		return "Client [c_no=" + c_no + ", c_name=" + c_name + ", c_manager=" + c_manager + ", c_tel=" + c_tel
				+ ", c_address=" + c_address + ", b_code=" + b_code + ", c_account=" + c_account + "]";
	}
	
	
	
}
