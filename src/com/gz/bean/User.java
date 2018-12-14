package com.gz.bean;

import java.util.List;

public class User {
private int Uid;
private String Uname;
private int  Age;
private String Sex;
private String Password;
private String Phone;
private String e_mail;
private List<Course> ucourse;
private List<Teacher> uteacher;
public int getUid() {
	return Uid;
}
public void setUid(int uid) {
	Uid = uid;
}
public int getAge() {
	return Age;
}
public void setAge(int age) {
	Age = age;
}
public String getSex() {
	return Sex;
}
public void setSex(String sex) {
	Sex = sex;
}
public String getPassword() {
	return Password;
}
public void setPassword(String password) {
	Password = password;
}
public String getPhone() {
	return Phone;
}
public void setPhone(String phone) {
	Phone = phone;
}
public String getE_mail() {
	return e_mail;
}
public void setE_mail(String e_mail) {
	this.e_mail = e_mail;
}

public String getUname() {
	return Uname;
}
public void setUname(String name) {
	Uname = name;
}
public List<Course> getUcourse() {
	return ucourse;
}
public void setUcourse(List<Course> ucourse) {
	this.ucourse = ucourse;
}
public List<Teacher> getUteacher() {
	return uteacher;
}
public void setUteacher(List<Teacher> uteacher) {
	this.uteacher = uteacher;
}




}
