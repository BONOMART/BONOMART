package com.bn.jsp.client.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bn.jsp.client.model.service.ClientService;
import com.bn.jsp.client.model.vo.Client;

/**
 * Servlet implementation class ClientUpdate
 */
@WebServlet("/update.cl")
public class ClientUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String c_no= request.getParameter("c_no");
		String c_name= request.getParameter("c_name");
		String b_code = request.getParameter("b_code");
		String c_who = request.getParameter("c_who");
		String c_phone= request.getParameter("c_phone");
		String c_account= request.getParameter("c_account");
		String c_addr = request.getParameter("c_addr");
		
		Client c = new Client();
		ClientService service = new ClientService();
		
		c.setC_no(c_no);
		c.setC_name(c_name);
		c.setC_manager(c_who);
		c.setC_tel(c_phone);
		c.setC_address(c_addr);
		c.setB_code(b_code);
		c.setC_account(c_account);
		
		int result = service.updateClient(c);
		
		if(result > 0) {
			response.sendRedirect("selectlist.cl");
		} else {
			request.setAttribute("error-msg", "거래처 수정 실패!");
			
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
