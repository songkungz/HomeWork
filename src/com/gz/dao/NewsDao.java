package com.gz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gz.bean.News;

public interface NewsDao {
	int insertNews(News news);//插入新闻
	List<News> selectAllNews();//查询所有新闻消息
	List<News> selectNewsByid(int id);//根据新闻id查询内容
    int updateNewsByid(News news);//根据新闻id修改内容
    int deleteNews(int id);//根据id删除新闻
    List<News> selectNewsByConditionWithPage(@Param("Author")String condition,@Param("startPos")int startPos, @Param("pageSize")int pageSize);//根据作者进行新闻查询
    int getCount();//获取数据总条数
    int getCountByCondition(@Param("Author")String condition);//获取满足条件的数据总条数
	List<News> findNews(@Param("startPos")int startPos, @Param("pageSize")int pageSize);//分页查询数据
}
