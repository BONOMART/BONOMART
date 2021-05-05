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
 * Servlet implementation class MemberLogin
 */
@WebServlet("/login.me")
public class MemberLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		System.out.println("서블릿 : " + userId + "/" + userPwd);
		
		Member loginMember = new Member(userId, userPwd);
		
		// 3. 로그인 서비스 수행 (업무 로직: biz logic)
		MemberService service = new MemberService();
		
		loginMember = service.selectMember(loginMember);
		
		if(loginMember != null) {
			// 로그인 성공!
			
			HttpSession session = request.getSession();
			
			session.setAttribute("member", loginMember);
			
			response.sendRedirect("/bono/views/main/mainPage.jsp");
		} else {
			// 로그인 실패!
			
			request.setAttribute("error-msg", "로그인 실패!");
			
			RequestDispatcher view
			   = request.getRequestDispatcher("views/common/loginErrorPage.jsp");
			
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
