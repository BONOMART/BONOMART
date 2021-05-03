package com.bn.jsp.client.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.bn.jsp.client.model.vo.Bank;
import com.bn.jsp.client.model.vo.Client;

import static com.bn.jsp.common.JDBCTemplate.*;

public class ClientDAO {

	private Properties prop;
	
	public ClientDAO() {
		prop = new Properties();
		
		String filePath = ClientDAO.class
						  .getResource("/config/client.properties")
						  .getPath();
		
		try {
			prop.load(new FileReader(filePath));
		
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Bank> selectBank(Connection con) {
		ArrayList<Bank> list = new ArrayList<>();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("selectBank");
		
		try {
			ps = con.prepareStatement(sql);
			
			rs= ps.executeQuery();
			
			while(rs.next()) {
				Bank b = new Bank();
				b.setB_code(rs.getString("B_CODE"));
				b.setB_title(rs.getString("B_TITLE"));
				
				list.add(b);
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
			
			rs= ps.executeQuery();
			
			if( rs.next() ) {
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

	public ArrayList<Client> selectClientList(Connection con, int currentPage) {
		ArrayList<Client> list = new ArrayList<>();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("selectClientList");
		
		int startRow = (currentPage -1) *10 +1;
		int endRow = currentPage * 10;
		
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, endRow);
			ps.setInt(2, startRow);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Client c = new Client();
				
				c.setC_no(rs.getString("c_no"));
				c.setC_name(rs.getString("c_name"));
				c.setC_manager(rs.getString("c_manager"));
				c.setC_tel(rs.getString("c_tel"));
				c.setC_address(rs.getString("c_address"));
				c.setB_title(rs.getString("b_title"));
				c.setC_account(rs.getString("c_account"));
				c.setB_code(rs.getString("b_code"));
				
				list.add(c);
			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(ps);
		}
		
		
		return list;
	}

	public int updateClient(Connection con, Client c) {
		int result= 0;
		PreparedStatement ps= null;
		
		String sql= prop.getProperty("updateClient");
		
		try {
			ps= con.prepareStatement(sql);
			
			ps.setString(1, c.getC_name());
			ps.setString(2, c.getC_manager());
			ps.setString(3, c.getC_tel());
			ps.setString(4, c.getC_address());
			ps.setString(5, c.getB_code());
			ps.setString(6, c.getC_account());
			ps.setString(7, c.getC_no());
			
			result = ps.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(ps);
		}
		
		
		return result;
	}

	public int deleteClient(Connection con, String c_no) {
		PreparedStatement ps = null;
		int result=0;
		
		String sql= prop.getProperty("deleteClient");
		
		try {
			ps = con.prepareStatement(sql);
			
			ps.setString(1, c_no);
			
			result = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(ps);
		}
				
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
