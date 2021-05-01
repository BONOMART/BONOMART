package com.bn.jsp.product.model.service;

import static com.bn.jsp.common.JDBCTemplate.close;
import static com.bn.jsp.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.bn.jsp.product.model.dao.ProductDAO;
import com.bn.jsp.product.model.vo.G_name;

public class ProductService {

	private Connection con;
	private ProductDAO dao = new ProductDAO();
	
	public ArrayList<G_name> selectGr() {
		con = getConnection();
		
		ArrayList<G_name> list = dao.selectgr(con);
		
		close(con);
		
		return list;
	}
}
