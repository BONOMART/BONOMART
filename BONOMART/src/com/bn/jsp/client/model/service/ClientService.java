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

	public int insertClient(Client[] list) {
		con = getConnection();
		
		int result = dao.insertClient(con,list);
		
		if(result>0) {
			commit(con);
		} else {
			rollback(con);
		}
		return result;
	}

	public int getListCountSort(String data, String sort) {
		con = getConnection();
		
		int result = dao.getListCountSort(con,data,sort);
		
		close(con);
		
		return result;
	}

	public ArrayList<Client> selectClientListSort(int currentPage, String data, String sort) {
		con = getConnection();
		
		ArrayList<Client> list = dao.selectClientListSort(con, currentPage, data, sort);
		
		close(con);
		
		return list;
		
	}

	public ArrayList<String> checkInsert(ArrayList<String> list) {
		con =  getConnection();
		
		ArrayList<String> result = dao.checkInsert(con, list);
		
		close(con);
		
		return result;
	}


	 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
