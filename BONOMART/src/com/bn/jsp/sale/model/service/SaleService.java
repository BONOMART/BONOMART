package com.bn.jsp.sale.model.service;

import static com.bn.jsp.common.JDBCTemplate.close;
import static com.bn.jsp.common.JDBCTemplate.commit;
import static com.bn.jsp.common.JDBCTemplate.getConnection;
import static com.bn.jsp.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.bn.jsp.sale.model.dao.SaleDAO;
import com.bn.jsp.sale.model.vo.Sale;
import com.bn.jsp.sale.model.vo.SaleJoin;

public class SaleService {

	private Connection con;
	
	private SaleDAO dao = new SaleDAO();

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


	public int insertSale(ArrayList<Sale> list) {
		int result1 = 0;
		
		
		con = getConnection();
		
		for ( int i = 0 ; i < list.size() ; i++ ) {
			
			int result2 = 0;
			
			if ( list.get(i) != null ) {
				
				result2 = dao.insertSale(con, list.get(i));
				
				if ( result2 == 0 ) break;
				
				result1 += result2;
			}
			
		}
		
		if ( result1 == list.size() ) {
			System.out.println("service re : " + result1);
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		
		return result1;
	}

	public int getListCount() {
		con = getConnection();
		
		int result = dao.getListCount(con);
		
		close(con);
		
		return result;
	}

	public ArrayList<SaleJoin> selectList(int currentPage) {
		
		con = getConnection();
		
		ArrayList<SaleJoin> list = dao.selectList(con, currentPage);
		
		close(con);
		
		return list;
	}

	
}
