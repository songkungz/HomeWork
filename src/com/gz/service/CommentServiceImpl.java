package com.gz.service;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.gz.bean.Comment;
import com.gz.bean.Page;
import com.gz.dao.CommentDao;

@Service

public class CommentServiceImpl implements CommentService{

	@Autowired
	private CommentDao dao;
	
	
	
	@Override
	public Page<Comment> findComment(int pageNow,int pageSize) {
		// TODO Auto-generated method stub
		int totalCount = dao.getCount();
		Page pg = new Page( totalCount,  pageNow,pageSize);	
        List<Comment> list = dao.selectComment(pg.getStartPos(), pg.getPageSize());//调用分页 
   	    pg.setList(list);
		return pg;
	}
	
	@Override
	public int getCountComment(String courselist) {
		// TODO Auto-generated method stub
		return dao.getCountComment(courselist);
	}
	
	
	@Override
	public int insertComment(Comment Comment) {
		// TODO Auto-generated method stub
		return dao.insertComment(Comment);
	}
	
	
	@Override
	public int deleteComment(Integer commentid) {
		// TODO Auto-generated method stub
		return dao.deleteComment(commentid);
	}

	@Override
	public Page<Comment> selectChildrenById(int Cid, int pageNow,int pageSize) {
		// TODO Auto-generated method stub
		int totalCount = dao.getCountById();
		Page pg = new Page( totalCount,  pageNow,pageSize);	
        List<Comment> list = dao.selectChildrenById(Cid, pg.getStartPos(), pg.getPageSize());//调用分页 
   	    pg.setList(list);
		return pg;
	}
	
	
}