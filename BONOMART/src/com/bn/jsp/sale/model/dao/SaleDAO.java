package com.bn.jsp.sale.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.bn.jsp.sale.model.vo.Sale;

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
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
