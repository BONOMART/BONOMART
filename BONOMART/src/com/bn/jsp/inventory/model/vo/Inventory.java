package com.bn.jsp.inventory.model.vo;

public class Inventory {
	
	private String p_no;
	private String p_group;
	private String p_name;
	private String p_client;
	private int p_quan;
	private String type;
	private String content;
	
	
	
	public Inventory() {
		super();
	}


	public Inventory(String p_no, String p_group, String p_name, String p_client, int p_quan) {
		super();
		this.p_no = p_no;
		this.p_group = p_group;
		this.p_name = p_name;
		this.p_client = p_client;
		this.p_quan = p_quan;
	}


	public Inventory(String p_no, String p_group, String p_name, String p_client, int p_quan, String type,
			String content) {
		super();
		this.p_no = p_no;
		this.p_group = p_group;
		this.p_name = p_name;
		this.p_client = p_client;
		this.p_quan = p_quan;
		this.type = type;
		this.content = content;
	}




	public Inventory(String p_no, int p_quan) {
		super();
		this.p_no = p_no;
		this.p_quan = p_quan;
	}


	@Override
	public String toString() {
		return "Inventory [p_no=" + p_no + ", p_group=" + p_group + ", p_name=" + p_name + ", p_client=" + p_client
				+ ", p_quan=" + p_quan + ", type=" + type + ", content=" + content + "]";
	}


	public String getP_no() {
		return p_no;
	}


	public void setP_no(String p_no) {
		this.p_no = p_no;
	}


	public String getP_group() {
		return p_group;
	}


	public void setP_group(String p_group) {
		this.p_group = p_group;
	}


	public String getP_name() {
		return p_name;
	}


	public void setP_name(String p_name) {
		this.p_name = p_name;
	}


	public String getP_client() {
		return p_client;
	}


	public void setP_client(String p_client) {
		this.p_client = p_client;
	}


	public int getP_quan() {
		return p_quan;
	}


	public void setP_quan(int p_quan) {
		this.p_quan = p_quan;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}
	
	

}
