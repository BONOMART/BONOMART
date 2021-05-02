package com.bn.jsp.sale.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.bn.jsp.sale.model.dao.SaleDAO;
import com.bn.jsp.sale.model.vo.Sale;
import static com.bn.jsp.common.JDBCTemplate.*;

public class SaleService {

	private Connection con;
	
	private SaleDAO dao = new SaleDAO();

	public int insertSale(Sale s) {
		int result = 0;
		
		con = getConnection();
		
		result = dao.insertSale(con, s);
		
		return result;
	}

	public ArrayList selectSaleInfo(String pno) {
		con = getConnection();
		
		ArrayList list = dao.selectSaleInfo(con, pno);
		
		close(con);
		
		return list;
	}

	public ArrayList<String> selectPno() {
		
		con = getConnection();
		
		ArrayList<String> list = dao.selectPno(con);
		
		close(con);
		
		return list;
	}

	
}
