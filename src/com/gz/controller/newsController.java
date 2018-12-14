package com.gz.controller;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.gz.bean.News;
import com.gz.bean.Page;
import com.gz.service.NewsService;
@Controller
@RequestMapping("news")
public class newsController {
	@Autowired
	private NewsService service;
	private int pageSize=6;
	/*
	 * 查询所有信息
	 * return List<News>
	 * 传入参数pageNow（当前显示页面页码）
	 */
	@RequestMapping("/newsinfo.do")
	@ResponseBody
    public Object findAllNews(Integer pageNow) {
		Page pg = service.findAllNewsWithPage(pageNow,pageSize);
		System.out.println(pg);
    	return  pg;
    
    }
	
	@SuppressWarnings("null")
	@RequestMapping("/indexinfo.do")
	@ResponseBody
    public List<News> findNews() {//轮播图数据
		List<News> list =service.findNews();
    	return list;
    }
	@RequestMapping("/findnewsbyid.do")
	@ResponseBody
    public Object  findNewsById(Integer id) {//
		List<News> list =service.selectNewsByid(id);
    	return list;
    }
	@RequestMapping("/insertNews.do")//鎻掑叆鏂伴椈
	@ResponseBody
	public int insertNews(@RequestBody News news) {
		news.setTime(new Date());
		if(news.getTitle().length()!=0&&news.getAuthor().length()!=0&&news.getN_Content().length()!=0)
		{
			int result= service.insertNews(news);
			return result;
		}
		else
		{
			return 0;
		}
	
	}
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping("/selectinfo.do")//鏍规嵁浣滆�呮垨鑰呮爣棰樻煡璇㈡柊闂�
    /*
     * 根据条件查询新闻
     * Param(condition,pageNow)分别为查询条件，当前数据页码
     */
	public Object findNewsByAuthor(Integer pageNow,String condition) {
		Object list;
		if(condition.replace(" ", "").length()==0||condition==null)
		{
			return list =  findAllNews(pageNow);
		}
		else
		{
			list= service.findNewsByConditionWithPage(pageNow,pageSize, condition);
		}
		return list;
    }
	@ResponseBody
	@RequestMapping("/updateNews.do")
	public int updateNews(@RequestBody News news) {
		System.out.println(news.getNid());
		System.out.println(news);
	   int result = service.updateNewsById(news);
	   if(result!=0)
	   {
		   return 1;
	   }
	   else {
		 return 0;
	   }
	   
	}
	@ResponseBody
	@RequestMapping("/deleteNews.do")
	public int deleteNews(Integer id) {
		System.out.println(id);
		int result = service.deleteNews(id);
		   if(result!=0)
		   {
			   return 1;
		   }
		   else {
			   return 0;
		   }
	   
	}

}
