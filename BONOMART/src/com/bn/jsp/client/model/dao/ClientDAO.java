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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
