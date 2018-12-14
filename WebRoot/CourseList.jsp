<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<!-- Meta tags -->
	<title>培训课程</title>
	<meta name="keywords" content="Edumate a Education Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
	Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- style.css -->
 <link type="text/css" rel="stylesheet" href="css/stylecourse.css">
 <link type="text/css" rel="stylesheet" href="css/style.css">
 <!-- play.css -->
 <link rel="stylesheet" href="css/play.css">
 <link rel="stylesheet" type="text/css" href="css/courselist.css">
<!-- 链接被删除，暂时隐藏 -->


<link rel="stylesheet" href="css/coursetable.css">
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
   <script src="js/bootstrap-paginator.js" type="text/javascript"></script>
	<style type="text/css">
	.input_box{
	  width:160px;
	  height:36px;
	  border-radius: 3px;
	  padding-left:5px;
	}
	.btn{
	 width:80px;
	  height:36px;
	  border-radius: 3px;
	  background-color:#ffffff ;
	  border:1px solid grey;
	  font-size:16px;
	}
	.fr{
	  float:right;
	  margin-right:25px;
	}
	</style>	
	<script type="text/javascript">
	$(function(){
	$("#select").click(function(){
        $.ajax({
         url:'cou/findCoursesByType.do',
         type:'post',
         data:{"Ctype":document.getElementById("condition").value,"pageNow":1},
         dataType:'json',
         success:function(list){
    //将数据显示在页面上
        console.log(list);
          var str = "";            
     //遍历数据
       str +="<div class='container' data-v-062ec5dc=''>";
       str+="<div data-v-062ec5dc=''><h2 class='m-t-50 m-b-20 f-s-24'><span class='classify-name'>"+list.list[0].ctype+"</span><a id='more'   href='courses.jsp?type="+list.list[0].ctype+"' class='f-s-16 pull-right text-grey' target='_black'><span class='align-middle'>更多课程</span> <i class='arrow arrow-right'></i></a></h2> ";
       str+="<div class='m-l--15 m-r--15 m-b--25'>";
       $.each(list.list,function(index,element){
       
        str +="<a href='coursedetail.jsp?id="+element.cid+"' target='_blank' class='CourseListItem_ListItem show' index="+index+">";
        str +="<div class='CourseListItem_cover'>";
        str +="<div class='CourseListItem_img' style='background-image: url("+element.cimage+");'>";
		str +=" <img src='"+element.cimage+"' alt=''></div> ";
		str +="<div class='CourseListItem_tags'>  </div> ";
         str +=" <div class='CourseListItem_status'>共"+element.cnum+"课";
         str +=" </div></div> <div class='CourseListItem_body'><div class='CourseListItem_info'>";
          str +=" <div class='text-ellipsis-line-2 CourseListItem_title'>"+element.ctitle+"</div>";
           str +="<div class='CourseListItem_subtitle'>"+element.csynopsis+"</div></div> ";
            str +="<div class='CourseListItem_price'>￥0.00";
             str +="<del class='CourseListItem_oriPrice'>￥"+element.cprice+"</del></div></div></a>";
	 		})
	 		
         $('#list').append(str);
           
		},
		error:function(){
		}
	  })
 })
	})
	
	</script>
</head>

<body >

   <br><br><br><a href="index.jsp"  class="title">首页</a>&nbsp; > &nbsp; <span font-size:18px>课程</span>
    <div class="fr"><input type="text" placeholder="输入课程名或课程类型" class="input_box" id="condition">
    <button type="button" class="btn" id="select">查询</button> 
    </div>
	<!-- 培训课程部分 -->
	<div id = "head"></div>
	<div id = "list">
	
	</div>
		
<!-- 培训课程结束 -->
	
	
	<!-- //copyright -->
	
	<script type="text/javascript" src="js/move-top.js"></script>
	<script type="text/javascript" src="js/easing.js"></script>
	<!-- here stars scrolling icon -->
	
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			*/
								
			$().UItoTop({ easingType: 'easeOutQuart' });
								
			});
			function getJsonLength(jsonData){

                var jsonLength = 0;

                  for(var item in jsonData){

				jsonLength++;
				
				}
				
				return jsonLength;
				
				}
	</script>
	<!-- //here ends scrolling icon -->
	<!-- scrolling script -->
	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){		
				event.preventDefault();
				$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
			});
		});
	</script> 
	<!-- //scrolling script -->
	
