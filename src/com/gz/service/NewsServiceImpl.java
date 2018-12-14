package com.gz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gz.bean.News;
import com.gz.bean.Page;
import com.gz.dao.NewsDao;
@Service
public class NewsServiceImpl implements NewsService {
    @Autowired
	private NewsDao dao;
	@Override
	public int insertNews(News news) {
		// TODO Auto-generated method stub
		return dao.insertNews(news);
	}

	@Override
	public int updateNewsById( News news) {
		// TODO Auto-generated method stub
		return dao.updateNewsByid(news);
	}

	@Override
	public int deleteNews(int id) {
		// TODO Auto-generated method stub
		return dao.deleteNews(id);
	}

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return dao.getCount();
	}



	@Override
	public List<News> selectNewsByid(int id) {
		// TODO Auto-generated method stub
		return dao.selectNewsByid(id);
	}

	@Override
	public int getCountByCondition(String condition) {
		// TODO Auto-generated method stub
		return dao.getCountByCondition(condition);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Page<News>  findAllNewsWithPage(int pageNow,int pageSize) {
		int totalCount = dao.getCount();
		Page pg = new Page( totalCount,  pageNow,pageSize);	
        List<News> list = dao.findNews(pg.getStartPos(), pg.getPageSize());//调用分页 
   	    pg.setList(list);
		return pg;
	}

	@Override
	public List<News> findNews() {
		// TODO Auto-generated method stub
		return dao.selectAllNews();
	}

	@Override
	public Page<News> findNewsByConditionWithPage(int pageNow, int pageSize,String condition) {
		// TODO Auto-generated method stub
		int totalCount = dao.getCountByCondition(condition);
		Page pg = new Page( totalCount,  pageNow,pageSize);	
        List<News> list = dao.selectNewsByConditionWithPage(condition,pg.getStartPos(), pg.getPageSize());//调用分页 
   	    pg.setList(list);
		return pg;
	}



}
