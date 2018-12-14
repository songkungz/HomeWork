<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<title>详细新闻</title>
</head>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
C1=window.location.href.split("?")[1]; 
id=C1.split("=")[1]; 
$.ajax({
                url:"news/findnewsbyid.do",
                type:"post",
                data:{"id":id},
                dataType:"json",
                success:function(data){	
                     nid=data[0].nid;
                    console.log(data);
		                $("#title").val(data[0].title);
			            $("#n_Content").val(data[0].n_Content);
			            $("#author").val(data[0].author);
			 	},
			 	error:function(){
 						alert("请求失败")
 				}
            })  
})

</script>
<body background="images/a.jpg">
	<div class="">
<h1 align="center" class="title" >新闻标题</h1>

	<div>
<a href="../导航.html">xxx培训中心</a>
<a href="#">发布人</a>>
<span>发布时间</span>
	</div><br><hr><br><br>	
	<p class="img">
<img src="../images/banner001.jpg" align="left" width="600" height="400">
	</p>
		<h2 class="text">培训中心网站：

1、开发环境：web服务器 Tomcat；数据库 MySQL 语言：Java（尽量使用Java，也可使用其他语言）；

2、展示终端：PC端（必做）、移动端、微信端、小程序。

3、前端需要自适应各种终端窗口。

4、前端模块：新闻资讯、中心简介、培训课程、师资力量、培训动态、学员心声、培训展示、教学资源、联系我们。

5、功能说明：图文及视频展示功能、留言功能、相册功能。

6、后台管理：需分权限进行管理（超级管理员、信息管理员）。

此项目分组完成，每组不能超过6人，做好项目分工。


</h2>
</div>
</body>
<style type="text/css">
.title{
	font-size: 49px;
}
.img{
	padding: 20px;
}
.text{
	font-size: 24px;
	color: white;
	font-family: kaiti;
};
</style>
</html>
