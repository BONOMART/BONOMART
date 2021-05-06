package com.bn.jsp.order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bn.jsp.order.model.service.OrderService;
import com.google.gson.Gson;

/**
 * Servlet implementation class OrderSpace
 */
@WebServlet("/OrderSpace.or")
public class OrderSpace extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderSpace() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String pno = request.getParameter("p_no");
		
		OrderService service = new OrderService();
		
		ArrayList list = service.selectOrderInfo(pno);
		
		response.setContentType("application/json; charset=UTF-8");
		
		new Gson().toJson(list, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
