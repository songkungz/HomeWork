package com.gz.service;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gz.bean.News;

public interface NewsService {
 int insertNews(News news);
 List<News> findNews();
 int updateNewsById(int id,News news);
 int deleteNews(int id);
 List<News> selectNewsByAuthor(String condition);
 int getCount();
}
