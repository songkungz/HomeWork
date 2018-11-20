<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<title>Signin</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="App Sign in Form,Login Forms,Sign up Forms,Registration Forms,News latter Forms,Elements"./>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
</script>
<!--webfonts-->
<!--//webfonts-->
</head>
<script type="text/javascript">
</script>
<body>
	<h1>欢迎登录</h1>
		<div class="app-cam">
			<div class="cam"><img src="images/cam.png" class="img-responsive" alt="" /></div>
			<form action="user/login.do" method="post">
				<input type="text" name="name" class="text" value="用户名" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '用户名';}" >
				<input type="password" name="pwd"value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}">
				<div class="clear"></div>
				<div class="buttons">
					<ul>
						<li><input  type=submit class="hvr-sweep-to-right" value="用户登录"></li>
						<li><input  type=submit class="hvr-sweep-to-left"  value="管理员登录"></li>
						<div class="clear"></div>
					</ul>
				</div>
				<div class="new">
					<p class="wang"><a href="#">忘记密码</a></p>
					<p class="sign"><a href="register.html">没有账号，注册</a></p>
					<div class="clear"></div>
				</div>
			</form>
		</div>
	<!--//end-copyright-->
</body>
<style type="text/css">


/* reset */
html,body,div,span,applet,object,iframe,h1,h2,h3,h4,h5,h6,p,blockquote,pre,a,abbr,acronym,address,big,cite,code,del,dfn,em,img,ins,kbd,q,s,samp,small,strike,strong,sub,sup,tt,var,b,u,i,dl,dt,dd,ol,nav ul,nav li,fieldset,form,label,legend,table,caption,tbody,tfoot,thead,tr,th,td,article,aside,canvas,details,embed,figure,figcaption,footer,header,hgroup,menu,nav,output,ruby,section,summary,time,mark,audio,video{margin:0;padding:0;border:0;font-size:100%;font:inherit;vertical-align:baseline;}
article, aside, details, figcaption, figure,footer, header, hgroup, menu, nav, section {display: block;}
ol,ul{list-style:none;margin:0px;padding:0px;}
blockquote,q{quotes:none;}
blockquote:before,blockquote:after,q:before,q:after{content:'';content:none;}
table{border-collapse:collapse;border-spacing:0;}
/* start editing from here */
a{text-decoration:none;}
.txt-rt{text-align:right;}/* text align right */
.txt-lt{text-align:left;}/* text align left */
.txt-center{text-align:center;}/* text align center */
.float-rt{float:right;}/* float right */
.float-lt{float:left;}/* float left */
.clear{clear:both;}/* clear float */
.pos-relative{position:relative;}/* Position Relative */
.pos-absolute{position:absolute;}/* Position Absolute */
.vertical-base{	vertical-align:baseline;}/* vertical align baseline */
.vertical-top{	vertical-align:top;}/* vertical align top */
nav.vertical ul li{	display:block;}/* vertical menu */
nav.horizontal ul li{	display: inline-block;}/* horizontal menu */
img{max-width:100%;}
/*end reset*/
/****-----start-body----****/
body{
	background:url("images/pattern.png");
  font-family: 'Microsoft YaHei', sans-serif;

}
body a,form li,.submit input[type="submit"],.new p a,.new p.sign{
	transition: 0.1s all;
	-webkit-transition: 0.1s all;
	-moz-transition: 0.1s all;
	-o-transition: 0.1s all;
}
body h1 {
  color:#fff;
  text-align: center;
  padding: 1em 0;
  font-size: 2.9em;
}
.app-cam h2{
  color: #fff;
  text-align: center;
  padding: 1em 0;
  font-size: 1.6em;
  font-weight: 300;
}
.app-cam{
  width:28%;
  margin:0 auto;
  text-align: center;
  background:url("images/bg.jpg")0px 0px no-repeat;
  padding:4em;
  height: 80%;
}
.cam {
  padding: 1em 0;
}
form {
   padding: 0% 1%;
}
/*-----*/
.cam img {
  margin: 2em 0;
}
.app-cam input[type="text"]{
  width: 81.2%;
  padding: 1.25em 1em 1.25em 4em;
  color: #283440;
  font-size: 16px;
  outline: none;
  font-weight: 500;
  border: none;
  border-bottom:1px solid #C0C3C8;
  font-family: 'Microsoft YaHei', sans-serif;
  background: url("../images/user.png") no-repeat 14px 20px #ffffff;
   border-top-left-radius:0.3em;
   -o-border-top-left-radius:0.3em;
   -moz-border-top-left-radius:0.3em;
   -webkit-border-top-right-radius:0.3em;
    border-top-right-radius:0.3em;
   -o-border-top-right-radius:0.3em;
   -moz-border-top-right-radius:0.3em;
   -webkit-border-top-right-radius:0.3em;
  }
