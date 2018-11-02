package com.gz.utils;



import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.springframework.web.multipart.MultipartFile;

public class Tools {
	public  int randomUUID() {  //获取id
         return Integer.parseInt(UUID.randomUUID().toString().substring(0,8));
    }  
	public Date  getTime() throws ParseException{//获取当前系统时间
		 
		        return new Date();  
	
	}
	 public static  BufferedImage getInputStream(String addr){//
	        try {
	            String imgPath = addr;  
	            BufferedImage image = ImageIO.read(new FileInputStream(imgPath));
	            return image;
	        } catch (Exception e) {
	            e.printStackTrace();
	            System.out.println();
	            System.out.println("获取图片异常:java.awt.image.BufferedImage");
	            System.out.println("请检查图片路径是否正确，或者该地址是否为一个图片");
	        }
	        return null;
	    }
	public String uploadFile(MultipartFile partFile,String rootPath) throws IllegalStateException, IOException {	   	   
		if(partFile!=null&&partFile.getOriginalFilename()!=null&&partFile.getOriginalFilename().length()>0){		
			Calendar cal = Calendar.getInstance();		   
			int month = cal.get(Calendar.MONTH) + 1;		   
			int year = cal.get(Calendar.YEAR);		   
			String filePath=rootPath+year+month+"/";		   
			File dir=new File(filePath);			
			if(!dir.isDirectory())				
					dir.mkdir();	
			
			String fileOriginalName=partFile.getOriginalFilename();		   
			String newFileName=UUID.randomUUID()+fileOriginalName.substring(fileOriginalName.lastIndexOf("."));		   
			File file=new File(filePath+newFileName);		   //文件写入磁盘		   
			partFile.transferTo(file);		   //返回存储的相对路径+文件名称		   
			return ""+year+month+"/"+newFileName;	   
		 }	   
			else		   
				return null;   

		
	}

}
