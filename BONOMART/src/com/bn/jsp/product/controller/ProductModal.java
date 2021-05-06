package com.bn.jsp.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bn.jsp.product.model.service.ProductService;
import com.bn.jsp.product.model.vo.Product;
import com.google.gson.Gson;

/**
 * Servlet implementation class ProductModal
 */
@WebServlet("/product.mo")
public class ProductModal extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductModal() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String name = request.getParameter("p_no");
		
	
		ProductService service = new ProductService();
		
		Product p= service.updateView(name);
		
		
		response.setContentType("application/json; charset=UTF-8");
		
		new Gson().toJson(p, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
