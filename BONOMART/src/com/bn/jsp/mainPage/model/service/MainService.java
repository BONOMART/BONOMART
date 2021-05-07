package com.bn.jsp.mainPage.model.service;

import static com.bn.jsp.common.JDBCTemplate.close;
import static com.bn.jsp.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.bn.jsp.mainPage.controller.MainChartMonth;
import com.bn.jsp.mainPage.model.dao.MainDAO;
import com.bn.jsp.mainPage.model.vo.MainOrderV;
import com.bn.jsp.mainPage.model.vo.MainChartMon;
import com.bn.jsp.mainPage.model.vo.MainPageDonut;
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

	public ArrayList<MainOrderV> selectOrderList() {
		con = getConnection();
		
		ArrayList<MainOrderV> list = dao.selectOrderList(con);
		
		close(con);
		
		return list;
	}

	public ArrayList<MainPageDonut> ChartDonut() {
		con = getConnection();
		
		ArrayList<MainPageDonut> list = dao.ChartDonut(con);
		
		close(con);
		
		return list;
	}

	public ArrayList<MainChartMon> ChartMonth() {
		con = getConnection();
		
		ArrayList<MainChartMon> list = dao.ChartMonth(con);
		
		close(con);
		
		return list;
	}
}
