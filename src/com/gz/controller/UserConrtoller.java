package com.gz.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.gz.bean.Page;
import com.gz.bean.ResultEntity;
import com.gz.bean.User;
import com.gz.service.UserService;

@Controller
@RequestMapping("user")
public class UserConrtoller {
@Autowired
private UserService service;
private int pageSize = 6;
@RequestMapping("/userinfo.do")
@ResponseBody
public Object findAllUser(int pageNow ) {
	Page pg = service.findUserWithPage(pageNow, pageSize);
	return pg;
}
@RequestMapping("/finduserbyid.do")
@ResponseBody
public Object  findUserById(Integer id) {//
	User list =service.selectUserById(id);
	return list;
}
@RequestMapping("/findUserCourseById.do")
@ResponseBody
public Object  findUserCourseById(Integer id) {//
	User list =service.selectCourseByUserId(id);
	return list;
}
@RequestMapping("/regiest.do")
@ResponseBody
public ResultEntity Regiester(@RequestBody User user){
	
	ResultEntity rs = new ResultEntity();
	if(service.selectUserByName(user.getUname()) != null)
		{	
			rs.setState(300);//操作错误
			rs.setMessage("该用户名已被占用");
		}
	else
		{
			int result = service.insertUser(user);
			if(result>0) {
			    rs.setState(400); //操作成功
			    rs.setMessage("注册成功");
			}
			else
			{
				rs.setState(200);//插入失败
		        rs.setMessage("注册失败");
			}
		}
	return rs;
}
@ResponseBody
@RequestMapping("/login.do")
public  Object Login(@Param("name")String name, @Param("pwd")String pwd,HttpSession session) 
{   
	User user = service.selectUserByCondition(name, pwd);
	ResultEntity rs = new ResultEntity();
	if(user!=null)
	{
		session.setAttribute("user", user);
		session.setMaxInactiveInterval(30*60);
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
  response.sendRedirect("http://localhost:8080/HomeWork/index.jsp");
}
@ResponseBody
@RequestMapping("/deleteUser.do")
public int deleteUsers(Integer id)
{
	int result = service.deleteUser(id);
	 if(result!=0)
	   {
		   return 1;
	   }
	   else {
		   return 0;
	   }
}
@ResponseBody
@RequestMapping("/updateUser.do")
public int updateUser(@RequestBody User user) {
	
   int result = service.updateUser(user);
   if(result!=0)
   {
	   return 1;
   }
   else {
	 return 0;
   }
   
}
@ResponseBody
@RequestMapping("/selectCourse.do")
public int selectCourse(Integer uid,Integer cid) {
	
   int result = service.selectCourse(uid, cid);
   if(result!=0)
   {
	   return 1;
   }
   else {
	 return 0;
   }
   
}
@SuppressWarnings("unchecked")
@ResponseBody
@RequestMapping("/selectuser.do")
/*
 * 根据条件查询用户
 * Param(condition,pageNow)分别为查询条件，当前数据页码
 */
public Object findTeacherByName(Integer pageNow,String condition) {
	Object list;
	if(condition.replace(" ", "").length()==0||condition==null)
	{
		return list = findAllUser(pageNow);
	}
	else
	{
		list= service.findUserByNameWithPage(pageNow, pageSize, condition);
	}
	return list;
}

}
