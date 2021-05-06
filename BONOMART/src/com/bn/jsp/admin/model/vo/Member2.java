package com.bn.jsp.admin.model.vo;

import java.io.Serializable;

public class Member2 implements Serializable  {
	
	private static final long serialVersionUID = 1100L;
	
	private int userNo;
	private String userName;
	private String	userId;
	private String userPwd;
	private String email;
	private String phone;
	private String dept;
	private String job;
	private String access;
	private String joinacc;
	private String type;
	private String content;
	
	
	public Member2() {
		super();
	}






	public Member2(int userNo, String userName, String userId, String userPwd, String email, String phone, String dept,
			String job, String access, String joinacc, String type, String content) {
		super();
		this.userNo = userNo;
		this.userName = userName;
		this.userId = userId;
		this.userPwd = userPwd;
		this.email = email;
		this.phone = phone;
		this.dept = dept;
		this.job = job;
		this.access = access;
		this.joinacc = joinacc;
		this.type = type;
		this.content = content;
	}



	public Member2(int userNo, String userName, String userId, String userPwd, String email, String phone, String dept,
			String job, String access, String joinacc) {
		super();
		this.userNo = userNo;
		this.userName = userName;
		this.userId = userId;
		this.userPwd = userPwd;
		this.email = email;
		this.phone = phone;
		this.dept = dept;
		this.job = job;
		this.access = access;
		this.joinacc = joinacc;
	}



	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userName=" + userName + ", userId=" + userId + ", userPwd=" + userPwd
				+ ", email=" + email + ", phone=" + phone + ", dept=" + dept + ", job=" + job + ", access=" + access
				+ ", joinacc=" + joinacc + "]";
	}



	public int getUserNo() {
		return userNo;
	}



	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}



	public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
	}



	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}



	public String getUserPwd() {
		return userPwd;
	}



	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getPhone() {
		return phone;
	}



	public void setPhone(String phone) {
		this.phone = phone;
	}



	public String getDept() {
		return dept;
	}



	public void setDept(String dept) {
		this.dept = dept;
	}



	public String getJob() {
		return job;
	}



	public void setJob(String job) {
		this.job = job;
	}



	public String getAccess() {
		return access;
	}



	public void setAccess(String access) {
		this.access = access;
	}



	public String getJoinacc() {
		return joinacc;
	}



	public void setJoinacc(String joinacc) {
		this.joinacc = joinacc;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
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
