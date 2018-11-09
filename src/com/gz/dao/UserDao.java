package com.gz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gz.bean.User;

public interface UserDao {
List<User> selectUser();//查询用户
int insertUser(User user);//添加用户
User selectUserByName(String name);
User selectUserByCondition(@Param("Name")String name, @Param("Password")String password);
int deleteUser(int id);
int updateUser(int id);
}
