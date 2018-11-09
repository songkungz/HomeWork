package com.gz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gz.bean.User;
import com.gz.dao.UserDao;
@Service
public class UserServiceImpl implements  UserService{
	@Autowired
    private UserDao dao;
	@Override
	public List<User> selectUser() {
		// TODO Auto-generated method stub
		return dao.selectUser();
	}

	@Override
	public int insertUser(User user) {
		// TODO Auto-generated method stub
		return dao.insertUser(user);
	}

	

	@Override
	public User selectUserByName(String name) {
		// TODO Auto-generated method stub
		return dao.selectUserByName(name);
	}

	@Override
	public User selectUserByCondition(String name, String password) {
		// TODO Auto-generated method stub
		return dao.selectUserByCondition(name,password);
	}

	@Override
	public int deleteUser(int id) {
		// TODO Auto-generated method stub
		return dao.deleteUser(id);
	}

	@Override
	public int updateUser(int id) {
		// TODO Auto-generated method stub
		return dao.updateUser(id);
	}

}
