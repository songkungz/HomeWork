package com.gz.bean;

import java.util.UUID;

public class UUid {//随机主键生成
	 public  String randomUUID() {  
	        return UUID.randomUUID().toString().replace("-", "");  
	    }  
}
