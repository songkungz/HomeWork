package com.gz.bean;

import java.util.List;

public class Teacher {
	private int Tid;
	private String Tname;
	private int Age;
	private String Sex;
	private String Information;
	private String Image;
	private String type;//教授课程类别
	private List<User> t_user;
	private List<Course> t_course;
	public Teacher() {
		super();
	}
	public int getTid() {
		return Tid;
	}
	public void setTid(int tid) {
		Tid = tid;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTname() {
		return Tname;
	}
	public void setTname(String tname) {
		Tname = tname;
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
	public String getInformation() {
		return Information;
	}
	public void setInformation(String information) {
		Information = information;
	}
	public String getImage() {
		return Image;
	}
	public void setImage(String image) {
		Image = image;
	}
	public List<User> getT_user() {
		return t_user;
	}
	public void setT_user(List<User> t_user) {
		this.t_user = t_user;
	}
	public List<Course> getT_course() {
		return t_course;
	}
	public void setT_course(List<Course> t_course) {
		this.t_course = t_course;
	}
	
}
