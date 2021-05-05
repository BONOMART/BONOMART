package com.bn.jsp.client.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bn.jsp.client.model.service.ClientService;
import com.google.gson.Gson;

/**
 * Servlet implementation class ClientInsertCheck
 */
@WebServlet("/insertCheck.cl")
public class ClientInsertCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientInsertCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String c_code = request.getParameter("c_code");
		String c_title = request.getParameter("c_title");
		String c_phone = request.getParameter("c_phone");
		String c_account = request.getParameter("c_account");
		
		ArrayList<String> list = new ArrayList<String>();
		list.add(c_code);
		list.add(c_title);
		list.add(c_phone);
		list.add(c_account);
		
		ClientService service =  new ClientService();
		
		ArrayList<String> result = service.checkInsert(list);
		
		response.setContentType("application/json; charset=UTF-8");

        new Gson().toJson(result, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
