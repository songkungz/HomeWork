<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style1.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
  $("#save").click(function(){
		var str ={
		    "title":document.getElementById('title').value,
		    "author":document.getElementById('author').value,
		    "n_Content":document.getElementById('n_Content').value,
		    "imge":document.getElementById('image').value
		    };
		    var str_json = JSON.stringify(str); 
			  $.ajax({
			    url:"news/insertNews.do",
			    type:"post",
			    data:str_json,
				contentType:"application/json; charset=utf-8",
				dataType:"json", 
				success:function(data){
				if(data>0)
				{
				alert("保存成功");
				}
				else
				{
				alert("保存失败");
				}
				},
				error:function(){}
			    })
			  });
})
</script>
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
    <ul class="forminfo" >
    <li><label>文章标题</label><input id="title" name="title" type="text" class="dfinput" /></li>
    <li><label>作者</label><input id="author" name="author" type="text" class="dfinput" /></li>
    <li><label><input type="file" id="image" name="image">选择图片</label></li>
    <li><label>文章内容</label><textarea id="n_Content" name="n_Content" cols="" rows="" class="textinput"></textarea></li>
    <li><button type="submit" value="确认保存" id="save">确认保存</button></li>
    </ul>
    
    </div>
</body>
</html>