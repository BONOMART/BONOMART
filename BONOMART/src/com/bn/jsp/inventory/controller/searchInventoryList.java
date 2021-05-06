package com.bn.jsp.inventory.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bn.jsp.inventory.model.service.inventoryService;
import com.bn.jsp.inventory.model.vo.Inventory;
import com.bn.jsp.inventory.model.vo.PageInfo;



/**
 * Servlet implementation class searchInventoryList
 */
@WebServlet("/searchList.in")
public class searchInventoryList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public searchInventoryList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ArrayList<Inventory> list = new ArrayList<>();
		inventoryService service = new inventoryService();
		String type = request.getParameter("type");
		String content = request.getParameter("content");
		
		// 10개 씩 자르기 위한 변수들
				int startPage;		// 시작 페이지   (1), 2, 3, 4, 5, ...... 20
				
				int endPage;		// 끝 페이지    1, 2, 3, 4, (5), ...... 20
				
				int maxPage; 	  // 실제 끝 페이지   1, 2, 3, 4, 5, ...... (20)
				
				int currentPage;  // 현재 페이지
				
				int limit = 10; 	//	한번에 보여줄 페이지 수
				
				currentPage = 1;
				
				// 만약 사용자가 다른 페이지 번호에서 들어온다면 
				if( request.getParameter("currentPage") != null) {
					currentPage = Integer.parseInt(request.getParameter("currentPage"));
				}
				
				//  총 게시글 확인
				int listCount = service.getListCountSi(type,content);
				
			
				
				// maxPage			206/10 => 20.6 -->21
				maxPage = (int)((double)listCount / 10 + 0.9);
				
				// 한 번에 보일 페이지 수 
				// 시작 페이지
				startPage = (int)(((double)currentPage/10 + 0.9) -1) * limit +1;
				
				// 끝 페이지
				//endPage = startPage + limit-1;
				endPage = startPage +9;
				
				// 만약 최종 페이지가 끝 페이지보다 작다면 
				if( maxPage < endPage) {    
					endPage = maxPage;		
				}
				
				//  -------------------------- 페이처리 끝! -----------------------------//
			
		
		list = service.listSi(currentPage,type,content);
		
		request.setAttribute( "list", list);
		
		PageInfo pi = new PageInfo(startPage, endPage, maxPage, currentPage,
													limit, listCount,type,content);
		request.setAttribute("pi", pi);
		
		request.setAttribute("type", type);
		request.setAttribute("content", content);

		
		RequestDispatcher view =
				request.getRequestDispatcher("views/inventory/inventory.jsp");
	
		view.forward(request, response);
	
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
