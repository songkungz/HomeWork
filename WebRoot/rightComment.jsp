<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta charset="UTF-8">
     <link href="css/bootstrap.min.css" rel="stylesheet">
     <link rel="stylesheet" type="text/css" href="platform/Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="platform/Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="platform/Css/style.css" />
    <script type="text/javascript" src="platform/Js/jquery.js"></script>
  
    <script type="text/javascript" src="platform/Js/bootstrap.js"></script>
    <script type="text/javascript" src="platform/Js/ckform.js"></script>
    <script type="text/javascript" src="platform/Js/common.js"></script>
    <script src="js/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/bootstrap-paginator.js" type="text/javascript"></script>

   
     <style>
        #page li{
            cursor:pointer;
        }
    </style>
 <script type="text/javascript">

$(function (){
	$.ajax({
	url:"com/comment.do",
 	type:"post",
 	data:{"pageNow":1},
 	success:function(list){	
 	
    console.log(list.list)
	 		$("#news_list").html("");	
	 			$.each(list.list,function(index,value){	
		 			$("#news_list").append("<tr>")
		 			.append("<td>"+(index+1)+"</td>")
		 			.append("<td>"+value.uname+"</td>")
		 			.append("<td>"+value.comment_content+"</td>")
		 			.append("<td>"+value.comment_time+"</td>")
		 			.append("<td><button  onclick=deleteComment("+value.commentid+","+list.pageNow+") class=''  type=button>删除</button></td>")
		 			.append("</tr>")   	
	 		})
	 	     
	 	       $("#page").bootstrapPaginator({
               bootstrapMajorVersion:3, //对应的bootstrap版本
               currentPage: list.pageNow, //当前页数
               numberOfPages: 10, //每次显示页数
               totalPages:list.totalPageCount, //总页数
               shouldShowPage:true,//是否显示该按钮
               useBootstrapTooltip:true,
               //点击事件
               onPageClicked: function (event, originalEvent, type, page) {
                   comment(page);
   
               }
           });
           },
 	error:function(){
 		alert("请求失败")
 	}
 }
 )
 })

       

  function comment(pageNow){
	$.ajax({
	url:"com/comment.do",
 	type:"post",
 	data:{"pageNow":pageNow},
 	dataType:"json",
 	success:function(list){	
	 		$("#news_list").html("");
	 			$.each(list.list,function(index,value){	
		 			$("#news_list").append("<tr>")
		 			.append("<td>"+(index+1)+"</td>")
		 			.append("<td>"+value.uname+"</td>")
		 			.append("<td>"+value.comment_content+"</td>")
		 			.append("<td>"+value.comment_time+"</td>")
		 			.append("<td><button  onclick=deleteNews("+value.commentid+","+list.pageNow+") class=''  type=button>删除</button></td>")
		 			.append("</tr>")   
	 		})
	 		
	 	},
 	error:function(){
 		alert("请求失败")
 	}
 }
 )
 }
 
 
 function deleteComment(id,pageNow){
    var msg =confirm("确定删除么？");
   
    if(msg==true)
        {
        $.ajax({
                url:"com/deleteComment.do",
                type:"post",
                data:{"msg":id},
                success:function(data){	
                		column(pageNow);
			 	},
			 	error:function(){
 						alert("请求失败")
 				}
            })  
       }
      else
           alert("你取消了本次操作")
}


   

	$(document).keyup(function(event){ 
    if(event.keyCode ==13){ 
      $("#select_list").trigger("click"); 
    } 
});
</script>
</head>
<body>
<br><br><br><a href="platformindex.jsp">首页</a>&nbsp; > &nbsp; <span>留言反馈</span>
<form class="form-inline definewidth m20" action="platformindex.jsp" >  
    留言信息：
</form>
<table class="table table-bordered table-hover definewidth m10" >
    <thead >
    <tr>
        <th>ID</th>
        <th>留言用户</th>
        <th>留言内容</th>
        <th>留言时间</th>
        <th>操作</th>
        
    </tr>
    </thead >
    <tbody id="news_list">
        </tbody></table>
     <div class="container">
        <div style="margin-top: 100px;">
            <ul id="page"></ul>
        </div>
    </div>
		  <!-- 模态框 -->
         <div class="modal-content modal" id="myModal" tabindex="-1" aria-labelledby="myModalLabel" role="dialog" aria-hidden="true" data-backdrop="true" style="height: 60%">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    编辑栏目信息
                </h4>
            </div>
            <div class="modal-body" id="loginmodal">
               <form id="loginform" name="loginform" method="post" action="resource.html">
                    <label for="">栏目名称:</label>
                    <input type="text" name="" id="title" class="txtfield" tabindex="1">  
                    <label for="">描述信息:</label>
                    <input type="text" name="" id="author" class="txtfield" tabindex="2">     
                     <label for="">图片:</label>
                    <textarea rows="" cols="" id="content" class="txtfield" tabindex="3"></textarea>                       
                    <div class="center">
                        <input type="button" name="loginbtn" id="update" class="flatbtn-blu hidemodal" value="确认编辑" tabindex="6">
                        <button type="button" class="flatbtn-blu hidemodal" data-dismiss="modal">关闭</button>
                    </div>
                </form>
            </div>
        </div>
        <!-- 模态框end -->
		</body>
		
		</html>

