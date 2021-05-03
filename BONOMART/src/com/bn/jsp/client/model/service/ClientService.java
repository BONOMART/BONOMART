package com.bn.jsp.client.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.bn.jsp.client.model.dao.ClientDAO;
import com.bn.jsp.client.model.vo.Bank;

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
	
	 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
