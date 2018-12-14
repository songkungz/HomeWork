package com.gz.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gz.bean.Columns;
import com.gz.bean.Page;
import com.gz.service.ColumnService;

@Controller
@RequestMapping("column")
public class ColumnController {
@Autowired
private  ColumnService service;
private int pageSize = 6;
/*
 * 查询所有大类信息
 * return List<Column>
 * 传入参数pageNow（当前显示页面页码）
 */
@SuppressWarnings("rawtypes")
@RequestMapping("/columninfo.do")
@ResponseBody
public Object findAllColumn(Integer pageNow) {
	Page pg = service.selectAllColumnWithPage(pageNow, pageSize);
	return  pg;

}

@RequestMapping("/allcolumn.do")
@ResponseBody
public Object findAllColumn() {
	List<Columns> pg = service.selectAllColumn();
	return  pg;

}

@RequestMapping("/findcolumnbyid.do")
@ResponseBody
public Object  findColumnById(Integer id) {
	Columns list =service.findColumnById(id);
	return list;
}
@RequestMapping("/findChildColumnById.do")
@ResponseBody
public Object  findChildColumnById(Integer id) {
	List<Columns> list = service.findChildColumnById(id);
	return list;
}
@RequestMapping("/insertColumn.do")
@ResponseBody
public int insertColumn(@RequestBody Columns column) {

		int result= service.insertColumn(column);
		if(result>0)
		{
			return 1;
		}
		else
		{
			return 0;
		}

}
@SuppressWarnings("unchecked")
@ResponseBody
@RequestMapping("/selectcolumn.do")
/*
 * 根据条件查询栏目
 * Param(condition,pageNow)分别为查询条件，当前数据页码
 */
public Object findColumnByName(Integer pageNow,String condition) {
	Object list;
	if(condition.replace(" ", "").length()==0||condition==null)
	{
		return list = findAllColumn(pageNow);
	}
	else
	{
		list= service.selectAllColumnByNameWithPage(pageNow, pageSize, condition);
	}
	return list;
}
@ResponseBody
@RequestMapping("/updateColumn.do")
public int updateTeacher(@RequestBody Columns column) {
	
   int result = service.updateColumn(column);
   if(result!=0)
   {
	   return 1;
   }
   else {
	 return 0;
   }
   
}
@ResponseBody
@RequestMapping("/deleteColumn.do")
public int deleteTeacher(Integer id) {
	int result = service.deleteColumn(id);
	   if(result!=0)
	   {
		   return 1;
	   }
	   else {
		   return 0;
	   }
   
}

}
