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

/**
 * Servlet implementation class MemberDelete
 */
@WebServlet("/delete.me")
public class MemberDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 쿼리 스트링을 받음.
				String userId = request.getParameter("mid");
				
				MemberService service = new MemberService();
				
				int result = service.deleteMember(userId);
				
				if (result > 0) {
					
					HttpSession session = request.getSession(false);
					
					session.invalidate();
					
					response.sendRedirect("intro.jsp");
				} else {
					
					RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
					
					request.setAttribute("error-msg", "회원 정보 삭제  실패");
					
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
