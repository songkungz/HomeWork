package com.gz.controller;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.gz.bean.Course;
import com.gz.bean.Page;
import com.gz.service.CourseService;

@Controller
@RequestMapping("cou")
public class CourseController {
	@Autowired
	private CourseService service;
	private int pageSize=6;
	@RequestMapping("findCoursesByType.do")
	@ResponseBody
	public Object coursetList(Integer pageNow,String Ctype) {
		Page<Course> list = service.findCourse(pageNow, Ctype, pageSize);	
		return list;
	}
	@RequestMapping("findCourses.do")
	@ResponseBody
	public Object courses() {
		List<Course> list = service.findAllCourse();	
		return list;
	}
	@RequestMapping("findAllCourseType.do")
	@ResponseBody
	public Object courseType() {
		List<Course> list = service.oneTypeCourse();
		return list;
	}
	@RequestMapping("findAllCourse.do")
	@ResponseBody
	public Object allCourse(Integer pageNow) {
		int pageSize = 8;
		Page<Course> list = service.selectAllCourse(pageNow, pageSize);
		return list;
	}
	@RequestMapping("findCourseByName.do")
	@ResponseBody
	public Object findCourseByName(Integer pageNow,String cname) {
		System.out.println(cname);
		Page<Course> list = service.findCourseByName(pageNow, cname, pageSize);
		return list;
	}
	
	@RequestMapping("/childCourses.do")
	@ResponseBody
	public Object findcoursetList(Integer id) {

		List<Course> list = service.selectChildrenCourseById(id);
		return list;
	}
	@RequestMapping("/findVideo.do")
	@ResponseBody
	public Object findVideo(Integer id) {
		Course list = service.selectCourseVideoById(id);
		if(list==null)
		{
			list =(Course) findCourseById(id);
		}
		return list;
	}
	
	@RequestMapping("/findCourseById.do")
	@ResponseBody
	public Object findCourseById(Integer id) {
		Course list = service.selectCourseById(id);
		return list;
	}
	@RequestMapping("/insertCourses.do")//闂佸湱绮敮鎺楀矗閸℃稑妫樺ù鐓庣摠椤︼拷
	@ResponseBody
	public int insertCourses(@RequestBody Course courses) {	
			int result= service.insertCourse(courses);
			if(result!=0)
			   {
				   return 1;
			   }
			   else {
				   return 0;
			   }
		
	}
	
	@RequestMapping("updateCourses.do")
	@ResponseBody
	public int updateCourses(@RequestBody Course courses) {
			int result= service.updateCourseById(courses);
			if(result!=0)
			   {
				   return 1;
			   }
			   else {
				   return 0;
			   }
		
	}
	@ResponseBody
	@RequestMapping("deleteCourses.do")
	public int deleteCourses(@RequestParam(value = "msg")  Integer Cid) {
		int result = service.deleteCourse(Cid);
		if(result!=0)
		   {
			   return 1;
		   }
		   else {
			   return 0;
		   }
	}
	

}

