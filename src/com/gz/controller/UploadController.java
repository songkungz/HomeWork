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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gz.bean.FileMeta;


@Controller
@RequestMapping("file")
public class UploadController {

  
    @RequestMapping(value="/upload.do")
    @ResponseBody  

    public FileMeta upload(MultipartHttpServletRequest request, HttpServletResponse response) {
        String path = request.getSession().getServletContext().getRealPath("upload");
        MultipartFile mpf = request.getFile("file");
        System.out.println(path);
        FileMeta fileMeta = null;
        if (mpf != null) {
                fileMeta = new FileMeta();
                fileMeta.setFileName(mpf.getOriginalFilename());
                fileMeta.setFileSize(mpf.getSize() / 1024 + " Kb");
                fileMeta.setFileType(mpf.getContentType());
                fileMeta.setFilePath(path);
                try {
                        fileMeta.setBytes(mpf.getBytes());
                        mpf.transferTo(new File(path,mpf.getOriginalFilename()));
                } catch (IOException e) {
                        e.printStackTrace();
                }
        }
        //将封装的文件数据返回到前端
        return fileMeta;
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
