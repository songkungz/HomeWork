package com.gz.service;

import java.util.List;

import com.gz.bean.User;

public interface UserService {
	List<User> selectUser();//查询用户
	int insertUser(User user);//添加用户
	User selectUserByCondition(String name,String password);
	User selectUserByName(String  name);
	int deleteUser(int id);
	int updateUser(int id);
}
