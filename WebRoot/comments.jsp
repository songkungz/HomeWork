<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>欢迎您的留言</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<style>
	.container{
		width: 1000px;
	}
	.commentbox{
		width: 900px;
		margin: 20px auto;
	}
	.mytextarea {
	    width: 100%;
	    overflow: auto;
	    word-break: break-all;
	    height: 100px;
	    color: #000;
	    font-size: 1em;
	    resize: none;
	}
	.comment-list{
		width: 900px;
		margin: 20px auto;
		clear: both;
		padding-top: 20px;
	}
	.comment-list .comment-info{
		position: relative;
		margin-bottom: 20px;
		margin-bottom: 20px;
		border-bottom: 1px solid #ccc;
	}
	.comment-list .comment-info header{
		width: 10%;
		position: absolute;
	}
	.comment-list .comment-info header img{
		width: 100%;
		border-radius: 50%;
		padding: 5px;
	}
	.comment-list .comment-info .comment-right{
		padding:5px 0px 5px 11%; 
	}
	.comment-list .comment-info .comment-right h3{
		margin: 5px 0px;
	}
	.comment-list .comment-info .comment-right .comment-content-header{
		height: 25px;
	}
	.comment-list .comment-info .comment-right .comment-content-header span,.comment-list .comment-info .comment-right .comment-content-footer span{
		padding-right: 2em;
		color: #aaa;
	}
	.comment-list .comment-info .comment-right .comment-content-header span,.comment-list .comment-info .comment-right .comment-content-footer span.reply-btn,.send,.reply-list-btn{
		cursor: pointer;
	}
	.comment-list .comment-info .comment-right .reply-list {
		border-left: 3px solid #ccc;
		padding-left: 7px;
	}
	.comment-list .comment-info .comment-right .reply-list .reply{
		border-bottom: 1px dashed #ccc;
	}
	.comment-list .comment-info .comment-right .reply-list .reply div span{
		padding-left: 10px;
	}
	.comment-list .comment-info .comment-right .reply-list .reply p span{
		padding-right: 2em;
		color: #aaa;
	}
</style>
<script type="text/javascript">
uid = "${user.uid}";
uname ="${user.uname}";
$(function(){
$("#comment").click(function(){
    var myDate = new Date();//获取系统当前时间
    var date = myDate.toLocaleString( );
    var str = {
      "comment_time":date,
      "uname ":uname,
      "comment_content":document.getElementById("content").value,
      "head_image":"./images/pl-img.jpg",
      };
     var str_json = JSON.stringify(str); 
     if(document.getElementById("content")==null)
     {
         alert("评论内容不能为空");
     }
     else 
     {
     if(uid.length!=0&&uname.length!=0)
     {  
     $.ajax({
      url:"com/insertComment.do",
 	  type:"post",
 	  data:str_json,
 	  contentType:"application/json; charset=utf-8",
 	  success:function(list){	
 	     alert("感谢你的宝贵建议!");
	 },
	error:function(){},
	
      })     
     }
     else
     {
       alert("留下您的宝贵意见需要登录哦！");
        window.location.href("http://localhost:8080/HomeWork/login.jsp");
     }
     }
     
})
})

</script>
</head>

<body>

<div class="container">
	<div class="commentbox">
		<textarea cols="80" rows="50" placeholder="来说几句吧......" class="mytextarea" id="content"></textarea>
		<div class="btn btn-info pull-right" id="comment">评论</div>
	</div>
	<div class="comment-list">

		
	</div>
</div>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.comment.js" ></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	//初始化数据
	
	$(function(){
		
		$("#comment").click(function(){
			var obj = new Object();
			obj.img="./images/pl-img.jpg";
			obj.replyName="匿名";
			obj.content=$("#content").val();
			obj.replyBody="";
			$(".comment-list").addCommentList({data:[],add:obj});
		});
	})
</script>

</body>
</html>