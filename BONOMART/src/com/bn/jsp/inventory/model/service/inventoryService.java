package com.bn.jsp.inventory.model.service;

import static com.bn.jsp.common.JDBCTemplate.*;


import java.sql.Connection;
import java.util.ArrayList;

import com.bn.jsp.inventory.model.dao.inventoryDAO;
import com.bn.jsp.inventory.model.vo.Inventory;


public class inventoryService {
	
	private Connection con;
	private inventoryDAO dao = new inventoryDAO();
	
	// inventory null 값일때 게시글 수 가져오기 
	public int getListCountil() {
		con = getConnection();
		
		int result = dao.getListCoutil(con);
		
		close(con);

		return result;
	}

	// inventory null 값일때 리스트 가져오기 
	public ArrayList<Inventory> inventoryList(int currentPage) {
		
		con= getConnection();
		
		ArrayList<Inventory> result = dao.inventoryList(con, currentPage );
		
		close(con);
		
		return result;
	}

	
	// searchInventory 총게시글수 확인
	public int getListCountSi(String type, String content) {
		con = getConnection();
		
		int result = dao.getListCountSi(con, type, content);
		
		close(con);
		
		return result;
	}

	
	// searchInventory 총게시글 리스트 가져오기
	public ArrayList<Inventory> listSi(int currentPage, String type, String content) {
		con= getConnection();
		
		ArrayList<Inventory> result = dao.listSi(con, currentPage,type, content );
		
		close(con);
		
		return result;
	}

	// 선택한 재고의 정보 가져오기 
	public ArrayList selectInventoryInfo(String pno) {
		con = getConnection();
		
		ArrayList list = dao.selectInventoryInfo(con, pno);
		
		close(con);
		
		return list;
	}

	// 재고 수정
	public int updateInventory(Inventory in) {
		con = getConnection();
		
		int result = dao.updateInventory(con, in);
		
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

}
