<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jquery-3.3.1.min.js">
	</script>
	<script type="text/javascript">
	$(function(){
	newsList();
	})
	  function newsList(){
		$.ajax({
		url:"news/newsinfo.do",
	 	type:"post",
	 	success:function(list){	
	 		$("#news_list").html("");
	 		$.each(list,function(index,value){	
		 			$("#news_list").append("<tr>")
		 			.append("<td>"+value.title+"</td>")
		 			.append("<td>"+value.n_Content+"</td>")
		 			.append("<td>"+value.author+"</td>")
		 			.append("<td>"+value.time+"</td>")
		 			.append("</tr>")
	 		})
	 		
	 	},
	 	error:function(){
	 		alert("请求失败")
	 	}
	 }
	 )
	 }
	 
	/*   $.get("news/newsinfo.do",function(news){
	 for(var i=0;i<news.length;i++)
	 {
	    alert(11111)
	 	$("#news_list").append("<tr>"+news[i]["title"]+"</tr>");
	 }
	 })
	 */
 </script>
  </head>
  
  <body>
  		<form action="news/insertNews.do" method="post">
  			<span>标题</span>
   				<input type="text" name="title">
   			<span>作者</span>
   				<input type="text" name="author">
   			
   			<button type="submit">提交</button>
  		 </form>
  		 <a href="news/newsinfo.do">查看新闻信息</a>
  		 <a href="file/upload.do">文件上传</a>
  		 <form action="news/selectinfo.do">
  		 <input type="text" name="condition">
  		 <button type="submit">查询</button>
  		 </form>
         <table id="news_list">
         </table>
  </body>
</html>
