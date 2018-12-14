<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>课程展示</title>
  <link rel="stylesheet" type="text/css" href="css/classshow.css">
  <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<style type="text/css">
.fl{
padding-left:55px;
}
</style>
<script type="text/javascript">
function  buy(){
alert("功能尚未完善！你仍可以继续免费观看")
}
uid = "${user.uid}";
function select(){
if(uid.length!=0 && id.length!=0)
{$(function(){
$.ajax({
         url:'user/selectCourse.do',
         type:'post',
         datatype:'json',
         data:{"cid":id,"uid":uid},
         success:function(data){
         if(data>0)
         {
         alert("课程已成功添加到你的列表！");
         }
         else
         {
              alert("操作失败");
         }
         },
         error:function(){ 
         alert("该课程你已选取");}
         })

})
  
}
else
{
  window.location.href="login.jsp"
}
}
Request = {  
        QueryString : function(item){  
        var svalue = location.search.match(new RegExp("[\?\&]" + item + "=([^\&]*)(\&?)","i"));  
        return svalue ? svalue[1] : svalue;  
        }  
        }            
id = decodeURI(Request.QueryString("id"));
$(function(){
        $.ajax({
         url:'cou/findVideo.do',
         type:'post',
         datatype:'json',
         data:{"id":id},
         success:function(list){
    //将数据显示在页面上  
         document.getElementById("image").style.backgroundImage="url("+list.cimage+")";
         document.getElementById("title").textContent=list.ctitle;
         document.getElementById("synopsis").textContent=list.csynopsis;
         document.getElementById("teacher").textContent="主讲老师:"+list.cteacher+"";    
         document.getElementById("type").textContent=list.ctype; 
          document.getElementById("price").textContent="原价 ￥"+list.cprice+".00";    
          
        var str = "";            
     //遍历数据
        console.log(list);
       $.each(list.video,function(index,element){ 
       str+="<li width='50%' class='list-group-item'><h4>"+element.title+"</h4>　　　<h4><a href='"+element['path']+"'>"+element['vname']+"</a><h4></li>";
       })
        $('#belongtocourse').append(str);
		}
	 })
	  })
       

</script>
</head>
<body>
<div class="container"> 
  <div class="CourseCommonDetail_top">
    <div class="CourseCommonDetail_cover" style="background-image:url()" id = "image">
    </div>
     <div class="CourseCommonDetail_topContent">
      <div class="CourseCommonDetail_info">
        <div class="CourseCommonDetail_infoTitle" id="title"></div> 
        <div class="CourseCommonDetail_infoSubtitle"id="synopsis"></div> 
          <span class="CourseCommonDetail_courseTypeText" id="type"></span> </br>
          <div id="teacher"></div>
        </div> 
        <div class="CourseCommonDetail_priceBar"> 
        <div class="CourseCommonDetail_couponPrice">
            活动价 <span class="CourseCommonDetail_finalPrice">￥0.00</span> 
            <del class="CourseCommonDetail_originPrice" id="price">
              
            </del>
        </div>
        </div> 
        <div class="CourseCommonDetail_infoOperation">
        <div class="CourseCommonDetail_infoBtn primary" onclick="alert('功能尚未完善！你仍可以继续免费观看')">立即购买</div> 
        <div class="CourseCommonDetail_infoBtn try video" onclick="select()">免费试看</div> 
      </div>
    </div>
  </div>
</div>
<div width=80% background-color:lightgrey id="belongtocourse">
 <ul class='list-group '>
         <li class='list-group-item '><h2>课程目录</h2></li>

<!-- 输出课程列表 -->

<script type="text/javascript">
          
       
	 
        
     
      </script>  

<!-- 输出课程列表结束 -->
</ul>
</div>
</body>
</html>