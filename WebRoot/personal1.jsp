<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="css/perstyle.css" />
		<link rel="stylesheet" type="text/css" href="css/iconfont.css" />
		 <link type="text/css" rel="stylesheet" href="css/stylecourse.css">
		 <link type="text/css" rel="stylesheet" href="css/style.css">
		 <!-- play.css -->
		 <link rel="stylesheet" href="css/play.css">
		 <link rel="stylesheet" type="text/css" href="css/courselist.css">
		<!-- 链接被删除，暂时隐藏 -->
		
		
		<link rel="stylesheet" href="css/coursetable.css">
		<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
	</head>
<script type="text/javascript">
id = "${user.uid}";
$(function(){
        $.ajax({
         url:'user/findUserCourseById.do',
         type:'post',
         datatype:'json',
         data:{"id":id},
         success:function(list){
         console.log(list);
    //将数据显示在页面上  
         document.getElementById("name").textContent="用户:"+list.uname;
        var str = "";            
     //遍历数据
       str +="<div class='container' data-v-062ec5dc=''>";
       str+="<div class='m-l--15 m-r--15 m-b--25'>";
       $.each(list.ucourse,function(index,element){ 
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
		}
	 })
	  })
       </script>
	<body>
		<div class="header">
			<div class="user-info">
				<div class="w1200">
					<div class="user-headface">
						<img src="images/user_face.jpg"/>
					</div>
					<div class="user-account">
						<p class="tip" id="name">下午好，Tom</p>
					</div>
					
				</div>
			</div>
		</div>
	<div class="main w1200">
			<div class="left">
				<ul>
					<li>
						<a href="" class="active">
							<i class="icon  icon-lingdang"></i>
							已选课程
						</a>
					</li>
					
				</ul>
			</div>	
			<div class="right">
				<div class="tap">
					<span>已选课程</span>
				</div>
				<div class="container"id="list">
					
			</div>
		</div>
	</body>

</html>