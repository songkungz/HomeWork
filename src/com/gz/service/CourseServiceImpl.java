package com.gz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.gz.bean.Course;
import com.gz.bean.Page;
import com.gz.dao.CourseDao;


//创建service对象
@Service
public class CourseServiceImpl implements CourseService {
	
//	自动注入Dao对象
	@Autowired
	private CourseDao dao;
	
		@Override
		public List<Course> selectChildrenCourseById(int id) {
			// TODO Auto-generated method stub
			return dao.selectChildrenById(id);
		}


		@Override
		public Course selectCourseVideoById(int id) {
			// TODO Auto-generated method stub
			return dao.selectVedioById(id);
		}


		@Override
		public Page<Course> findCourse(int pageNow, String Ctype, int pageSize) {
			// TODO Auto-generated method stub
			System.out.println("--------------------被调用"+Ctype);
			int totalCount = dao.getCountByCtype(Ctype);
			System.out.println("--------------------被调用1"+totalCount);
			Page pg = new Page( totalCount,  pageNow,pageSize);	
	        List<Course> list = dao.selectCourse(Ctype,pg.getStartPos(), pg.getPageSize());//调用分页
	        System.out.println("--------------------被调用2"+totalCount);
	   	    pg.setList(list);
			return pg;

		}


		@Override
		public Page<Course> findCourseByName(int pageNow, String cname, int pageSize) {
			System.out.println("--------------------有被调用1"+cname);
			int totalCount = dao.getCountByCname(cname);
			System.out.println("--------------------有被调用2"+totalCount);
			Page pg = new Page( totalCount,  pageNow,pageSize);	
	        List<Course> list = dao.selectCourseByName(cname,pg.getStartPos(), pg.getPageSize());//调用分页 
	        System.out.println("--------------------有被调用3"+list);
	        pg.setList(list);
			return pg;
		}


		@Override
		public int insertCourse(Course Course) {
			// TODO Auto-generated method stub
			return dao.insertCourse(Course);
		}


		@Override
		public int updateCourseById(Course Course) {
			// TODO Auto-generated method stub
			return dao.updateCourseById(Course);
		}

		@Override
		public int deleteCourse(Integer cid) {
			// TODO Auto-generated method stub
			return dao.deleteCourse(cid);
		}


		@Override
		public Page<Course> selectAllCourse(int pageNow, int pageSize) {
			// TODO Auto-generated method stub
			int totalCount = dao.getCount();
			Page pg = new Page( totalCount,  pageNow,pageSize);	
	        List<Course> list = dao.selectAllCourse(pg.getStartPos(), pg.getPageSize());//调用分页 
	   	    pg.setList(list);
			return pg;
		}


		@Override
		public Course selectCourseById(int id) {
			// TODO Auto-generated method stub
			return dao.selectCourseById(id);
		}


		@Override
		public List<Course> findAllCourse() {
			// TODO Auto-generated method stub
			return dao.selectAllCourses();
		}


		@Override
		public List<Course> oneTypeCourse() {
			// TODO Auto-generated method stub
			return dao.oneTypeCourse();
		}}

