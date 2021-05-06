package com.bn.jsp.order.model.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static com.bn.jsp.common.JDBCTemplate.*;

import com.bn.jsp.order.model.dao.OrderDAO;
import com.bn.jsp.order.model.vo.Order;
import com.bn.jsp.order.model.vo.OrderList;
import com.bn.jsp.order.model.vo.OrderSearch;

//DAO에서 작성한 쿼리를 DB에 날려주는 클래스
public class OrderService {

	private Connection con;
	private OrderDAO dao = new OrderDAO();
	
	//발주등록
	public int InsertOrder(Order order) {
		
		con = getConnection();
		
		int result = dao.insertOrder(con, order);
		
		if(result <= 0) { 
			rollback(con);
		} else {
			commit(con);
		}
		
		close(con);
		
		return 0;
	}
	
	public void log(String message) {
		System.out.println("[OrderService LOG] " + message);
	}

	public ArrayList<OrderSearch> selectList() {

		con = getConnection();
		
		
		
		return null;
	}

	public int insertOrderList(List<Order> orderList) {
		log("insertOrderList : " + orderList.toString());
		int result = 0;
		for(Order o : orderList) {
			result = insertOrder(o);
		}
		
		return result;
	}
	
	public int insertOrder(Order order) {
		log("insertOrder : " + order.toString());
		con = getConnection();
		
		int result = getMemberNoFindByName(con, order.getm_name());
		log("findByName result : " + result);
		if(result > 0) {
			order.setM_no(result);
			result = dao.insertOrder(con, order);
			log("insert result : " + result);
			if(result > 0) {
				commit(con);
			} else {
				rollback(con);
			}
			close(con);
		}
		return result;
	}
	
	public int getMemberNoFindByName(Connection con, String memberName) {
		log("getMemberNoFindByName : " + memberName);
		
		return dao.getMemberNoFindByName(con, memberName);
	}

	public int getListCount(String searchKey, String searchValue) {
		
		con = getConnection();
		
		int listCount;
		if(searchKey == null || searchKey.equals("all") || searchValue == null) {
			listCount = dao.getListCount(con);
		} else {
			listCount = dao.getListCount(con, searchKey, searchValue);
		}
		
		close(con);
		
		return listCount;
	}
	
	public ArrayList<OrderList> searchList(String searchKey, String searchValue) {
		con = getConnection();
		ArrayList<OrderList> list;
		
		if(searchKey == null || searchKey.equals("all") || searchValue == null) {
			list = dao.searchList(con);
		} else {
			list = dao.searchList(con, searchKey, searchValue);
		}
		
		close(con);
		
		return list;
	}

	public int DeleteSearchList(int o_no) {

		con = getConnection();
		
		int result = dao.deletesearchlist(con, o_no);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		} 
		
		close(con);
		
		return 0;
	}

	public ArrayList selectOrderInfo(String pno) {
		
		con = getConnection();
		
		ArrayList list = dao.selectOrderInfo(con, pno);
		
		close(con);
		
		return list;
	}

	public int updateOrder(Order o) {
		
		con = getConnection();
		
		int result = dao.updateOrder(con, o);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	

}
