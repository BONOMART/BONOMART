package com.bn.jsp.order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bn.jsp.order.model.service.OrderService;
import com.bn.jsp.order.model.vo.OrderList;
import com.bn.jsp.order.model.vo.PageInfo;

/**
 * Servlet implementation class OrderList
 */
@WebServlet("/order/orderlist.do")
public class OrderSelectList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrderSelectList() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ArrayList<OrderList> list = new ArrayList<>();
		OrderService orderservice = new OrderService();
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");

		list = orderservice.searchList(searchKey, searchValue);

		request.setAttribute("list", list);

		//PageInfo pi = new PageInfo(startPage, endPage, maxPage, currentPage, limit, listCount);

		//request.setAttribute("pi", pi);

		System.out.println("list : " + list);
		//System.out.println("listCount : " + listCount);
		//System.out.println("pi : " + pi);
		request.getRequestDispatcher("/views/order/orderList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
