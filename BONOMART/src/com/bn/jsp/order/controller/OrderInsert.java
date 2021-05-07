package com.bn.jsp.order.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import com.bn.jsp.order.model.service.OrderService;
import com.bn.jsp.order.model.vo.Order;
import com.google.gson.Gson;

/**
 * Servlet implementation class OrderInsert
 */
@WebServlet("/orderInsert.do")
public class OrderInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrderService orderService = new OrderService();
		response.setContentType("application/json; charset=UTF-8");
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				
		String list = request.getParameter("insertlist");
		String test = request.getParameter("test");
		System.out.println("param list : " + list);
		System.out.println("param test : " + test);
		List<Order> orderList = new ArrayList<Order>();
		List<Map<String, String>> parseList = new Gson().fromJson(list, ArrayList.class);

		int result = 0;
		try {
			
			System.out.println("json to parse parseList : " + parseList);
			for(int i=0; i<parseList.size(); i++) {
				System.out.println("orderList item : " + parseList.get(i));
				
				Order orderItem = new Order();
				orderItem.setO_quan(parseList.get(i).get("o_quan"));
				orderItem.setO_date(new Date( dateFormat.parse(parseList.get(i).get("o_date")).getTime() ));
				orderItem.setP_no(parseList.get(i).get("p_no"));
				orderItem.setm_name(parseList.get(i).get("m_name"));
				orderList.add(orderItem);
			}
			
			result = orderService.insertOrderList(orderList);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("json to parse orderList : " + orderList);
		Map<String, String> resultMap = new HashMap<String, String>();
		if(result > 0) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		response.getWriter().write(new Gson().toJson(resultMap));
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
