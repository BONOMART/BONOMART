package com.bn.jsp.product.model.dao;

import static com.bn.jsp.common.JDBCTemplate.close;

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
import com.bn.jsp.product.model.vo.ProductIn;

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
				g.setG_code(rs.getString("g_code"));
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
	public ArrayList<Product> selectList(Connection con) {
		ArrayList<Product> list = new ArrayList<>();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql =prop.getProperty("selectList");
		
		try {
			ps = con.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Product p = new Product();
				
				p.setP_no( rs.getString("p_no"));
				p.setP_name( rs.getString("p_name"));
				p.setR_price(rs.getInt("r_price"));
				p.setS_price(rs.getInt("s_price"));
				p.setMin_quan(rs.getInt("min_quan"));
				p.setP_status(rs.getString("p_status"));
				p.setG_code(rs.getString("g_code"));
				p.setC_name(rs.getString("c_name"));
				p.setP_quan(rs.getInt("p_quan"));
				
				System.out.println(p);
				list.add(p);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
	
		close(rs);
		close(ps);
		}
		
		
		return list;
	}
	public int insertProduct(Connection con, ProductIn[] pl) {
		int result = 0;
		PreparedStatement ps = null;
		String sql = prop.getProperty("insertProduct");
		
		try {
			
			ps = con.prepareStatement(sql);
		
			for (ProductIn p : pl) {
				
				ps.setString(1, p.getP_no());
				ps.setString(2, p.getP_name());
				ps.setInt(3, p.getR_price());
				ps.setInt(4, p.getS_price());
				ps.setInt(5, p.getMin_quan());
				ps.setString(6, p.getG_code());
				
				result = ps.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(ps);
		
	}
		return result;
	}
	public int insertInven(Connection con, ProductIn[] pl) {
		int result =0;
		PreparedStatement ps = null;
		String sql = prop.getProperty("insertInventory");
		
		try {
			ps = con.prepareStatement(sql);
			
			for (ProductIn p : pl) {
				
				ps.setString (1, p.getP_no());
				
				result = ps.executeUpdate();
			}
				
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(ps);
		}
		return result;
	}
}
