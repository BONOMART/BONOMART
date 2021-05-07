package com.bn.jsp.member.model.vo;

import java.io.Serializable;

// VO (Value Object)
// DB에 데이터를 전달할 역할을 하는 클래스
public class Member implements Serializable{

	/**
	 * 만약 다른 위치에 정의된 Member 클래스가 존재한다면
	 * 현재 위치에 정의된 Member 클래스와 헷갈리지 않도록
	 * 고유 번호를 부여 해주는 것
	 */
	private static final long serialVersionUID = 1L;

	// 1. 회원가입에 사용 될 필드 변수
	
	private int userNo;
	private String userName;
	private String userId;
	private String userPwd;
	private String email;
	private String phone;
	private String dCode;				// 부서 코드
	private String jCode;				// 직급 코드
	private String authority;			// 권한
	private char joinAccess;			// 가입 승인 여부
	private String mdate;
	
	// 2. 생성자
	public Member() {}
	
	public Member(int userNo, String userName, String userId, String userPwd, String email, String phone,
			String dCode, String jCode, String authority, char joinAccess, String mdate) {
		super();
		this.userNo = userNo;
		this.userName = userName;
		this.userId = userId;
		this.userPwd = userPwd;
		this.email = email;
		this.phone = phone;
		this.dCode = dCode;
		this.jCode = jCode;
		this.authority = authority;
		this.joinAccess = joinAccess;
		this.mdate = mdate;
	}

	public Member(String userName, String userId, String userPwd, String email, String phone,
			String dCode, String jCode, String authority, char joinAccess) {
		super();
		this.userName = userName;
		this.userId = userId;
		this.userPwd = userPwd;
		this.email = email;
		this.phone = phone;
		this.dCode = dCode;
		this.jCode = jCode;
		this.authority = authority;
		this.joinAccess = joinAccess;
	}

	// 아이디와 비밀번호 만을 초기화할 생성자 오버로딩.
	public Member(String userId, String userPwd) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
	}
	
	
	// 3. 메소드
	
	// toString
	@Override
	public String toString() {
		return "Member [userNo="+ userNo + ", userName=" + userName + ", userId=" + userId + ", userPwd=" + userPwd 
				+ ", email=" + email + ", phone=" + phone + ", dCode=" + dCode + ", jCode=" + jCode
				+  ", authority=" + authority + ", joinAccess=" + joinAccess + "]";
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

	public String getdCode() {
		return dCode;
	}

	public void setdCode(String dCode) {
		this.dCode = dCode;
	}

	public String getjCode() {
		return jCode;
	}

	public void setjCode(String jCode) {
		this.jCode = jCode;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public char getJoinAccess() {
		return joinAccess;
	}

	public void setJoinAccess(char joinAccess) {
		this.joinAccess = joinAccess;
	}

	public String getMdate() {
		return mdate;
	}

	public void setMdate(String mdate) {
		this.mdate = mdate;
	}



}

