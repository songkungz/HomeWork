package com.gz.service;


import com.gz.bean.SuperUser;
public interface SuperUserService {
	SuperUser selectBySuperUser(SuperUser user);//根据条件查询管理员
	int insertSuperUser( SuperUser user);//添加普通管理员用户
	int updateSuperUser(SuperUser user);//修改管理员
	int deleteSuperUser(int id);//删除管理员}
	SuperUser  selectSuperUser(String name,String  pwd);
}