package com.gz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gz.bean.Page;
import com.gz.bean.Teacher;
import com.gz.bean.User;
import com.gz.dao.UserDao;
@Service
public class UserServiceImpl implements  UserService{
	@Autowired
    private UserDao dao;

	@Override
	public User selectUserByCondition(String name, String password) {
		// TODO Auto-generated method stub
		return dao.selectUserByCondition(name, password);
	}

	@Override
	public int deleteUser(int id) {
		// TODO Auto-generated method stub
		return dao.deleteUser(id);
	}

	@Override
	public int updateUser(User user) {
		// TODO Auto-generated method stub
		return dao.updateUser(user);
	}

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return dao.getCount();
	}

	@Override
	public int getCountByCondition(String condition) {
		// TODO Auto-generated method stub
		return dao.getCountByCondition(condition);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Page<User> findUserWithPage(int pageNow, int pageSize) {
		int totalCount = dao.getCount();
		@SuppressWarnings("rawtypes")
		Page pg = new Page( totalCount,  pageNow,pageSize);
        List<User> list = dao.findUserWithPage(pg.getStartPos(), pg.getPageSize());//调用分页 
        System.out.println(list.toString());
   	    pg.setList(list);
   	    return pg;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Page<User> findUserByNameWithPage(int pageNow, int pageSize, String name) {
		int totalCount = dao.getCountByCondition(name);
		@SuppressWarnings("rawtypes")
		Page pg = new Page( totalCount,  pageNow,pageSize);
		pg.setPageSize(pageSize);
        List<User> list = dao.findUserByNameWithPage(pg.getStartPos(), pageSize, name);//调用分页 
   	    pg.setList(list);
   	    return pg;
	}

	@Override
	public User selectUserById(int id) {
		// TODO Auto-generated method stub
		return dao.selectByUserId(id);
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
	public User selectCourseByUserId(int id) {
		// TODO Auto-generated method stub	
     User list = dao.selectCourseByUserId(id);//调用分页 
	 return list;
	}

	@Override
	public int selectCourse(int uid, int cid) {
		// TODO Auto-generated method stub
		return dao.selectCourse(uid, cid);
	}
	
	
}
