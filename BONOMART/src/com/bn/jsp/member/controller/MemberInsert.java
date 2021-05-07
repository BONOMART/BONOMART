package com.bn.jsp.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bn.jsp.member.model.service.MemberService;
import com.bn.jsp.member.model.vo.Member;

/**
 * Servlet implementation class MemberInsert
 */
@WebServlet("/insert.me")
public class MemberInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userName = request.getParameter("userName");
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String dCode = request.getParameter("dCode");
		String jCode = request.getParameter("jCode");
		//String mdate = request.getParameter("mdate");
		
		Member m = new Member(userName, userId, userPwd, email, phone, dCode, jCode, "N", 'N');
		
		MemberService service = new MemberService();
		
		int result = service.insertMember(m);
		
		// 1명이라도 회원가입이 되었다면
		if(result > 0) {
			
			// 회원 가입 성공
			response.sendRedirect("intro.jsp");
		} else {
			
			// 회원 가입 실패 
			// (아이디 중복 검사 버튼을 누르지 않고 회원가입을 하려는 경우)
			RequestDispatcher view = 
							request.getRequestDispatcher("/bono/views/common/errorPage.jsp");
			
			view.forward(request, response);
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
