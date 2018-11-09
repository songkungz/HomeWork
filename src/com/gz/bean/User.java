package com.gz.bean;

public class User {
private int Uid;
private String Name;
private int  Age;
private String Sex;
private String Password;
private String Phone;
private String e_mail;
public int getUid() {
	return Uid;
}
public void setUid(int uid) {
	Uid = uid;
}
public String getName() {
	return Name;
}
public void setName(String name) {
	Name = name;
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
@Override
public String toString() {
	return "User [Uid=" + Uid + ", Name=" + Name + ", Age=" + Age + ", Sex=" + Sex + ", Password=" + Password
			+ ", Phone=" + Phone + ", e_mail=" + e_mail + "]";
}


}
