package com.gz.controller;


import java.text.ParseException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
    public Object findAllNews() {//鏌ヨ鎵�鏈夋柊闂�
        int start = 0;
        int pageSize = 10;
      
     
        List<News> list = service.findNews();
    	return list;
    }
	@RequestMapping("/insertNews.do")//鎻掑叆鏂伴椈
	@ResponseBody
	public int insertNews(@RequestBody News news) {
		Tools tool = new Tools();
		try {
			news.setTime(tool.getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//news.setNid(tool.randomUUID());
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
	@ResponseBody
	@RequestMapping("/selectinfo.do")//鏍规嵁浣滆�呮垨鑰呮爣棰樻煡璇㈡柊闂�
    public Object findNewsByTitleOrAuthor(String condition) {
		
		List<News> list;
		if(condition.replace(" ", "").length()==0)
		{
			list = service.findNews();
		}
		else
			list = service.selectNewsByTitleOrAuthor(condition);
		return list;
    }
	@RequestMapping("/updateNews.do")
	public void updateNews(int id) {
	   int result = service.updateNewsById(id);
	   if(result!=0)
	   {
		   System.out.println("alert('淇敼鎴愬姛')");
	   }
	   else {
		   System.out.println("alert('淇敼澶辫触')");
	   }
	   
	}
	@RequestMapping("/deleteNews.do")
	public void deleteNews(int id) {
		int result = service.deleteNews(id);
		   if(result!=0)
		   {
			   System.out.println("alert('鍒犻櫎鎴愬姛')");
		   }
		   else {
			   System.out.println("alert('鍒犻櫎澶辫触')");
		   }
	   
	}

}
