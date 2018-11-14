<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="js/jquery-3.3.1.min.js">
	</script>
	
  </head>
  
  <body>
   <table id="news_list">
	<tr>
		<td>1</td>
		<td>2</td>
		<td>3</td>
	</tr>
	</table>
	
	<script type="text/javascript">
	 $.get("news/newsinfo.do",function(news){
	 for(var i=0;i<news.length;i++)
	 {
	    alert(news[i])
	 	$("#news_list").append("<tr>"+"qwewqeqrr"+"</tr>");
	 	
	 }
	 })
 </script>
 
  </body>
</html>
