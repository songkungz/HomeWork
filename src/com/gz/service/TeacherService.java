package com.gz.service;

import java.util.List;


import com.gz.bean.Page;
import com.gz.bean.Teacher;

public interface TeacherService {
	List<Teacher> selectTeacher();
	int insertTeacher(Teacher teacher);
	int deleteTeacher(int id);
	int updateTeacher(Teacher teacher);
	Teacher selectTeacherById(int id);
	int getCount();//获取数据总条数
	int getCountByCondition(String condition);//获取满足条件的数据总条数
	Teacher findCourseByTeacherId(int id);
	Page<Teacher> findTeacherWithPage(int pageNow,int pageSize);//分页查询数据
	Page<Teacher> selectTeacherByConditionWithPage(String condition,int pageNow,int pageSzie);//根据名字进行查询
	Page<Teacher> selectTeacherByTypeWithPage(String type,int pageNow,int pageSzie);//根据类型进行查询
	List<Teacher> selectTeacherByType(String type);
}
