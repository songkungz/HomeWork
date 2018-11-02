package com.gz.controller;


import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gz.bean.News;
import com.gz.service.NewsService;
import com.gz.utils.Tools;
@Controller
@RequestMapping("news")
public class newsController {
	@Autowired
	private NewsService service;

	@RequestMapping("/newsinfo.do")
	@ResponseBody
    public Object findAllNews() {//查询所有新闻
    	List<News> list = service.findNews();
    	return list;
    }
	@RequestMapping("/insertNews.do")//插入新闻
	public boolean insertNews(News news,HttpServletRequest request) {
		Tools tool = new Tools();
		news.setTitle(request.getParameter("title"));
		news.setAuthor(request.getParameter("Author"));
		news.setImge(request.getParameter("image"));
		
		try {
			news.setTime(tool.getTime());
			System.out.println(tool.getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//news.setNid(tool.randomUUID());
		int result = service.insertNews(news);
		if(result>0)
			return true;
		else
			return false;
	}
	@ResponseBody
	@RequestMapping("/selectinfo.do")//根据作者或者标题查询新闻
    public Object findNewsByTitleOrAuthor(HttpServletRequest request) {
		System.out.println(request.getParameter("condition"));
		if(request.getParameter("condition").length()==0)
		{
			return findAllNews();
		}
		else
		{
			List<News> list = service.selectNewsByTitleOrAuthor(request.getParameter("condition"));
			return list;
    	}
    }
	@RequestMapping("/updateNews.do")
	public void updateNews(int id) {
	   int result = service.updateNewsById(id);
	   if(result!=0)
	   {
		   System.out.println("alert('修改成功')");
	   }
	   else {
		   System.out.println("alert('修改失败')");
	   }
	   
	}
	@RequestMapping("/deleteNews.do")
	public void deleteNews(int id) {
		int result = service.deleteNews(id);
		   if(result!=0)
		   {
			   System.out.println("alert('删除成功')");
		   }
		   else {
			   System.out.println("alert('删除失败')");
		   }
	   
	}

}
