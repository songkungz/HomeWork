package com.gz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gz.bean.Course;

public interface CourseDao {

	List<Course> selectAllCourse(@Param("startPos")int startPos, @Param("pageSize")int pageSize);
	List<Course> selectCourse(@Param("Ctype")String ctype,@Param("startPos")int startPos, @Param("pageSize")int pageSize);
	
	int getCountByCtype(@Param("Ctype")String ctype);
	
	List<Course> selectCourseByName(@Param("Cname")String cname,@Param("startPos")int startPos, @Param("pageSize")int pageSize);
	
	int getCountByCname(@Param("Cname")String cname);
	int insertCourse(Course Course);
	
     int updateCourseById(Course Course);
	
	int deleteCourse(int cid);
	
    List<Course> selectChildrenById(int id);
    Course selectVedioById(int id);
    Course selectCourseById(int id);
    List<Course> selectAllCourses();
    List<Course> oneTypeCourse();
	int getCount();
}
