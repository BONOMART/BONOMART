package com.bn.jsp.product.model.service;

import static com.bn.jsp.common.JDBCTemplate.close;
import static com.bn.jsp.common.JDBCTemplate.commit;
import static com.bn.jsp.common.JDBCTemplate.getConnection;
import static com.bn.jsp.common.JDBCTemplate.rollback;
import static com.bn.jsp.common.JDBCTemplate.close;
import static com.bn.jsp.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.bn.jsp.product.model.dao.ProductDAO;
import com.bn.jsp.product.model.vo.C_name;
import com.bn.jsp.product.model.vo.G_name;
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
		
		close(con);
		
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

	public Product updateView(String name) {

		con = getConnection();
		
		Product p = dao.updateView(con, name);
		 
		close(con);
		return p;
	}

	public ArrayList<C_name> selectCl() {
		con = getConnection();
		
		ArrayList<C_name> list = dao.selectcl(con);
		
		close(con);
		
		return list;
	}

	public int updateInsert(Product[] pl) {
		con = getConnection();
		
		int result = dao.updateInsert(con, pl);
		
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		return result;
	}

	public int deleteProduct(String p_no) {
		con = getConnection();
		
		int result = dao.deleteProduct(con, p_no);
		
		if(result > 0 ) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int getListCount(String keyword) {
		con = getConnection();
		
		int result = dao.getListCount(con, keyword);
		
		close(con);
		
		return result;
	}

	public ArrayList<Product> search(String name) {
		con = getConnection();
		
		ArrayList<Product> list= dao.search(con, name);
		
		close(con);
		
 		return list;
	}

	

	
}
