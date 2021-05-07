package com.bn.jsp.order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bn.jsp.order.model.service.OrderService;
import com.bn.jsp.order.model.vo.Order;

/**
 * Servlet implementation class OrderUpdate
 */
@WebServlet("/OrderUpdate.or")
public class OrderUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int o_no = Integer.parseInt(request.getParameter("order_No"));
		String o_quan = request.getParameter("up_o_quan");
		
		OrderService service = new OrderService();
		
		Order o = new Order(o_no, o_quan);
		
		int result = service.updateOrder(o);
		
		if(result > 0) {
			response.sendRedirect("/order/orderlist.do");
		} else {
			request.setAttribute("error-msg", "판매정보 수정 실패");
			
			request.getRequestDispatcher("views/common/errorPage.jsp")
			       .forward(request, response);
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
