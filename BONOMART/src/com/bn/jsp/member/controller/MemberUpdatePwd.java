package com.bn.jsp.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bn.jsp.member.model.service.MemberService;
import com.bn.jsp.member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdate
 */
@WebServlet("/updatePwd.me")
public class MemberUpdatePwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdatePwd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//  문자 셋 변경
		request.setCharacterEncoding("UTF-8");
		
		String userPwd = request.getParameter("userPwd");
	
		// 해당 회원을 구분짓는 ID 받아오기
		HttpSession session = request.getSession(false);	// getSession이 false면 로그인이 안됐다면 의미이므로, id 가져오지마라.
		
		Member m = (Member)session.getAttribute("member");
		
		System.out.println("변경 전 비밀번호 확인 : " + m.getUserPwd());
		
		// 기존의 회원 비밀번호를 새로운 값으로 변경하기
		m.setUserPwd(userPwd);
		
		System.out.println("변경한 비밀번호 확인 : " + m.getUserPwd());
		
		MemberService service = new MemberService();
		
		int result = service.updateMemberPwd(m);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
