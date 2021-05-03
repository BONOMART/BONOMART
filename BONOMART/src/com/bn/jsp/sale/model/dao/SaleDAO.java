package com.bn.jsp.sale.model.dao;

import java.io.FileReader;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.bn.jsp.sale.model.vo.Sale;
import com.bn.jsp.sale.model.vo.SaleJoin;

import static com.bn.jsp.common.JDBCTemplate.*;

public class SaleDAO {
	
	private Properties prop;
	
	public SaleDAO() {
		// properties 파일에서 받아올 prop 객체 생성
		prop = new Properties();
		
		// properties 파일 경로
		String filePath = SaleDAO.class
								 .getResource("/config/sale.properties")
								 .getPath();
		
		// filePath에 담은 경로로 파일 받아오기
		try {
			prop.load( new FileReader(filePath) );
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertSale(Connection con, Sale s) {
		
		int result = 0;
		PreparedStatement ps = null;
		
		String sql = prop.getProperty("insertSale");
		
		try {
			ps = con.prepareStatement(sql);
			
			ps.setString(1, s.getP_no());
			ps.setInt(2, s.getS_quan());
			ps.setDate(3, s.getS_date());
			
			result = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(ps);
		}
		
		return result;
	}

	public ArrayList selectSaleInfo(Connection con, String pno) {
		
		ArrayList list = new ArrayList();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("selectSaleInfo");
		
		try {
			ps = con.prepareStatement(sql);
			
			ps.setString(1, pno);
			
			rs = ps.executeQuery();
			
			while ( rs.next() ) {
				
				list.add( rs.getString(1) );
				list.add( rs.getInt(2) );
				
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		
		} finally {
			close(rs);
			close(ps);
		}
		
		return list;
	}

	public ArrayList<String> selectPno(Connection con) {
		
		ArrayList<String> list = new ArrayList<>();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("selectPno");
		
		try {
			ps = con.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			while ( rs.next() ) {
				
				list.add(rs.getString(1));
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		
		} finally {
			close(rs);
			close(ps);
		}
		
		
		
		return list;
	}

	public int getListCount(Connection con) {
		
		int result = 0;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("listCount");
		
		try {
			ps = con.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			if ( rs.next() ) {
				result = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		
		} finally {
			close(rs);
			close(ps);
		}
		
		return result;
	}

	public ArrayList<SaleJoin> selectList(Connection con, int currentPage) {
		
		ArrayList<SaleJoin> list = new ArrayList<>();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("selectList");
		
		// 1페이지 : 1-10번 글, 2페이지 : 11-20번 글, 3페이지 : 21-30번 글
		int startRow = (currentPage - 1) * 10 + 1;
		int endRow = currentPage * 10;
		
		try {
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, endRow);
			ps.setInt(2, startRow);
			
			rs = ps.executeQuery();
			
			while( rs.next() ) {
				
				SaleJoin s = new SaleJoin();
				
				s.setS_no(rs.getInt("s_no"));
				s.setS_date(rs.getDate("s_date"));
				s.setP_no(rs.getString("p_no"));
				s.setP_name(rs.getString("p_name"));
				s.setS_quan(rs.getInt("s_quan"));
				s.setS_total(rs.getInt("s_total"));
				
				list.add(s);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rs);
			close(ps);
		}
		
		return list;
	}

	

	

}
