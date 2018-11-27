package com.gz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gz.bean.News;

public interface NewsDao {
	int insertNews(News news);//插入新闻
	List<News> selectAllNews();//查询所有新闻消息
    int updateNewsByid(int id,News news);//根据新闻id修改内容
    int deleteNews(int id);//根据id删除新闻
    List<News> selectNewsByAuthor(@Param("Author")String condition);//根据作者进行新闻查询
    int getCount();//获取数据总条数
}
