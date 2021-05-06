package com.bn.jsp.mainPage.model.service;

import static com.bn.jsp.common.JDBCTemplate.close;
import static com.bn.jsp.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.bn.jsp.mainPage.controller.MainChartMonth;
import com.bn.jsp.mainPage.model.dao.MainDAO;
import com.bn.jsp.mainPage.model.vo.MainChartMon;
import com.bn.jsp.mainPage.model.vo.MainPageDonut;
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
