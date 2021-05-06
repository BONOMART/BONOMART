package com.bn.jsp.admin.model.service;

import static com.bn.jsp.common.JDBCTemplate.*;


import java.sql.Connection;
import java.util.ArrayList;

import com.bn.jsp.admin.model.dao.adminDAO;
import com.bn.jsp.admin.model.vo.Member2;


public class adminService {
	
	private Connection con;
	private adminDAO dao = new adminDAO();
	
	// joinRequest 총게시글수 확인
	public int getListCountJR() {
		con = getConnection();
		
		int result = dao.getListCountJR(con);
		
		close(con);

		return result;
	}
	
	//joinRequest 리스트 가져오기
	public ArrayList<Member2> listJR(int currentPage) {
		
		con= getConnection();
		
		ArrayList<Member2> result = dao.listJR(con, currentPage );
		
		close(con);
		
		return result;
	}

	// 회원 승인요청 승인과 거절
	public int MemberOk(String accOk, int mno) {
		
		con = getConnection();
		
		int result = dao.MemberOk(con, accOk, mno);
		
		if(result > 0) commit(con);
		else rollback(con);

		close(con);
		
		return result;
	}
	
	// searhMemberList 총게시글수 확인
	public int getListCountSM(String type, String content) {
		con = getConnection();
		
		int result = dao.getListCountSM(con, type, content);
		
		close(con);
		
		return result;
	}

	// searhMemberList  리스트 가져오기
	public ArrayList<Member2> listSM(int currentPage, String type, String content) {
	con= getConnection();
		
		ArrayList<Member2> result = dao.listSM(con, currentPage,type, content );
		
		close(con);
		
		return result;
	}

	// searchMemberList null값일때 게시글수 가져오기
	public int getListCountad() {
		con = getConnection();
		
		int result = dao.getListCountad(con);
		
		close(con);

		return result;
	}
	
	// searchMemberList null값일때 리스트가져오기
	public ArrayList<Member2> searchOkMemberad(int currentPage) {
		
		con= getConnection();
		
		ArrayList<Member2> result = dao.searchOKMemberad(con, currentPage );
		
		close(con);
		
		return result;
	}
	
	//탈퇴 버튼
	public int MemberOut(int mno) {
		con = getConnection();
		
		int result = dao.MemberOut(con, mno);
		
		if(result > 0) commit(con);
		else rollback(con);

		close(con);
		
		return result;
	
	}

	
	


	}




