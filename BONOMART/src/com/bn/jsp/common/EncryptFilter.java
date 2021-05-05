package com.bn.jsp.common;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

/**
 * Servlet Filter implementation class EncryptFilter
 */
@WebFilter({ "/insert.me", "/login.me", "/updatePwd.me"})
public class EncryptFilter implements Filter {

    /**
     * Default constructor. 
     */
    public EncryptFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 비밀번호만 먼저 추출하여 암호화 하기
		HttpServletRequest req = (HttpServletRequest)request;
		
		System.out.println("원본 비밀번호 : " + req.getParameter("userPwd"));
		
		EncryptWrapper ew = new EncryptWrapper(req);
		
		chain.doFilter(ew, response);
	}
	
}