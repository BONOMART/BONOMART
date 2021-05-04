package com.bn.jsp.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.bn.jsp.admin.model.vo.Member;
import com.bn.jsp.admin.model.vo.PageInfo;
import com.google.gson.Gson;
import com.bn.jsp.admin.model.service.adminService;

/**
 * Servlet implementation class adminSearch
 */
@WebServlet("/search.ad")
public class adminSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String type = request.getParameter("name");
		String content = request.getParameter("content");
		
//		System.out.println(type+ content);
		
		adminService service = new adminService();
		
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
		int listCount = service.getListCount2(type, content);
		
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
		
		ArrayList<Member> list = (ArrayList<Member>) service.searchMember( type, content,currentPage );
		
		PageInfo pi = new PageInfo(startPage, endPage, maxPage, currentPage,
				limit, listCount);
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("list", list);
		map.put("pi", pi);
		response.setContentType("application/json; charset=UTF-8");
		
		new Gson().toJson(map, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
