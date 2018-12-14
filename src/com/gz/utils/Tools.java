package com.gz.utils;
import java.util.UUID;
public class Tools {
	
	 public  String randomUUID() {  
	        return UUID.randomUUID().toString().replace("-", "");  
	    }  
		
}

