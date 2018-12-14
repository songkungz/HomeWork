package com.gz.dao;


import org.apache.ibatis.annotations.Param;

import com.gz.bean.SuperUser;

public interface SuperUserDao {
SuperUser selectBySuperUser(SuperUser user);//根据条件查询管理员
int insertSuperUser( SuperUser user);//添加普通管理员用户
int updateSuperUser(SuperUser user);//修改管理员
int deleteSuperUser(int id);//删除管理员
SuperUser selectSuperUser(@Param("Name")String name,@Param("password")String pwd);
}
