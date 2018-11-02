package com.gz.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gz.utils.Tools;

public class ImageController {
	 @ResponseBody
	    @RequestMapping("/getImg")
	    public void getImg(@Param("addr")String addr,HttpServletResponse response){
	        BufferedImage img = new BufferedImage(300, 150, BufferedImage.TYPE_INT_RGB);
	        img = Tools.getInputStream(addr);
	        if(img==null){
	            throw new RuntimeException("打印图片异常：com.controller.Business_Ctrl.getImg(String, HttpServletResponse)");
	        }
	        if(img!=null){
	            try {
	                ImageIO.write(img, "JPEG", response.getOutputStream());
	            } catch (IOException e) {
	                e.printStackTrace();
	                System.out.println("打印异常:com.controller.Business_Ctrl.getImg(String, HttpServletResponse)");
	            }
	        }
	    }
}
