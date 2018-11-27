package com.gz.controller;


import java.text.ParseException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.gz.bean.News;
import com.gz.bean.Page;
import com.gz.service.NewsService;
import com.gz.service.PageService;
import com.gz.utils.Tools;
@Controller
@RequestMapping("news")
public class newsController {
	@Autowired
	private NewsService service;
	@Autowired
	private PageService pgservice;
	/*
	 * 查询所有信息
	 * return List<News>
	 * 传入参数pageNow（当前显示页面页码）
	 */
	@RequestMapping("/newsinfo.do")
	@ResponseBody
    public List<News> findAllNews(int pageNow) {//  
		Page pg = new Page();
		pg.setTotalCount(service.getCount());//获取数据总条
		pg.setTotalPageCount(pg.getTotalCount()/pg.getPageSize());
		pg.setStartPos((pageNow - 1) * pg.getPageSize());
		if(pageNow>1&&pageNow<pg.getTotalPageCount())
		   pg.setPageNow(pageNow); 
		else if(pageNow==pg.getTotalPageCount())
			pg.setPageNow(pg.getTotalPageCount());
		else
			 pg.setPageNow( 1); 
        List<News> list = pgservice.findNews(pg.getStartPos(), pg.getPageSize());//调用分页
    	return list;
    }
	
	@RequestMapping("/indexinfo.do")
	@ResponseBody
    public Object findNews() {//
		List<News> list =service.findNews();
        List<News>  newList=null;
        for(int i = 0;i < list.size();i++)
        {
        	if(list.get(i).getImge()!=null)
        	{
        		newList.add(i, list.get(i));
        		System.out.println(newList);
        	}
        }
    	return newList;
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
    /*
     * 根据条件查询新闻
     * Param(condition,pageNow)分别为查询条件，当前数据页码
     */
	public List<News> findNewsByTitleOrAuthor(String condition,int pageNow) {
		
		List<News> list;
		if(condition.replace(" ", "").length()==0)
		{
			list =findAllNews(pageNow);
		}
		else
			list = service.selectNewsByAuthor(condition);
		return list;
    }
	@RequestMapping("/updateNews.do")
	public void updateNews(Integer id,News news) {
	   int result = service.updateNewsById(id,news);
	   if(result!=0)
	   {
		   System.out.println("alert('淇敼鎴愬姛')");
	   }
	   else {
		   System.out.println("alert('淇敼澶辫触')");
	   }
	   
	}
	@ResponseBody
	@RequestMapping("/deleteNews.do")
	public int deleteNews(Integer id) {
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
