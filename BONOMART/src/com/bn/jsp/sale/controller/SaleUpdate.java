package com.bn.jsp.sale.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bn.jsp.sale.model.service.SaleService;
import com.bn.jsp.sale.model.vo.Sale;

/**
 * Servlet implementation class SaleUpdate
 */
@WebServlet("/update.sa")
public class SaleUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaleUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int s_no = Integer.parseInt(request.getParameter("s_no"));
		int s_quan = Integer.parseInt(request.getParameter("up_s_quan"));
		
		SaleService service = new SaleService();
		
		Sale s = new Sale(s_no, s_quan);
		
		int result = service.updateSale(s);
		
		if (result > 0) {
			response.sendRedirect("selectList.sa");
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
