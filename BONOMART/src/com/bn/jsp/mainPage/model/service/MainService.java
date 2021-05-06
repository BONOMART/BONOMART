package com.bn.jsp.mainPage.model.service;

import static com.bn.jsp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.bn.jsp.mainPage.model.dao.MainDAO;
import com.bn.jsp.mainPage.model.vo.MainPageInfo;

public class MainService {

	private Connection con;
	
	private MainDAO dao = new MainDAO();

	public ArrayList<MainPageInfo> selectEarning() {

		con = getConnection();
		
		ArrayList<MainPageInfo> list = dao.selectEarning(con);
		
		close(con);
		
		return list;
	}
}
