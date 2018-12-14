package com.gz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.gz.bean.Page;
import com.gz.bean.Teacher;
import com.gz.dao.TeacherDao;
@Service
public class TeacherServiceImpl implements TeacherService {
    @Autowired
	private TeacherDao dao;

	@Override
	public List<Teacher> selectTeacher() {
		// TODO Auto-generated method stub
		return dao.selectTeacher();
	}

	@Override
	public int insertTeacher(Teacher teacher) {
		// TODO Auto-generated method stub
		return dao.insertTeacher(teacher);
	}



	@Override
	public int deleteTeacher(int id) {
		// TODO Auto-generated method stub
		return dao.deleteTeacher(id);
	}

	@Override
	public int updateTeacher(Teacher teacher) {
		// TODO Auto-generated method stub
		return dao.updateTeacher(teacher);
	}

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return dao.getCount();
	}



	@Override
	public Page<Teacher> findTeacherWithPage(int pageNow,int pageSize) {
		// TODO Auto-generated method stub
		int totalCount = dao.getCount();
		Page pg = new Page( totalCount,  pageNow,pageSize);	
		pg.setPageSize(pageSize);
        List<Teacher> list = dao.findTeacherWithPage(pg.getStartPos(), pg.getPageSize());//调用分页 
   	    pg.setList(list);
   	    return pg;
	}

	@Override
	public Page<Teacher> selectTeacherByConditionWithPage(String condition, int pageNow,int pageSzie) {
		int totalCount = dao.getCountByCondition(condition);
		Page pg = new Page( totalCount,  pageNow,pageSzie);	
		pg.setPageSize(pageSzie);
        List<Teacher> list = dao.selectTeacherByConditionWithPage(condition,pg.getStartPos(), pg.getPageSize());//调用分页 
   	    pg.setList(list);
		return pg;
	}

	@Override
	public int getCountByCondition(String condition) {
		// TODO Auto-generated method stub
		return dao.getCountByCondition(condition);
	}

	@Override
	public Teacher selectTeacherById(int id) {
		// TODO Auto-generated method stub
		return dao.selectTeacherById(id);
	}

	@Override
	public Page<Teacher> selectTeacherByTypeWithPage(String type, int pageNow, int pageSzie) {
		int totalCount = dao.getCountByCondition(type);
		Page pg = new Page( totalCount,  pageNow,pageSzie);	
		pg.setPageSize(pageSzie);
        List<Teacher> list = dao.selectTeacherByTypeWithPage(type,pg.getStartPos(), pg.getPageSize());//调用分页 
   	    pg.setList(list);
		return pg;
	}

	@Override
	public Teacher findCourseByTeacherId(int id) {
		// TODO Auto-generated method stubs
		return dao.findCourseByTeacherId(id);
	}

	@Override
	public List<Teacher> selectTeacherByType(String type) {
		// TODO Auto-generated method stub
		return dao.selectTeacherByType(type);
	}

	

	
}
