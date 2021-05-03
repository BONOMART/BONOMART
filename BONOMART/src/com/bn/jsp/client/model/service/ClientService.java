package com.bn.jsp.client.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.bn.jsp.client.model.dao.ClientDAO;
import com.bn.jsp.client.model.vo.Bank;
import com.bn.jsp.client.model.vo.Client;

import static com.bn.jsp.common.JDBCTemplate.*;

public class ClientService {

	private Connection con;
	private ClientDAO dao = new ClientDAO();
	
	public ArrayList<Bank> selectBank() {
		con= getConnection();
		
		ArrayList<Bank> list = dao.selectBank(con);
		
		close(con);
		
		return list;
	}

	public int getListCount() {
		con = getConnection();
		
		int result = dao.getListCount(con);
		
		close(con);
		
		return result;
	}

	public ArrayList<Client> selectClientList(int currentPage) {
		con = getConnection();
		
		ArrayList<Client> list = dao.selectClientList(con, currentPage);
		
		close(con);
		
		return list;
	}

	public int updateClient(Client c) {
		con = getConnection();
		
		int result = dao.updateClient(con, c);
		
		if( result> 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int deleteClient(String c_no) {
		con = getConnection();
		
		int result = dao.deleteClient(con, c_no);
		
		if(result>0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}
	
	 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
