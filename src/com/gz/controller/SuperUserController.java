package com.gz.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gz.bean.ResultEntity;
import com.gz.bean.SuperUser;
import com.gz.service.SuperUserService;
@Controller
@RequestMapping("superuser")
public class SuperUserController {
	@Autowired
	private SuperUserService service;
	@SuppressWarnings("unused")
	@ResponseBody
	@RequestMapping("/login.do")
	public  Object Login(@Param("name")String name, @Param("pwd")String pwd,HttpSession session) 
	{   
		SuperUser user = service.selectSuperUser(name, pwd);
		System.out.println(user.toString());
		ResultEntity rs = new ResultEntity();
		if(user!=null)
		{
			session.setAttribute("user", user);
			rs.setData(user);
			rs.setState(400);	
			rs.setMessage("登陆成功");
		}
		else
		{
			rs.setState(200);	
			rs.setMessage("登陆失败");
		}
		return rs;
		
	}
	@RequestMapping("/quituser.do")
	public void quitUser(HttpServletRequest request,HttpServletResponse response) throws IOException{
	  HttpSession session = request.getSession();
	  session.removeAttribute("user");
	  response.sendRedirect("http://localhost:8080/HomeWork/login.jsp");
	}
}
