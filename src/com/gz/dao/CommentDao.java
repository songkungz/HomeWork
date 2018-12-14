package com.gz.dao;




import java.util.List;

import org.apache.ibatis.annotations.Param;


import com.gz.bean.Comment;

public interface CommentDao {
	
    List<Comment> selectComment(@Param("startPos")int startPos, @Param("pageSize")int pageSize);
	
	int getCountComment(@Param("courselist")String courselist);
	
	int insertComment(Comment Comment);
	
	int deleteComment(@Param("Commentid")int commentid);
	List<Comment> selectChildrenById(@Param("Cid")int Cid,@Param("startPos")int startPos, @Param("pageSize")int pageSize);
	int getCountById();
	int getCount();

}