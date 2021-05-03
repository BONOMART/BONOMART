package com.bn.jsp.sale.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bn.jsp.sale.model.service.SaleService;
import com.bn.jsp.sale.model.vo.PageInfo;
import com.bn.jsp.sale.model.vo.SaleJoin;

/**
 * Servlet implementation class SaleSelectList
 */
@WebServlet("/selectList.sa")
public class SaleSelectList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaleSelectList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<SaleJoin> list = new ArrayList<>();
		
		SaleService service = new SaleService();
		
		// 페이지 처리 --------------------------------------------------------------------------------
		int startPage;  // 시작 페이지 (1), 2, 3, 4, .. , 20
		int endPage;    // 끝 페이지   1, 2, 3, (4), .. , 20 
		int maxPage;    // 실제 끝 페이지  1, 2, 3, 4, .. , (20)
		int currentPage;   // 현재 페이지 
		int limit = 10;      // 한 번에 보여줄 페이지 수
		
		currentPage = 1;
		
		// 만약 사용자가 다른 페이지 번호에서 들어온다면
		if ( request.getParameter("currentPage") != null ) {		
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		// 총 게시글 수 확인
		int listCount = service.getListCount();
				
		// maxPage  ( 10으로 나눴을 때 남은 애들까지 페이지에 넣기 위함 )
		maxPage = (int) ( (double) listCount/10 + 0.9 );
				
		// 한 번에 보일 페이지 수 
		// 시작 페이지 ( 현재 페이지가 8이면 1페이지 부터, 13이면 11페이지 부터 )
		startPage =  (int) ( ((double) currentPage/10 + 0.9) - 1 ) * limit + 1;
				
		// 끝 페이지 ( 현재 페이지가 8이면 끝 페이지는 10, 13이면 20페이지 )
		// endPage = startPage + limit - 1;
		endPage = startPage + 9;
				
		// 만약 최종 페이지가 끝페이지보다 작다면
		if ( maxPage < endPage ) {
			endPage = maxPage;       // 최종 페이지가 15이면 끝페이지가 15가 되도록
		}
		
		//--------------------------------------------------------------------------------------------
	
		list = service.selectList(currentPage);
		
		request.setAttribute("list", list);
		
		PageInfo pi = new PageInfo(startPage, endPage, maxPage, currentPage, limit, listCount);
	
		System.out.println(pi);
		request.setAttribute("pi", pi);
		
		request.getRequestDispatcher("views/sale/saleList.jsp")
		       .forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
