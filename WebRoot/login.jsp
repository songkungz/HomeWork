<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
<title>login</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/wang.css" rel='stylesheet' type='text/css' media="all" />
<!-- /css files -->
</head>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>

<body>
<div class="log">
	<div class="content1">
		<h2>登录</h2>
		<form action="user/login.do" method="post">
		    <span>用户名：</span>
		    <br>
			<input type="text" name="name"  >
			<br>
			<span>密码：</span>
		    <br>
			<input type="password" name="pwd"  >
			<div class="button-row">
				<input  type="submit" class="sign-in sign-in-pos" value="登录" >
				<input type="reset" class="reset" value="注册">
				<div class="clear"></div>
			</div>
		</form>
	</div>
</div>
<div class="footer">
	<p>@xxx培训中心2018|design by the group tenth </p>
</div>
</body>
</html>
