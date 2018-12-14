package com.gz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gz.bean.Columns;

public interface ColumnDao {
	//获取数据条数
	int getCount();
	//通过条件获取数据条数
	int getCountByCondition(String condition);
     //查询所有栏目
	List<Columns> selectAllColumn();
	List<Columns> selectAllColumnWithPage(@Param("startPos")int startPos,@Param("pageSize")int pageSize);
	//查询所有课程教师类别栏目
	List<Columns> selectAllColumnByNameWithPage(@Param("startPos")int startPos,@Param("pageSize")int pageSize,@Param("name")String name);
	//添加栏目
	int insertColumn(Columns column);
	//修改栏目
	int updateColumn(Columns column);
	//删除栏目
	int deleteColumn(int id );
	//根据id查询栏目
	Columns findColumnById(@Param("col_id")int id);
	List<Columns> selectChildrenById(@Param("cid")int id);
}
