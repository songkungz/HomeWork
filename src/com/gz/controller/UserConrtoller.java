package com.gz.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
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
public int Regiester(@RequestBody User user) {
	int result;
	if(service.selectUserByName(user.getName())!=null)
		{
			result = 0;
		}
	else
		{
			result = service.insertUser(user);
		}
	return result;
}
@RequestMapping("/login.do")
public ModelAndView Login(String name, String pwd,HttpSession session,ModelAndView mv) 
{   
	User user = service.selectUserByCondition(name, pwd);
	if(user!=null)
	{
		session.setAttribute("user", user);
		mv.setView(new RedirectView("http://localhost:8080/HomeWork/index.jsp"));
	}
	else
	{
		 mv.addObject("message","alert('登录名和密码错误，请重新输入')");
         mv.setViewName("login");
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
