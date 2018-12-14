package com.gz.controller;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.gz.bean.Comment;
import com.gz.service.CommentService;




@Controller
@RequestMapping("com")
 public class CommentController { 
	@Autowired
	private CommentService service;
	
	
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping("/comment.do")
	public Object Comment(Integer pageNow) {
		System.out.println("com__________________--------pagenow"+pageNow);
        int pageSize = 9;
        //int pageNow=1;
		 Object list= service.findComment(pageNow,pageSize);	
		return list;
    }
	
	@ResponseBody
	@RequestMapping("comentlist.do")
	public Object allComment(Integer pageNow,Integer id) {
        int pageSize = 5;
        //int pageNow=1;
		 Object list= service.selectChildrenById(id,pageNow, pageSize);	
		return list;
    }
		
	@RequestMapping("/insertComment.do")
	@ResponseBody
	public int insertComment(@RequestBody Comment Comment) {
		//String type  = trainCourse.getCtype();
		//String imgs  = trainCourse.getCimage();
          System.out.println("insertComment-------------"+Comment);
		 return service.insertComment(Comment);
		
	}
	
	
	
	
	@RequestMapping("deleteComment.do")
	@ResponseBody
	public void deleteComment(@RequestParam(value = "msg", required = false, defaultValue = "Ĭ��ֵ") int commentid)  {
		System.out.println("msg:" + commentid);
		int result= service.deleteComment(commentid);			
	}
	
	
	
	
	
}