.app-cam input[type="password"]{
  width: 81.2%;
  padding: 1.25em 1em 1.25em 4em;
  color: #283440;
  font-size: 16px;
  outline: none;
  font-weight: 500;
  border: none;
  font-family: 'Microsoft YaHei', sans-serif;
   background: url("../images/pwd.png") no-repeat 14px 20px #ffffff;
  border: none;
   border-bottom-left-radius:0.3em;
   -o-border-bottom-left-radius:0.3em;
   -moz-border-bottom-left-radius:0.3em;
   -webkit-border-bottom-right-radius:0.3em;
    border-bottom-right-radius:0.3em;
   -o-border-bottom-right-radius:0.3em;
   -moz-border-bottom-right-radius:0.3em;
   -webkit-border-bottom-right-radius:0.3em;
  }

  .submit {
  margin: 1em 0;
  }
.app-cam input[type="submit"]{
  font-size: 20px;
  font-weight: 300;
  color: #fff;
  cursor: pointer;
  outline: none;
  padding: 17px 15px;
  width:100%;
  border:3px solid #f9671e;
  background: #f9671e;
  border-radius: 0.3em;
  -o-border-radius: 0.3em;
  -webkit-border-radius: 0.3em;
  -moz-border-radius: 0.3em;
}
input[type="submit"]:hover{
  background:none;
  border: 3px solid #f9671e;
  color: #f9671e;

}
.buttons{
    margin: 5em 0 1em 0;
}
.buttons ul li{
  display: block;
  margin-bottom:1em;
}
/* Sweep To Right */
a.hvr-sweep-to-right {
  display: inline-block;
  vertical-align: middle;
  -webkit-transform: translateZ(0);
  transform: translateZ(0);
  box-shadow: 0 0 1px rgba(0, 0, 0, 0);
  -webkit-backface-visibility: hidden;
  backface-visibility: hidden;
  -moz-osx-font-smoothing: grayscale;
  position: relative;
  -webkit-transition-property: color;
  transition-property: color;
  -webkit-transition-duration: 0.3s;
  transition-duration: 0.3s;
   background:#3b5998;
  width: 91%;
  padding: 1.2em 1em;
  font-size: 1em;
  color: #fff;
  border-radius: 0.3em;
  -o-border-radius: 0.3em;
  -webkit-border-radius: 0.3em;
  -moz-border-radius: 0.3em;
}
a.hvr-sweep-to-right:before {
  content: "";
  position: absolute;
  z-index: -1;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background:#354d7d;
  -webkit-transform: scaleX(0);
  transform: scaleX(0);
  -webkit-transform-origin: 0 50%;
  transform-origin: 0 50%;
  -webkit-transition-property: transform;
  transition-property: transform;
  -webkit-transition-duration: 0.3s;
  transition-duration: 0.3s;
  -webkit-transition-timing-function: ease-out;
  transition-timing-function: ease-out;
  border-radius: 0.3em;
  -o-border-radius: 0.3em;
  -webkit-border-radius: 0.3em;
  -moz-border-radius: 0.3em;
}
a.hvr-sweep-to-right:hover, a.hvr-sweep-to-right:focus, a.hvr-sweep-to-right:active {
  color: white;
}
a.hvr-sweep-to-right:hover:before, a.hvr-sweep-to-right:focus:before, a.hvr-sweep-to-right:active:before {
  -webkit-transform: scaleX(1);
  transform: scaleX(1);
}

