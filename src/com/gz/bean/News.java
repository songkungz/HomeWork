package com.gz.bean;

import java.util.Date;

public class News {
private Integer Nid;
private String Title;
private String n_Content;
private Date Time;
private String Author;
private String  imge;


public News() {
	super();
}

public int getNid() {
	return Nid;
}
public void setNid(int nid) {
	Nid = nid;
}
public String getTitle() {
	return Title;
}
public void setTitle(String title) {
	Title = title;
}
public String getN_Content() {
	return n_Content;
}
public void setN_Content(String n_Content) {
	this.n_Content = n_Content;
}
public Date getTime() {
	return Time;
}
public void setTime(Date time) {
	Time = time;
}
public String getAuthor() {
	return Author;
}
public void setAuthor(String author) {
	Author = author;
}
@Override
public String toString() {
	return "News [Nid=" + Nid + ", Title=" + Title + ", n_Content=" + n_Content + ", Time=" + Time + ", Author="
			+ Author + "]";
}
public String getImge() {
	return imge;
}
public void setImge(String imge) {
	this.imge = imge;
}
}
