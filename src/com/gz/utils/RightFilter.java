package com.gz.utils;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.gz.bean.User;

public class RightFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Autowired
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)
			throws IOException, ServletException {
		    HttpServletRequest req = (HttpServletRequest) request;
		    HttpServletResponse res = (HttpServletResponse) response;
		    
		    HttpSession session = req.getSession();
		
		    //从session里取的用户名信息
		    User user =  (User) session.getAttribute("user");
		    
		    //判断如果没有取到用户信息,就跳转到登陆页面
	     if (user == null) {
		      //跳转到登陆页面
	    	 System.out.println(user);
	    	 
		      res.sendRedirect("../login.jsp");
		      
		    }
		 else {

			//已经登陆,继续此次请求
		      filterChain.doFilter(request,response);
		    }
	    
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		

	}

}
