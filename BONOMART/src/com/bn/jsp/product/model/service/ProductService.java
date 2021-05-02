package com.bn.jsp.product.model.service;

import static com.bn.jsp.common.JDBCTemplate.close;
import static com.bn.jsp.common.JDBCTemplate.commit;
import static com.bn.jsp.common.JDBCTemplate.getConnection;
import static com.bn.jsp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.bn.jsp.product.model.dao.ProductDAO;
import com.bn.jsp.product.model.vo.G_name;
import com.bn.jsp.product.model.vo.InventoryPr;
import com.bn.jsp.product.model.vo.Product;
import com.bn.jsp.product.model.vo.ProductIn;

public class ProductService {

	private Connection con;
	private ProductDAO dao = new ProductDAO();
	
	public ArrayList<G_name> selectGr() {
		con = getConnection();
		
		ArrayList<G_name> list = dao.selectgr(con);
		
		close(con);
		
		return list;
	}

	public ArrayList<Product> selectList() {
		con = getConnection();
		
		ArrayList<Product> list= dao.selectList(con);
		
 		return list;
	}

	public int insertProduct(ProductIn[] pl) {
		con =getConnection();
		
		int result =dao.insertProduct(con, pl);
		
		if ( result > 0) {
			commit(con);
		} else { 
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public int insertInven(ProductIn[] pl) {
		con = getConnection();
		
		int result = dao.insertInven(con, pl);
		
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		return result;
	}

	
}
