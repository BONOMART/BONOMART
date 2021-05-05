package com.bn.jsp.product.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bn.jsp.product.model.service.ProductService;
import com.bn.jsp.product.model.vo.ProductIn;
import com.google.gson.Gson;

/**
 * Servlet implementation class ProductInsert
 */
@WebServlet("/product.in")
public class ProductInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
//		 String body = null;
//	     StringBuilder stringBuilder = new StringBuilder();
//	     BufferedReader bufferedReader = null;
//	 
//	        try {
//	            InputStream inputStream = request.getInputStream();
//	            if (inputStream != null) {
//	                bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
//	                char[] charBuffer = new char[128];
//	                int bytesRead = -1;
//	                while ((bytesRead = bufferedReader.read(charBuffer)) > 0) {
//	                    stringBuilder.append(charBuffer, 0, bytesRead);
//	                }
//	            }
//	        } catch (IOException ex) {
//	            throw ex;
//	        } finally {
//	            if (bufferedReader != null) {
//	                try {
//	                    bufferedReader.close();
//	                } catch (IOException ex) {
//	                    throw ex;
//	                }
//	            }
//	        }
//	 
//	        body = stringBuilder.toString();
//	       
	        Gson gson = new Gson();
	        
	        ProductIn[] pl = gson.fromJson( request.getParameter("list"), ProductIn[].class);
	        
	       
        
       ProductService service = new ProductService();
        
        int result = service.insertProduct(pl);
      
       if (result > 0) {
    
       	ProductService serviceIn = new ProductService();
        	int result1 = serviceIn.insertInven(pl);
        	
       	if(result1 > 0) {
       		response.setContentType("application/json; charset=UTF-8");
    		
    		new Gson().toJson(result1, response.getWriter());
        	}
        } else {
        	response.setContentType("application/json; charset=UTF-8");
    		
    		new Gson().toJson(result, response.getWriter());
        }
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     
		doGet(request, response);
		
	}

}
