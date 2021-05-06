package com.bn.jsp.mainPage.model.dao;

import static com.bn.jsp.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.bn.jsp.mainPage.model.vo.MainChartMon;
import com.bn.jsp.mainPage.model.vo.MainPageDonut;
import com.bn.jsp.mainPage.model.vo.MainPageInfo;
import com.bn.jsp.sale.model.dao.SaleDAO;

public class MainDAO {
	
private Properties prop;
	
	public MainDAO() {
		// properties 파일에서 받아올 prop 객체 생성
		prop = new Properties();
		
		// properties 파일 경로
		String filePath = SaleDAO.class
								 .getResource("/config/main.properties")
								 .getPath();
		
		// filePath에 담은 경로로 파일 받아오기
		try {
			prop.load( new FileReader(filePath) );
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<MainPageInfo> selectEarning(Connection con) {

		ArrayList<MainPageInfo> list = new ArrayList<>();
		PreparedStatement ps1 = null, ps2 = null;
		ResultSet rs1 = null, rs2 = null;
		
		String sql1 = prop.getProperty("D_selectEarning");
		String sql2 = prop.getProperty("M_selectEarning");
		
		try {
			ps1 = con.prepareStatement(sql1);
			ps2 = con.prepareStatement(sql2);
			
			rs1 = ps1.executeQuery();
			rs2 = ps2.executeQuery();
			
			if ( rs1.next() ) {
				
				MainPageInfo mp1 = new MainPageInfo();
				
				mp1.setDate(rs1.getString("d_date"));
				mp1.setAmount(rs1.getString("d_amount"));
				
				list.add(mp1);
			}
			
			if ( rs2.next() ) {
				
				MainPageInfo mp2 = new MainPageInfo();
				
				mp2.setDate(rs2.getString("month"));
				mp2.setAmount(rs2.getString("m_amount"));
				
				list.add(mp2);
			}
			
			System.out.println(list);
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rs1);
			close(rs2);
			close(ps1);
			close(rs2);
		}
		
		return list;
	}

	public ArrayList<MainPageDonut> ChartDonut(Connection con) {
		ArrayList<MainPageDonut> list = new ArrayList<>();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("ChartDonut");
		
		
		try {
			ps = con.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				MainPageDonut m = new MainPageDonut();
				
				m.setS_quan(rs.getInt("s_quan"));
				m.setC_name(rs.getString("c_name"));
				list.add(m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(ps);
		}
		
		return list;
	}

	public ArrayList<MainChartMon> ChartMonth(Connection con) {
		ArrayList<MainChartMon> list = new ArrayList<>();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("ChartMonth");
		
		try {
			ps = con.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				MainChartMon m = new MainChartMon();
				
				m.setAmount(rs.getInt("m_amount"));
				m.setMonth(rs.getString("month"));
				
				list.add(m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
		
	}
}
