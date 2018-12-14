<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!DOCTYPE html>
<html lang="en">
<head>
	<!-- Meta tags -->
	<title>教师团队</title>
	<!-- stylesheets -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/style.css">
</head>
<script src="js/jquery.min.js"></script>
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
         url:'teacher/selectacherbytype.do',
         type:'post',
         data:{"pageNow":1,
         "type":type},
         success:function(teacher){
             console.log(teacher.list);
    //将数据显示在页面上
        var str = "";
     //遍历数据
       $.each(teacher.list,function(index,element){ 
         str+=" <div class='col-md-3 col-sm-6 col-xs-6 w3l_team_grid'>"
         str +="<div class='view view-second'>";
         str +=" <a href='teacherContent.jsp?tid="+element.tid+"&type="+element.type+"' title='查看详细资料'>";
         str +="<img src="+element.image+" alt=''  class='img-responsive' /></a>";
         str +="<div class='mask'></div>";
		 str +="<div class='content'>";
		 str +=" 	<div class='w3l_social_icons w3l_social_icons1'>";
         str +=" <ul>";
         str +=" <li><a href='teacherContent.jsp?tid="+element.tid+"&type="+element.type+"' class='facebook'>"+element.information+"</a></li>";
        str +=" </ul>";
         str +="</div></div></div>";
         str+="<h4>高级讲师</h4><a href='teacherContent.jsp?tid="+element.tid+"&type="+element.type+"' class='facebook'><p>"+element.tname+"</p></a></div>"
       })
//遍历完成之后      
//将表格添加到body中
       $('#teacherinfo').append(str);
        },
        error:function(){
        alert("请求失败！");
        }
       })
        })
      </script>  
</script>
<body>
	<!-- 结构兼容性不太好，必须采用400×500像素的照片 -->
		<!-- 结构兼容性不太好，必须采用400×500像素的照片 -->
			<!-- 结构兼容性不太好，必须采用400×500像素的照片 -->

<div class="position">
<br>	
	<div class="block">您现在的位置： 
		<a href="index.jsp" name="Gallery">首页</a>
					 &gt;教师团队</div></div>
	<div class="team" id="team">
		<div class="container">
			<div class="w3l_team_grids" id="teacherinfo">
	
		</div>
	</div>
	<!-- //team-inner-page -->
</body>
<style type="text/css">
body{
	background-image:url("images/teacher.jpg") no-repeat;
}
</style>
</html>
