package com.gz.dao;

import java.util.List;

import com.gz.bean.News;

public interface NewsDao {
	int insertNews(News news);//插入新闻
	List<News> selectAllNews();//查询所有新闻消息
    int updateNewsByid(int id);//根据新闻id修改内容
    int deleteNews(int id);//根据id删除新闻
    List<News> selectNewsByTitleOrAuthor(String condition);//根据标题或者作者进行新闻查询
}
