package com.gz.service;


import java.util.List;


import com.gz.bean.News;
import com.gz.bean.Page;

public interface NewsService {
 int insertNews(News news);
 List<News> selectNewsByid(int id);
 int updateNewsById(News news);
 int deleteNews(int id);
 int getCount();
List<News> findNews();//轮播图数据查询
int getCountByCondition(String condition);//获取满足条件的数据总条数
Page<News> findAllNewsWithPage(int pageNow, int pageSize);
Page<News> findNewsByConditionWithPage(int pageNow, int pageSize, String condition);

}
