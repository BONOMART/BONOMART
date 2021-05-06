package com.bn.jsp.sale.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bn.jsp.sale.model.service.SaleService;
import com.bn.jsp.sale.model.vo.Sale;

/**
 * Servlet implementation class SaleInsert
 */
@WebServlet("/insert.sa")
public class SaleInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaleInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// int s_no = Integer.parseInt(request.getParameter("p_no"));
		// int s_quan = Integer.parseInt(request.getParameter("s_quan"));
		
		String s_date = request.getParameter("s_date");
		System.out.println(s_date);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-DD");
		
		try {
			System.out.println(new java.sql.Date(sdf.parse(s_date).getTime()));
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		/*
		 * Sale s = new Sale(s_no, s_quan, s_date);
		 * 
		 * SaleService service = new SaleService();
		 * 
		 * int result = service.insertSale(s);
		 */
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
