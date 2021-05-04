package com.bn.jsp.admin.model.service;

import static com.bn.jsp.common.JDBCTemplate.*;


import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.bn.jsp.admin.model.dao.adminDAO;
import com.bn.jsp.admin.model.vo.Member;


public class adminService {
	
	private Connection con;
	private adminDAO dao = new adminDAO();

	public List<Member> searchMember(String type, String content, int currentPage) {
		
		con = getConnection();
		
		List<Member> result = dao.searchMember(con, type, content, currentPage);
		
		close(con);
		
		return result ;
	}

	public ArrayList<Member> searchOkMember(int currentPage) {
		
		con= getConnection();
		
		ArrayList<Member> result = dao.searchOKMember(con, currentPage );
		
		close(con);
		
		return result;
	}
	

	public int MemberOk(String accOk, int mno) {
		
		con = getConnection();
		
		int result = dao.MemberOk(con, accOk, mno);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public int MemberNo(String accOk, int mno) {
		con = getConnection();
		
		int result = dao.MemberNo(con, accOk, mno);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public int getListCount() {
		con = getConnection();
		
		int result = dao.getListCount(con);
		
		close(con);

		return result;
	}

	public int getListCount2(String type, String content) {
		con = getConnection();
		
		int result = dao.getListCount2(con, type, content);
		
		close(con);
		
		return result;
	}



}
