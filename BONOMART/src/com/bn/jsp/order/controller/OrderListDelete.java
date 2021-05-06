package com.bn.jsp.order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bn.jsp.order.model.service.OrderService;

/**
 * Servlet implementation class OrderListDelete
 */
@WebServlet("/OrderListDelete.do")
public class OrderListDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderListDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int o_no = Integer.parseInt(request.getParameter("o_no"));
		
		OrderService orderservice = new OrderService();
		
		int result = orderservice.DeleteSearchList(o_no);
		
		if(result > 0) {
			response.sendRedirect("/order/orderlist.do");
		} else {
			request.setAttribute("error-msg", "삭제실패");
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
