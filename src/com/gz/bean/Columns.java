package com.gz.bean;

import java.util.List;

public class Columns {
private int col_id;
private  String name;
private  String describe;
private String image;
private int cid;
private List<Columns> categorys;
public int getCol_id() {
	return col_id;
}
public void setCol_id(int col_id) {
	this.col_id = col_id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getDescribe() {
	return describe;
}
public void setDescribe(String describe) {
	this.describe = describe;
}
public String getImage() {
	return image;
}
public void setImage(String image) {
	this.image = image;
}
public List<Columns> getCategory() {
	return categorys;
}
public void setCategory(List<Columns> categorys) {
	this.categorys = categorys;
}
public int getCid() {
	return cid;
}
public void setCid(int cid) {
	this.cid = cid;
}

}
