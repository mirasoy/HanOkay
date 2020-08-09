package com.ana.controller;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ana.domain.UserVO;
 
/**
 * This Java filter demonstrates how to intercept the request
 * and transform the response to implement authentication feature.
 * for the website's back-end.
 *
 * @author www.codejava.net
 */

public class CustomedLoginFilter implements Filter {
 
	@Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {
 
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
 
        boolean isRedirect= false;
        String requestURI= request.getRequestURI();
        
   
 
        if ( !requestURI.equals("/user/login") && !requestURI.equals("/register/emailAuth")
        		) {
            
//            RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/");
//            dispatcher.forward(request, response);
 
            UserVO user= (UserVO)request.getSession().getAttribute("user");
            
            if(user ==null) {
            	isRedirect = true;
            }
            
		} 
        /*
			 * else if (isLoggedIn || isLoginRequest) { // continues the filter chain //
			 * allows the request to reach the destination chain.doFilter(request,
			 * response);
			 * 
			 * } else { // the admin is not logged in, so authentication is required //
			 * forwards to the Login page RequestDispatcher dispatcher =
			 * request.getRequestDispatcher("login.jsp"); dispatcher.forward(request,
			 * response);
			 * 
			 * }
			 */
        
        if(isRedirect == true) {
        	req.getRequestDispatcher("/user/login").forward(req, res);
        } else {
        	chain.doFilter(req, res);
        }
 
    }
 
    @Override
    public void destroy() {
    	System.out.println("LoginFilter is destroyed");
    }
 
    public void init(FilterConfig fConfig) throws ServletException {
    }
 
}