/* Sweep To Left */
a.hvr-sweep-to-left {
  display: inline-block;
  vertical-align: middle;
  -webkit-transform: translateZ(0);
  transform: translateZ(0);
  box-shadow: 0 0 1px rgba(0, 0, 0, 0);
  -webkit-backface-visibility: hidden;
  backface-visibility: hidden;
  -moz-osx-font-smoothing: grayscale;
  position: relative;
  -webkit-transition-property: color;
  transition-property: color;
  -webkit-transition-duration: 0.3s;
  transition-duration: 0.3s;
  width: 91%;
  padding: 1.2em 1em;
  font-size: 1em;
  color: #fff;
  background:#1ab2e8;
  border-radius: 0.3em;
  -o-border-radius: 0.3em;
  -webkit-border-radius: 0.3em;
  -moz-border-radius: 0.3em;

}
a.hvr-sweep-to-left:before {
  content: "";
  position: absolute;
  z-index: -1;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: #1499c8;
  -webkit-transform: scaleX(0);
  transform: scaleX(0);
  -webkit-transform-origin: 100% 50%;
  transform-origin: 100% 50%;
  -webkit-transition-property: transform;
  transition-property: transform;
  -webkit-transition-duration: 0.3s;
  transition-duration: 0.3s;
  -webkit-transition-timing-function: ease-out;
  transition-timing-function: ease-out;
  border-radius: 0.3em;
  -o-border-radius: 0.3em;
  -webkit-border-radius: 0.3em;
  -moz-border-radius: 0.3em;
}
a.hvr-sweep-to-left:hover, a.hvr-sweep-to-left:focus, a.hvr-sweep-to-left:active {
  color: white;
}
a.hvr-sweep-to-left:hover:before, a.hvr-sweep-to-left:focus:before, a.hvr-sweep-to-left:active:before {
  -webkit-transform: scaleX(1);
  transform: scaleX(1);
}
.new {
  margin: 4em 0 1em 0;
}
.new p{
  float:left;
}
.new p a,.new p.sign{
  color:#AFAFB0;
  font-weight: 400;
  font-size: 0.9em;
}
.wang{
  font-size: 0.9em;
  color:#AFAFB0;
}
.new p a:hover,.new p.sign a:hover{
  text-decoration: underline;
}
.new p.sign{
  float:right;
}
/*---------------*/
.copy-right {
  padding: 3em 1em;
}
.copy-right p {
	color: #fff;
	font-size: 1em;
	font-weight:400;
  margin: 0 auto;
  text-align: center;
}
.copy-right p a {
	  color: #323542;
}
.copy-right p a:hover {
	text-decoration: underline;
}
/*-----start-responsive-design------*/
@media (max-width:1440px){
  .app-cam{
    width:30%;
  }
  .app-cam input[type="text"],.app-cam input[type="password"]{
    width: 80.2%;
  	
  }
}
@media (max-width:1366px){
  .app-cam{
    width: 30%;
  }
.app-cam input[type="text"], .app-cam input[type="password"] {
    width: 79.7%;
  }
body h1 {
  font-size: 2.6em;
}
  	
}
@media (max-width:1280px){
  .app-cam {
  width: 35%;
  }
  .app-cam input[type="text"], .app-cam input[type="password"] {
  width: 80.7%;
  }
  
}
@media (max-width:1024px){
  .app-cam {
  width: 47%;
  }
  .app-cam input[type="text"], .app-cam input[type="password"] {
  width: 82.7%;
  }
 
}
@media (max-width:768px){
  body h1 {
  font-size: 2.4em;
  }
  .cam img {
  margin: 2em 0;
}
.app-cam h2 {
  padding: 0.8em 0;
  font-size: 1.6em;
}
.app-cam {
  width: 54%;
  margin: 0 auto 0 15%;
}
.copy-right {
  padding: 1em 1em;
}
.app-cam input[type="text"], .app-cam input[type="password"] {
  width:79.7%;
  }
 
}
@media (max-width:640px){
  body h1 {
  font-size: 2.1em;
}
.app-cam input[type="text"], .app-cam input[type="password"] {
    width: 79.8%;
}
.app-cam {
  width: 65%;
  margin: 0 auto 0 7%;
}
.new {
  margin: 2em 0 1em 0;
}
}
@media (max-width:480px){
  .app-cam {
  width: 90%;
  padding: 2em 1em 1em 1em;
  }
  .copy-right p {
    font-size: 0.9em;
  }
  .new p.sign {
  font-size: 0.9em;
  }
  .new p a {
      font-size: 0.97em;

  }
 .new p.sign a {
  font-size: 0.85em;
}
  form {
  width: 82%;
  margin: 0 auto;
  }
  .app-cam {
  width: 80%;
  }
  .app-cam input[type="text"], .app-cam input[type="password"] {
  width: 72.8%;
  }
  a.hvr-sweep-to-left {
  width: 91%;
  padding: 1.2em 1em;
  font-size: 1em;
  background: #1ab2e8;
  }
  a.hvr-sweep-to-right {
  background: #3b5998;
  width: 91%;
  padding: 1.2em 1em;
  font-size: 1em;
  }
  .buttons {
  margin: 4em 0 1em 0;
}
.cam img {
  width: 25%;
}

}
@media (max-width:320px){
  .app-cam {
  width: 84%;
  padding: 0em 1em 1em 1em;
  margin: 0 auto 0 3%;
  }
  body h1 {
  font-size: 1.5em;
  }
  .copy-right p {
      font-size: 0.8em;
    line-height: 1.7em;
  }
  .app-cam input[type="text"],.app-cam input[type="password"] {
    width:70%;
    padding: 1em 1em 1em 4em;
    font-size: 15px;
    background: url("../images/user.png") no-repeat 14px 20px #fff;
    background-size:9%;
  }
  .app-cam input[type="password"] {
    background: url("../images/pwd.png") no-repeat 14px -37px #fff;
  background-size: 9%;
  }
  .new p.sign {
  font-size: 0.87em;
  padding-top: 1px;
}
 .new p a {
  font-size: 0.845em;
}
 .new p.sign a {
  font-size: 0.83em;
}
  .new {
    margin:1em 0 1em 0;
  }
  .submit {
  margin: 1em 0 0.5em 0;
}
  .app-cam input[type="submit"] {
    font-size: 18px;
    padding: 11px 11px;
    }
  form {
  width:100%;
  margin: 0 auto;
  }
  a.hvr-sweep-to-right {
    background: #3b5998;
    width: 88%;
    padding: 1em 1em;
    font-size: 0.9em;
    background-size: 9%;
  }
  a.hvr-sweep-to-left {
      width: 88%;
    padding: 1em 1em;
    font-size: 0.9em;
    background: #1ab2e8;
    background-size: 8%;
  }
  .buttons {
  margin: 1em 0 1em 0;
}
  .buttons ul li {
    display: block;
    margin-bottom: 0.5em;
  }
}




</html>