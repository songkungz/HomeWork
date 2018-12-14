package com.gz.service;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gz.bean.Comment;
import com.gz.bean.Page;


public interface CommentService {


    Page<Comment> findComment( int pageNow,int pageSize);
	
	int getCountComment(String courselist);
	
    int insertComment(Comment Comment);
	
	int deleteComment(Integer commentid);
	Page<Comment> selectChildrenById(@Param("Cid")int Cid,@Param("startPos")int startPos, @Param("pageSize")int pageSize);
}