<script type="text/javascript">

$(function(){
        $.ajax({
         url:'cou/findAllCourseType.do',
         type:'post',
         datatype:'json',
         success:function(list){
    //将数据显示在页面上
        $.each(list,function(index,element){
             typeList(element.ctype,0);
             index+=1;           
          })
           
		}
		
	  })
 })
function typeList(type,pageNow){
    
        $.ajax({
         url:'cou/findCoursesByType.do',
         type:'post',
         datatype:'json',
         data:{"pageNow":pageNow+1,
         "Ctype":type},
         success:function(list){
    //将数据显示在页面上

        var str = "";            
     //遍历数据
       str +="<div class='container' data-v-062ec5dc=''>";
       str+="<div data-v-062ec5dc=''><h2 class='m-t-50 m-b-20 f-s-24'><span class='classify-name'>"+type+"</span><a id='more'   href='courses.jsp?type="+type+"' class='f-s-16 pull-right text-grey' target='_black'><span class='align-middle'>更多课程</span> <i class='arrow arrow-right'></i></a></h2> ";
       str+="<div class='m-l--15 m-r--15 m-b--25'>";
       $.each(list.list,function(index,element){
       
        str +="<a href='coursedetail.jsp?id="+element.cid+"' target='_blank' class='CourseListItem_ListItem show' index="+index+">";
        str +="<div class='CourseListItem_cover'>";
        str +="<div class='CourseListItem_img' style='background-image: url("+element.cimage+");'>";
		str +=" <img src='"+element.cimage+"' alt=''></div> ";
		str +="<div class='CourseListItem_tags'>  </div> ";
         str +=" <div class='CourseListItem_status'>共"+element.cnum+"课";
         str +=" </div></div> <div class='CourseListItem_body'><div class='CourseListItem_info'>";
          str +=" <div class='text-ellipsis-line-2 CourseListItem_title'>"+element.ctitle+"</div>";
           str +="<div class='CourseListItem_subtitle'>"+element.csynopsis+"</div></div> ";
            str +="<div class='CourseListItem_price'>￥0.00";
             str +="<del class='CourseListItem_oriPrice'>￥"+element.cprice+"</del></div></div></a>";
	 		})
         $('#list').append(str);
         
	 }
	 })
  } 
       

 
</script>  	
<div class="tailweibu">
   <div class="contact w3ls-contact " id="contact">
  <div class="container w3-contact">
  <div class="list1">
  <ul class="contact-list">
    <li class="heading"> 关于我们</li>
    <li>+86</li>
    <li>18786186883</li>
    <li><a href="mailto:yourmailid@company.com">sharf_wang@163.com</a></li>
  </ul>
  
  <ul class="contact-hrs">
    <li class="heading">工作日</li>
    <li>周一至周五</li>
    <li>09:00  - 18:30 </li>
  </ul>
  </div>
  <div class="list2">
  <ul class="social-links">
    <li class="heading">联系我们 </li>
    <li><a href="https://weibo.com/u/3294879587">微博</a></li>
    <li><a href="qq.com">QQ</a></li>
    <li><a href="weixin.com">微信</a></li>
    <li><a href="facebook.com">facebook </a></li>
  </ul>
  
  <ul class="sub-scribe">
    <li class="heading">Subscribe</li>
    <li>
      <form action="/" method="post">
        <input type="email" name="email" placeholder="Enter Your E-Mail" required><br>
        <input type="submit" value="Subscribe"><br>
      </form>
    </li>
  </ul>
  </div>
  </div>
  <div class="agileits-w3layouts">
    <div class="container">
      <p>@XXX培训中心2018| Design by <a href="https://weibo.com/u/3294879587"> The group tenth</a></p>
    </div>
  </div>
</div>
</div>
      
</body >
</html>
