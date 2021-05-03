package com.bn.jsp.client.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bn.jsp.client.model.service.ClientService;
import com.bn.jsp.client.model.vo.Bank;
import com.bn.jsp.client.model.vo.Client;
import com.bn.jsp.client.model.vo.PageInfo;


/**
 * Servlet implementation class ClientSelectList
 */
@WebServlet("/selectlist.cl")
public class ClientSelectList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientSelectList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 게시판 목록 처리
		ArrayList<Client> list = new ArrayList<>();
		ClientService service = new ClientService();
		ArrayList<Bank> bankList = new ArrayList<>();
		
		int startPage;  // 시작 페이지  (1), 2, 3, 4, 5 . . . . 20
		
		int endPage;    // 끝 페이지    1, 2, 3, 4, (5) . . . . 20
		
		int maxPage;   // 실제 끝 페이지 1, 2, 3, 4, 5 . . . . (20)
		
		int currentPage;  // 현재 페이지
		
		int limit = 10;      // 한번에 보여줄 페이지 수
		
		currentPage = 1;
		
		if ( request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = service.getListCount();
		
		// maxPage     206 / 10 => 21.8 --> 21
		//
		maxPage = (int)((double)listCount/10 + 0.9);
		
		// 한 번에 보일 페이지 수
		// 시작 페이지
		startPage = (int)(((double)currentPage/10 + 0.9) - 1) * limit + 1;
		
		// 끝 페이지
		// endPage = startPage + limit - 1;
		endPage = startPage + 9;
		
		// 만약 최종 페이지가 끝페이지보다 작다면
		if( maxPage < endPage) {
			endPage = maxPage;
		}
		
		bankList = service.selectBank();
		
		request.setAttribute("bankList", bankList);
		
		list = service.selectClientList(currentPage);
		
		request.setAttribute("list", list);
		
		PageInfo pi = new PageInfo(startPage, endPage, maxPage, currentPage, limit, listCount);
		
		request.setAttribute("pi", pi);
		
		RequestDispatcher view =
				request.getRequestDispatcher("views/client/clientList.jsp");
		
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
