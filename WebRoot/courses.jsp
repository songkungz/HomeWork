<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/bootstrap-paginator.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
	<style type="text/css">
	.list{
	 padding-top:30px;
	  padding-left:30px;
	}
	.title{
	 padding-top:30px;
	  padding-left:30px;
	  font-size:20px;
	  color:black;
	}
	</style>	
</head>
<body >
	<!-- 培训课程部分 -->
	<br><br><br><a href="index.jsp"  class="title">首页</a>&nbsp; > &nbsp; <a href="CourseList.jsp"  class="title">课程</a>&nbsp; > &nbsp;<span font-size:22px; id="test"></span>
	<div id = "list"  class="list">
	
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
		
Request = {  
        QueryString : function(item){  
        var svalue = location.search.match(new RegExp("[\?\&]" + item + "=([^\&]*)(\&?)","i"));  
        return svalue ? svalue[1] : svalue;  
        }  
        }            
type = decodeURI(Request.QueryString("type"));	
$(function(){
        $.ajax({
         url:'cou/findCoursesByType.do',
         type:'post',
         datatype:'json',
         data:{"pageNow":1,"Ctype":type},
         success:function(list){
    //将数据显示在页面上
      document.getElementById("test").innerHTML=type;
        var str = "";            
     //遍历数据
       str +="<div class='container' data-v-062ec5dc=''>";
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
         $("#page").bootstrapPaginator({
               bootstrapMajorVersion:3, //对应的bootstrap版本
               currentPage: list.pageNow, //当前页数
               numberOfPages: 10, //每次显示页数
               totalPages:list.totalPageCount, //总页数
               shouldShowPage:true,//是否显示该按钮
               useBootstrapTooltip:true,
               //点击事件
               onPageClicked: function (event, originalEvent, type, page) {
                   moreCourse(page,type)
   
               }
          
		})
		},
		error:function(){
		alert("请求失败！");
		}
	 })
 })
       
function moreCourse(pageNow,type){
        $.ajax({
         url:'cou/findCoursesByType.do',
         type:'post',
         datatype:'json',
         data:{"pageNow":pageNow+1,"Ctype":type},
         success:function(list){
    //将数据显示在页面上
        var str = "";            
     //遍历数据
       str +="<div class='container' data-v-062ec5dc=''>";
     
       str+="<div class='m-l--15 m-r--15 m-b--25'>";
       $.each(list.list,function(index,element){
        str +="<a href='coursedetail.jsp?id="+element.cid+"' target='_blank' class='CourseListItem_ListItem show' index="+index+">";
        str +="<div class='CourseListItem_cover'>";
        str +="<div class='CourseListItem_img' style='background-image: url("+element.cimage+");'>";
		str +=" <img src='"+element.cimage+"' alt=''></div> ";
		str +="<div class='CourseListItem_tags'>  </div> ";
         str +=" <div class='CourseListItem_status'>共"+element.cnum+"课";
         str +=" </div></div> <div class='CourseListItem_body'><div class='CourseListItem_info'>";
          str +=" <div class='text-ellipsis-line-2 CourseListItem_title'>世界记忆大师教你快速提升记忆力</div>";
           str +="<div class='CourseListItem_subtitle'>在最短的时间内，记住更多你想获得的知识！</div></div> ";
            str +="<div class='CourseListItem_price'>￥49.00";
             str +="<del class='CourseListItem_oriPrice'>￥"+element.cprice+"</del></div></div></a>";
	 		})
         $('#list').append(str);
         
		},
		error:function(){
		alert("请求失败！");
		}
	 })
}
       
       

 
</script>
<div id="page"></div>  	
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
