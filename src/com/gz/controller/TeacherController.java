package com.gz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.gz.bean.Page;
import com.gz.bean.Teacher;
import com.gz.service.TeacherService;


@Controller
@RequestMapping("teacher")
public class TeacherController {
	@Autowired
	private TeacherService service;
	private int pageSize = 9;
	/*
	 * 查询所有信息
	 * return List<Teacher>
	 * 传入参数pageNow（当前显示页面页码）
	 */
	@RequestMapping("/teacherinfo.do")
	@ResponseBody
    public Object findAllTeacher(Integer pageNow) {
		Page pg = service.findTeacherWithPage(pageNow,pageSize);
    	return  pg;
    
    }
	
	@RequestMapping("/allteacher.do")
	@ResponseBody
    public Object AllTeacher() {
		List<Teacher> pg = service.selectTeacher();
    	return  pg;
    
    }
	@RequestMapping("/findteacherbyid.do")
	@ResponseBody
    public Teacher  findTeacherById(Integer id) {//
		System.out.println(id);
		Teacher list =service.findCourseByTeacherId(id);
		if(list==null)
		{
			list = (Teacher) service.selectTeacherById(id);
		}
		System.out.println(list);
    	return list;
    }
	@RequestMapping("/insertTeacher.do")//鎻掑叆鏂伴椈
	@ResponseBody
	public int insertNews(@RequestBody Teacher teacher) {
	
			int result= service.insertTeacher(teacher);
			if(result>0)
			{
				return 1;
			}
			else
			{
				return 0;
			}
	
	}
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping("/selectacher.do")//鏍规嵁浣滆�呮垨鑰呮爣棰樻煡璇㈡柊闂�
    /*
     * 根据条件查询老师
     * Param(condition,pageNow)分别为查询条件，当前数据页码
     */
	public Object findTeacherByCondition(Integer pageNow,String condition) {
		Object list;
		if(condition.replace(" ", "").length()==0||condition==null)
		{
			return list = findAllTeacher(pageNow);
		}
		else
		{
			list= service.selectTeacherByConditionWithPage(condition, pageNow,pageSize);
		}
		return list;
    }
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping("/selectacherbytype.do")//鏍规嵁浣滆�呮垨鑰呮爣棰樻煡璇㈡柊闂�
    /*
     * 根据类型查询老师
     * Param(condition,pageNow)分别为查询条件，当前数据页码
     */
	public Object findTeacherByType(Integer pageNow,String type) {
		   Page list;
			list= service.selectTeacherByTypeWithPage(type, pageNow,pageSize);
		return list;
    }
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping("/selectbytype.do")//鏍规嵁浣滆�呮垨鑰呮爣棰樻煡璇㈡柊闂�
    /*
     * 根据类型查询老师
     * Param(condition,pageNow)分别为查询条件，当前数据页码
     */
	public Object findTeacherByType(String type) {
		   List<Teacher> list;
			list= service.selectTeacherByType(type);
		return list;
    }
	@ResponseBody
	@RequestMapping("/updateTeacher.do")
	public int updateTeacher(@RequestBody Teacher teacher) {
		
	   int result = service.updateTeacher(teacher);
	   if(result!=0)
	   {
		   return 1;
	   }
	   else {
		 return 0;
	   }
	   
	}
	@ResponseBody
	@RequestMapping("/deleteTeacher.do")
	public int deleteTeacher(Integer id) {
		System.out.println(id);
		int result = service.deleteTeacher(id);
		   if(result!=0)
		   {
			   return 1;
		   }
		   else {
			   return 0;
		   }
	   
	}

}
