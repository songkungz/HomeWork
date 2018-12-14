package com.gz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gz.bean.Teacher;

public interface TeacherDao {
List<Teacher> selectTeacher();
List<Teacher> selectTeacherByType(String type);
Teacher selectTeacherById(int id);
int insertTeacher(Teacher teacher);
int deleteTeacher(int id);
int updateTeacher(Teacher teacher);
int getCount();//获取数据总条数
List<Teacher> findTeacherWithPage(@Param("startPos")int startPos, @Param("pageSize")int pageSize);//分页查询数据
List<Teacher> selectTeacherByConditionWithPage(@Param("Tname")String condition,@Param("startPos")int startPos, @Param("pageSize")int pageSize);//根据名字进行查询
List<Teacher> selectTeacherByTypeWithPage(@Param("type")String type,@Param("startPos")int startPos, @Param("pageSize")int pageSize);//根据名字进行查询
int getCountByCondition(String condition);
//int getCountByType(@Param("type")String type);
Teacher findCourseByTeacherId(@Param("Tid")int Tid);
}
