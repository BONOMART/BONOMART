package com.bn.jsp.client.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bn.jsp.client.model.service.ClientService;
import com.bn.jsp.client.model.vo.Client;
import com.google.gson.Gson;

/**
 * Servlet implementation class ClientInsert
 */
@WebServlet("/insert.cl")
public class ClientInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		Client[] list = new Gson().fromJson(request.getParameter("name"), Client[].class);
		
		ClientService service = new ClientService();
		
		int result = service.insertClient(list);
		
		if(result > 0) {
			response.sendRedirect("selectlist.cl");
		} else {
			request.setAttribute("error-msg", "거래처 등록 실패!");
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
