package com.bn.jsp.inventory.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bn.jsp.inventory.model.service.inventoryService;
import com.bn.jsp.inventory.model.vo.Inventory;

/**
 * Servlet implementation class inventroryUpdate
 */
@WebServlet("/update.in")
public class inventroryUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public inventroryUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String s_no = request.getParameter("p_no");
		int s_quan = Integer.parseInt(request.getParameter("up_s_quan"));
		
		inventoryService service = new inventoryService();
		
		Inventory in = new Inventory(s_no, s_quan);
		
		int result = service.updateInventory(in);
		
	 if (result > 0) {
			response.sendRedirect("selectList.sa");
	  } else {
			request.setAttribute("error-msg", "재고 수정 실패");
		
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
