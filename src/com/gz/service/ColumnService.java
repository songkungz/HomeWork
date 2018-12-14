package com.gz.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gz.bean.Columns;
import com.gz.bean.Page;

public interface ColumnService {
	   //获取数据条数
		int getCount();
		//通过条件获取数据条数
		int getCountByCondition(String condition);
	     //查询所有栏目
		Page<Columns> selectAllColumnWithPage(int pageNow,int pageSize);
		//查询所有课程教师类别栏目
		Page<Columns> selectAllColumnByNameWithPage(int pageNow,int pageSize,@Param("Name")String Name);
		//添加栏目
		int insertColumn(Columns column);
		//修改栏目
		int updateColumn(Columns column);
		//删除栏目
		int deleteColumn(int id);
		//根据id查询栏目
		Columns findColumnById(@Param("col_id")int id);
		List<Columns> findChildColumnById(int id);
		List<Columns> selectAllColumn();//获取所有栏目
}
