package com.bn.jsp.sale.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Set;

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
		
		ArrayList<Sale> list = new ArrayList<>();
		
		int length = 0;
		
		try {
			length = Integer.parseInt(request.getParameter("len"));
			
		} catch(NumberFormatException e) {
			System.out.println("SalesInsert[length]:"+e.getMessage());
			
		}
		
		for ( int i = 0 ; i < (length/3) ; i++ ) {
			
			String s_date = request.getParameter("s_date" + (i+1));
			String p_no = request.getParameter("p_no" + (i+1));
			int s_quan = Integer.parseInt(request.getParameter("s_quan" + (i+1)));
			
			Sale s = new Sale(p_no, s_quan, Date.valueOf(s_date));
			list.add(s);
				
		}
				
		SaleService service = new SaleService();
		
		int result = service.insertSale(list);
		
		if ( result == list.size() ) {
			request.getRequestDispatcher("selectList.sa")
			       .forward(request, response);
		} else {
			System.out.println("판매 등록 실패");
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
