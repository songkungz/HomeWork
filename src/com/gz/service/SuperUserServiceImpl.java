package com.gz.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.gz.bean.SuperUser;
import com.gz.dao.SuperUserDao;
@Service
public class SuperUserServiceImpl implements  SuperUserService{
	@Autowired
     private SuperUserDao dao;

	@Override
	public SuperUser selectBySuperUser(SuperUser user) {
		// TODO Auto-generated method stub
		return dao.selectBySuperUser(user);
	}

	@Override
	public int insertSuperUser(SuperUser user) {
		// TODO Auto-generated method stub
		return dao.insertSuperUser(user);
	}

	@Override
	public int updateSuperUser(SuperUser user) {
		// TODO Auto-generated method stub
		return dao.updateSuperUser(user);
	}

	@Override
	public int deleteSuperUser(int id) {
		// TODO Auto-generated method stub
		return dao.deleteSuperUser(id);
	}

	@Override
	public SuperUser selectSuperUser(String name, String pwd) {
		// TODO Auto-generated method stub
		return dao.selectSuperUser(name, pwd);
	}
	
}
