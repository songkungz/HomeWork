<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style1.css" rel="stylesheet" type="text/css" />
<style type="text/css">
li.file{
	display:inline-block;
	width:100px;height:20px;
	line-height:20px;
	position:relative;
	overflow:hidden;
	color:red
}
li.file input{
	position:absolute;
	left:0px;
	top:0px;
	zoom:1;
	filter:alpha(opacity=0);
	opacity:0;
	font-size:20px;
	margin-left:-240px}
</style>
</head>
<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">表单</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>基本信息</span></div>
    <form  action="news/insertNews.do" method="post">
    <ul class="forminfo" >
    <li><label>文章标题</label><input name="title" type="text" class="dfinput" /><i>标题不能超过30个字符</i></li>
    <li><label>作者</label><input name="Author" type="text" class="dfinput" /><i>多个关键字用,隔开</i></li>
    <li><label><input type="file" name="image">选择图片</label></li>
    <li><label>文章内容</label><textarea name="n_Content" cols="" rows="" class="textinput"></textarea></li>
    <li><button type="submit" value="确认保存">确认保存</button></li>
    </ul>
    </form>
    
    </div>
</body>
</html>