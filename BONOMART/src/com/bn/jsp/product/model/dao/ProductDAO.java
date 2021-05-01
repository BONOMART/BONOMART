package com.bn.jsp.product.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.bn.jsp.product.model.vo.G_name;
import com.bn.jsp.product.model.vo.Product;

import static com.bn.jsp.common.JDBCTemplate.*;

public class ProductDAO {
	private Properties prop;
	
		public ProductDAO() {
			prop = new Properties();
		
			String filePath = ProductDAO.class
					.getResource("/config/product.properties")
					.getPath();
		
		try {
			prop.load(new FileReader(filePath));
			
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	public ArrayList<G_name> selectgr(Connection con) {
		ArrayList<G_name> list = new ArrayList<>();
		PreparedStatement ps =null;
		ResultSet rs = null ;
		
		String sql = prop.getProperty("selectGrn");
		
		try {
			ps = con.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				
				G_name g = new G_name();
				
				g.setG_name(rs.getString("g_name"));
				
				list.add(g);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(rs);
		close(ps);
		
		return list;
	}

}
