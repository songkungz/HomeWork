package com.gz.service;



import com.gz.bean.Page;
import com.gz.bean.User;

public interface UserService {
	User selectUserByCondition(String name, String password);
	User selectCourseByUserId(int id);//查询用户所选课程
	int deleteUser(int id);
	int insertUser(User user);
	int updateUser(User user);
	int getCount();
	int getCountByCondition(String condition);
	Page<User> findUserWithPage(int pageNow,int pageSize);
	Page<User> findUserByNameWithPage(int pageNow,int pageSize,String name);
	User  selectUserById(int id);
	User  selectUserByName(String name);
	int selectCourse(int uid,int cid);
}
