package com.bn.jsp.client.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bn.jsp.client.model.service.ClientService;
import com.bn.jsp.client.model.vo.Bank;
import com.google.gson.Gson;

/**
 * Servlet implementation class BanklistSelect
 */
@WebServlet("/banklist.cl")
public class BanklistSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BanklistSelect() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Bank> bankList = new ArrayList<>();
		ClientService service = new ClientService();
		
		bankList = service.selectBank();

        request.setAttribute("bankList", bankList);

        RequestDispatcher view = 
        		request.getRequestDispatcher("views/client/clientRegister.jsp");
        
        view.forward(request,response);
        
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
