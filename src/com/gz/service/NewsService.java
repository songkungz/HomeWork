package com.gz.service;


import java.util.List;

import com.gz.bean.News;

public interface NewsService {
 int insertNews(News news);
 List<News> findNews();
 int updateNewsById(int id);
 int deleteNews(int id);
 List<News> selectNewsByTitleOrAuthor(String condition);
 int getCount();
}
