package com.gz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gz.bean.SuperUser;
import com.gz.bean.User;

public interface UserDao {
User selectByUserId(@Param("Uid")int id);//根据id查询用户
User selectCourseByUserId(@Param("Uid")int id);//查询用户所选课程
int insertUser(User user);//添加用户
User  selectUserByName(@Param("Uname")String name);
User selectUserByCondition(@Param("Uname")String name, @Param("Password")String password);
int deleteUser(@Param("Uid")int id);
int updateUser(User user);
int getCount();
SuperUser selectSuperUserByCondition(@Param("Name")String name, @Param("Password")String pwd);
int getCountByCondition(@Param("Uname")String condition);
//查询所有用户并分页
List<User> findUserWithPage(@Param("startPos")int startPos,@Param("pageSize")int pageSize);
// 根据用户名查询用户并分页
List<User> findUserByNameWithPage(@Param("startPos")int startPos,@Param("pageSize")int pageSize,@Param("Uname")String name);

int selectCourse(@Param("Uid")int uid,@Param("Cid")int cid);//插入选课记录
}
