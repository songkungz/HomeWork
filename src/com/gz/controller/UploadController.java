package com.gz.controller;


import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;        
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gz.bean.FileMeta;
import com.gz.service.FileService;


@Controller
@RequestMapping("file")
public class UploadController {

  @Autowired
    private FileService service;
    @RequestMapping(value="/upload.do")
    @ResponseBody  

    public FileMeta upload(MultipartHttpServletRequest request, HttpServletResponse response) {
        String path = request.getSession().getServletContext().getRealPath("upload");      
        MultipartFile mpf = request.getFile("file");
        File file=new File(path);
		if(!file.exists()){//如果文件夹不存在
			file.mkdir();//创建文件夹
		}
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
                       service.insertFile(fileMeta);//插入数据库
                } catch (IOException e) {
                        e.printStackTrace();
                }
        }
        System.out.println(fileMeta.toString());
        //将封装的文件数据返回到前端
        return fileMeta;
    }
    @RequestMapping("/download.do")
    public void download(@RequestParam("filename")String filename,HttpServletRequest request, HttpServletResponse response) throws IOException {
        //模拟文件，myfile.txt为需要下载的文件  
        String path = request.getSession().getServletContext().getRealPath("upload")+"\\"+filename;  
        //获取输入流  
        InputStream bis = new BufferedInputStream(new FileInputStream(new File(path)));
        //转码，免得文件名中文乱码  
        filename = URLEncoder.encode(filename,"UTF-8");  
        //设置文件下载头  
        response.addHeader("Content-Disposition", "attachment;filename=" + filename);    
        //1.设置文件ContentType类型，这样设置，会自动判断下载文件类型    
        response.setContentType("multipart/form-data");   
        BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());  
        int len = 0;  
        while((len = bis.read()) != -1){  
            out.write(len);  
            out.flush();  
        }  
        out.close();  
    }
    
    @RequestMapping("/filelist.do")
    @ResponseBody
    public List<FileMeta> findAllFile(){
    	List<FileMeta> list = service.selectAllFile();
    	return list;
    }
}
