package com.gz.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.gz.bean.User;
import com.gz.service.UserService;

@Controller
@RequestMapping("user")
public class UserConrtoller {
@Autowired
private UserService service;
@RequestMapping("/userinfo.do")
@ResponseBody
public List<User> findUser() {
	List<User> user = service.selectUser();
	return user;
}
@RequestMapping("/regiest.do")
@ResponseBody
public void Regiester(HttpServletRequest request,HttpServletResponse response) throws IOException {
	PrintWriter print = response.getWriter();
	User user = new User();
	String name = request.getParameter("username");
	String password = request.getParameter("password");
	int age =request.getParameter("zip").length()==0?128:Integer.valueOf(request.getParameter("zip"));
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String sex  =  request.getParameter("states")=="nan"?"男":"女"; 
	user.setName(name);
	user.setPassword(password);
	user.setAge(age);
	user.setE_mail(email);
	user.setPhone(phone);
	user.setSex(sex);
	if(service.selectUserByName(user.getName()) != null)
		{
			 print.write("<script>alert('该用户已被占用');</script>");
			 response.sendRedirect("http://localhost:8080/HomeWork/regiest.jsp");
		}
	else
		{
			service.insertUser(user);
			print.write("<script>alert('注册成功')</script>");
			response.sendRedirect("http://localhost:8080/HomeWork/login.jsp");
		}
}
@RequestMapping("/login.do")
public ModelAndView Login(String name, String pwd,HttpSession session,ModelAndView mv) 
{   
	User user = service.selectUserByCondition(name, pwd);
	if(name!=null&&user!=null)
	{
		session.setAttribute("user", user);
		mv.setView(new RedirectView("http://localhost:8080/HomeWork/index.jsp"));
	}
	else
	{
		mv.setView(new RedirectView("http://localhost:8080/HomeWork/login.jsp"));
	}
	return mv;
}
@RequestMapping("/deleteUser.do")
public int deleteUsers(int id)
{
	int result = service.deleteUser(id);
	return result;
}
}
