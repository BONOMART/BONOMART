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
 * Servlet implementation class MemberUpdateExtra
 */
@WebServlet("/updateExtra.me")
public class MemberUpdateExtra extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateExtra() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email") + request.getParameter("emailSelect");
		String phone = request.getParameter("phone");
		String dCode = request.getParameter("dcode");
		String jCode = request.getParameter("jcode");
	
		// 해당 회원을 구분짓는 ID 받아오기
		HttpSession session = request.getSession(false);
		
		Member m = (Member)session.getAttribute("member");
		
		System.out.println("변경 전 회원 정보 확인 : " + m);
		
		// 기존의 회원 이메일, 연락처, 부서코드 ,직급코드를 새로운 값으로 변경하기
		m.setEmail(email);
		m.setPhone(phone);
		m.setdCode(dCode);
		m.setjCode(jCode);
		
		System.out.println("변경 한 회원 정보 확인 : " + m);
		
		MemberService service = new MemberService();
		
		int result = service.updateMemberExtra(m);
		
		if(result > 0) {
			// session.setAttribute("member", m);
			session.invalidate();
			
			response.sendRedirect("intro.jsp");
		} else {
			
			RequestDispatcher view = request.getRequestDispatcher("view/common/errorPage.jsp");
			
			request.setAttribute("error-msg", "회원 정보 수정 실패");
			
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
