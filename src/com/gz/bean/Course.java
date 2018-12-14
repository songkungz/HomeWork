package com.gz.bean;

import java.util.List;

public class Course {
	 private int Cid;
     private String Ctype;
     private String Cname;
     private String Cimage;
     private int Cnum;
     private String Ctitle;
     private String Csynopsis;
     private double Cprice;
     private String Cteacher;
     private List<Video> video;
     private List<Course> categorys;
     
     
	public int getCid() {
		return Cid;
	}
	public void setCid(int cid) {
		Cid = cid;
	}
	public String getCtype() {
		return Ctype;
	}
	public void setCtype(String ctype) {
		Ctype = ctype;
	}
	public String getCname() {
		return Cname;
	}
	public void setCname(String cname) {
		Cname = cname;
	}
	public String getCimage() {
		return Cimage;
	}
	public void setCimage(String cimage) {
		Cimage = cimage;
	}
	public int getCnum() {
		return Cnum;
	}
	public void setCnum(int cnum) {
		Cnum = cnum;
	}
	public String getCtitle() {
		return Ctitle;
	}
	public void setCtitle(String ctitle) {
		Ctitle = ctitle;
	}
	public String getCsynopsis() {
		return Csynopsis;
	}
	public void setCsynopsis(String csynopsis) {
		Csynopsis = csynopsis;
	}
	public double getCprice() {
		return Cprice;
	}
	public void setCprice(double cprice) {
		Cprice = cprice;
	}
	public String getCteacher() {
		return Cteacher;
	}
	public void setCteacher(String cteacher) {
		Cteacher = cteacher;
	}
	@Override
	public String toString() {
		return "TrainCourse [Cid=" + Cid + ", Ctype=" + Ctype + ", Cname=" + Cname + ", Cimage=" + Cimage + ", Cnum="
				+ Cnum + ", Ctitle=" + Ctitle + ", Csynopsis=" + Csynopsis + ", Cprice=" + Cprice + ", Cteacher="
				+ Cteacher + "]";
	}
	public List<Course> getCategorys() {
		return categorys;
	}
	public void setCategorys(List<Course> categorys) {
		this.categorys = categorys;
	}
	public List<Video> getVideo() {
		return video;
	}
	public void setVideo(List<Video> video) {
		this.video = video;
	}
     
	
}
//