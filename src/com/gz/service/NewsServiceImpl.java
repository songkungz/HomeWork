package com.gz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gz.bean.News;
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
	public int updateNewsById(int id, News news) {
		// TODO Auto-generated method stub
		return dao.updateNewsByid(id,news);
	}

	@Override
	public List<News> selectNewsByAuthor(String condition) {
		// TODO Auto-generated method stub
		return dao.selectNewsByAuthor(condition);
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
	public List<News> findNews() {
		// TODO Auto-generated method stub
		return dao.selectAllNews();
	}

}
