package com.gz.bean;

import java.util.List;

public class Comment {
	private int Commentid;
	private int  Cid;
	private int retid;
	private String Courselist;
	private String Uname;
	private String Head_image;
	private String Comment_time;
	private String Comment_content;
	private List<Comment> commentlist;
	public int getCommentid() {
		return Commentid;
	}
	public void setCommentid(int commentid) {
		Commentid = commentid;
	}
	public String getCourselist() {
		return Courselist;
	}
	public void setCourselist(String courselist) {
		this.Courselist = courselist;
	}
	public String getUname() {
		return Uname;
	}
	public void setUname(String uname) {
		Uname = uname;
	}
	public String getHead_image() {
		return Head_image;
	}
	public void setHead_image(String head_image) {
		Head_image = head_image;
	}
	public String getComment_time() {
		return Comment_time;
	}
	public void setComment_time(String comment_time) {
		Comment_time = comment_time;
	}
	public String getComment_content() {
		return Comment_content;
	}
	public void setComment_content(String comment_content) {
		Comment_content = comment_content;
	}
	@Override
	public String toString() {
		return "Comment [Commentid=" + Commentid + ", courselist=" + Courselist + ", Uname=" + Uname + ", Head_image="
				+ Head_image + ", Comment_time=" + Comment_time + ", Comment_content=" + Comment_content + "]";
	}
	public int getCid() {
		return Cid;
	}
	public void setCid(int cid) {
		Cid = cid;
	}
	public int getRetid() {
		return retid;
	}
	public void setRetid(int retid) {
		this.retid = retid;
	}
	public List<Comment> getCommentlist() {
		return commentlist;
	}
	public void setCommentlist(List<Comment> commentlist) {
		this.commentlist = commentlist;
	}
	
	
	
	
}
