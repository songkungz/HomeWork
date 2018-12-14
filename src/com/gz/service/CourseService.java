package com.gz.service;

import java.util.List;

import com.gz.bean.Course;
import com.gz.bean.Page;

public interface CourseService {
	
    Page<Course> findCourse( int pageNow, String Ctype,int pageSize);
	
	
	 Page<Course> findCourseByName( int pageNow, String cname,int pageSize);
		
	int insertCourse(Course trainCourse);
	
    int updateCourseById(Course Course);
	
	int deleteCourse(Integer cid);
	Page<Course> selectAllCourse(int pageNow, int pageSize);
	 List<Course> selectChildrenCourseById(int id);
	Course selectCourseVideoById(int id);
	Course selectCourseById(int id);
	List<Course> findAllCourse();
	List<Course> oneTypeCourse();
	
}
