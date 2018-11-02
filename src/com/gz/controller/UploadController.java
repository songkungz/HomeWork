package com.gz.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("file")
public class UploadController {

    @RequestMapping(value="/upload.do")
    @ResponseBody  
    public String upload(MultipartFile file,HttpServletRequest request) throws IOException{  
        String path = request.getSession().getServletContext().getRealPath("upload");  
        String fileName = file.getOriginalFilename();    
        File dir = new File(path,fileName);          
        if(!dir.exists()){  
            dir.mkdirs();  
        }  
       
        file.transferTo(dir);  
        return fileName;  
    }  
    
       @RequestMapping("/down.do")  
        public void down(HttpServletRequest request,HttpServletResponse response) throws Exception{  
           
            String fileName = request.getSession().getServletContext().getRealPath("upload")+"/101.jpg";  
            
            InputStream bis = new BufferedInputStream(new FileInputStream(new File(fileName)));  
              
            String filename = "下载文件.jpg";  
            
            filename = URLEncoder.encode(filename,"UTF-8");  
            
            response.addHeader("Content-Disposition", "attachment;filename=" + filename);    
                
            response.setContentType("multipart/form-data");   
            
            BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());  
            int len = 0;  
            while((len = bis.read()) != -1){  
                out.write(len);  
                out.flush();  
            }  
            out.close();  
        }  
}
