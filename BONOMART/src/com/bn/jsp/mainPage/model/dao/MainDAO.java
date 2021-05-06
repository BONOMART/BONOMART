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
import com.bn.jsp.mainPage.model.vo.MainOrderV;
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

	public MainPageInfo selectEarningDate(Connection con) {

		MainPageInfo mp = new MainPageInfo();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("D_selectEarning");
		
		try {
			ps = con.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			if ( rs.next() ) {
				
				mp.setDate(rs.getString("d_date"));
				mp.setAmount(rs.getString("d_amount"));
			}
			
			System.out.println(mp.getDate() + ", " + mp.getAmount());
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rs);
			close(ps);
		}
		
		return mp;
	}

	public MainPageInfo selectEarningMonth(Connection con) {
		
		MainPageInfo mp = new MainPageInfo();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("M_selectEarning");
		
		try {
			ps = con.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			if ( rs.next() ) {
				
				mp.setDate(rs.getString("month"));
				mp.setAmount(rs.getString("m_amount"));
			}
			
			System.out.println(mp.getDate() + ", " + mp.getAmount());
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rs);
			close(ps);
		}
		
		return mp;
	}

	public ArrayList<MainPageInfo> selectLatest5days(Connection con) {
		
		ArrayList<MainPageInfo> list = new ArrayList<>();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("D_latestSale");
		
		try {
			ps = con.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			while ( rs.next() ) {
				
				MainPageInfo mp = new MainPageInfo();
				
				mp.setDate(rs.getString("d_date"));
				mp.setAmount(rs.getString("d_amount"));
				
				list.add(mp);
			}
			
			System.out.println(list);
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rs);
			close(ps);
		}
		
		return list;
	}

	public ArrayList<MainOrderV> selectOrderList(Connection con) {
		ArrayList<MainOrderV> list = new ArrayList<MainOrderV>();
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("selectOrderList");
		
		try {
			
			ps=con.prepareStatement(sql);
			
			rs=ps.executeQuery();
			
			while(rs.next()) {
				MainOrderV m = new MainOrderV();
				m.setP_no(rs.getString(2));
				m.setP_name(rs.getString(3));
				m.setMin_quan(rs.getInt(4));
				m.setP_quan(rs.getInt(5));
				m.setC_no(rs.getString(6));
				
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(ps);
			
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
