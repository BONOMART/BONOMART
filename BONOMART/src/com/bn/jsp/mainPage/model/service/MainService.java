package com.bn.jsp.mainPage.model.service;

import static com.bn.jsp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.bn.jsp.mainPage.model.dao.MainDAO;
import com.bn.jsp.mainPage.model.vo.MainPageInfo;

public class MainService {

	private Connection con;
	
	private MainDAO dao = new MainDAO();

	public MainPageInfo selectEarningDate() {

		con = getConnection();
		
		MainPageInfo mp = dao.selectEarningDate(con);
		
		close(con);
		
		return mp;
	}

	public MainPageInfo selectEarningMonth() {
		
		con = getConnection();
		
		MainPageInfo mp = dao.selectEarningMonth(con);
		
		close(con);
		
		return mp;
	}

	public ArrayList<MainPageInfo> selectLatest5days() {
		
		con = getConnection();
		
		ArrayList<MainPageInfo> list = dao.selectLatest5days(con);
		
		close(con);
		
		return list;
	}
}
