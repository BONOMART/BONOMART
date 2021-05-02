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
			
			System.out.println(list);
			
			
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
			
			System.out.println(list);
			
		} catch (SQLException e) {
			e.printStackTrace();
		
		} finally {
			close(rs);
			close(ps);
		}
		
		
		
		return list;
	}

	

}
