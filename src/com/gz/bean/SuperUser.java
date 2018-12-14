package com.gz.bean;

public class SuperUser {
private int sid;//id
private String Name;//用户名
private String password;//密码
private  String roles;//角色
private String salt;//盐值
private String  grade;//权限等级
/**
 * 后台权限等级1:最高权限，能操作后台所有数据
 * 2.增删改查
 * 3.查看
 */
public String getSalt() {
	return salt;
}
public void setSalt(String salt) {
	this.salt = salt;
}
public String getGrade() {
	return grade;
}
public void setGrade(String grade) {
	this.grade = grade;
}
public int getSid() {
	return sid;
}
public void setSid(int sid) {
	this.sid = sid;
}
public String getName() {
	return Name;
}
public void setName(String name) {
	Name = name;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getRoles() {
	return roles;
}
public void setRoles(String roles) {
	this.roles = roles;
}
@Override
public String toString() {
	return "SuperUser [sid=" + sid + ", Name=" + Name + ", password=" + password + ", roles=" + roles + ", salt=" + salt
			+ ", grade=" + grade + "]";
}

}
