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
    <script type="text/javascript" src="platform/Js/jquery.sorted.js"></script>
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
$(function(){
newsList();
})
function newsList(){
	$.ajax({
	url:"news/newsinfo.do",
 	type:"post",
 	data:{"pageNow":1},
 	success:function(list){	
	 		$("#news_list").html("");
	 		console.log(list)
	 			$.each(list.list,function(index,value){	
		 			$("#news_list").append("<tr>")
		 			.append("<td>"+value.nid+"</td>")
		 			.append("<td><a href='#'>"+value.title+"</a></td>")
		 			.append("<td>"+value.time+"</td>")
		 			.append("<td>"+value.author+"</td>")
		 			.append("<td>"+value.n_Content+"</td>")
		 			.append("<td><button  onclick=deleteNews("+value.nid+","+list.pageNow+") class=''  type=button>删除</button></td>")
		 			.append("<td><button id='update' class='' onclick=updateNews("+value.nid+")  type=button   data-toggle='modal' data-target=#myModal>修改</button></td>")
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
                   news(page);
   
               }
           });
           },
 	error:function(){
 		alert("请求失败")
 	}
 }
 )
 }

       

  function news(pageNow){
	$.ajax({
	url:"news/newsinfo.do",
 	type:"post",
 	data:{"pageNow":pageNow},
 	dataType:"json",
 	success:function(list){	
	 		$("#news_list").html("");
	 			$.each(list.list,function(index,value){	
		 			$("#news_list").append("<tr>")
		 			.append("<td>"+value.nid+"</td>")
		 			.append("<td><a href='platfomShowNew.jsp?id="+value.nid+"'>"+value.title+"</a></td>")
		 			.append("<td>"+value.time+"</td>")
		 			.append("<td>"+value.author+"</td>")
		 			.append("<td>"+value.n_Content+"</td>")
		 			.append("<td><button  onclick=deleteNews("+value.nid+","+list.pageNow+") class=''  type=button>删除</button></td>")
		 			.append("<td><button id='update' class='' onclick=updateNews("+value.nid+")  type=button   data-toggle='modal' data-target=#myModal>修改</button></td>")
		 			.append("</tr>")
	 		})
	 		
	 	},
 	error:function(){
 		alert("请求失败")
 	}
 }
 )
 }
 
 $(function( ){              
　　// test 的点击事件
　　$("#select_list").click(function(){ 
            $.ajax({
                url:"news/selectinfo.do",
                type:"post",
                data:{"condition":document.getElementById('rolename').value,
                "pageNow":1
                },  
                dataType:"json",//返回的数据类型
                success:function(list){	   
                
                	$("#news_list").html(""); 
	 				$.each(list.list,function(index,value){
				 			$("#news_list").append("<tr>")
				 			.append("<td>"+value.nid+"</td>")
				 			.append("<td><a href='platfomShowNew.jsp?id="+value.nid+"'>"+value.title+"</a></td>")			 		
				 			.append("<td>"+value.time+"</td>")
				 			.append("<td>"+value.author+"</td>")
				 			.append("<td>"+value.n_Content+"</td>")
				 			.append("<td><button  id='delete' class='' onclick=deleteNews("+value.nid+","+list.pageNow+")  type=button >删除</button></td>")
		 					.append("<td><button id='update' class='' onclick=updateNews("+value.nid+")  type=button data-toggle='modal'  data-target=#myModal>修改</button></td>")
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
                   news(page);
   
               }
               })
	 				
			 	},
			 	error:function(){
 						alert("请求失败")
 				}
            })  
　　});
  })
 function deleteNews(id,pageNow){
    var msg =confirm("确定删除么？");
    if(msg==true)
        {
        $.ajax({
                url:"news/deleteNews.do",
                type:"post",
                data:{"id":id,
                "pageNow":pageNow},
                success:function(data){	
                if(data>0){
                        alert('删除成功！');
                		news(pageNow);
                }
                 else
                 {
                 		alert('删除失败！');
                 }
			 	},
			 	error:function(){
 						alert("请求失败")
 				}
            })  
       }
      else
           alert("你取消了本次操作")
}
function updateNews(id){
 $.ajax({
                url:"news/findnewsbyid.do",
                type:"post",
                data:{"id":id},
                dataType:"json",
                success:function(data){	
                     nid=data[0].nid;
                    console.log(data);
		                $("#title").val(data[0].title);
			            $("#content").val(data[0].n_Content);
			            $("#author").val(data[0].author);
			 	},
			 	error:function(){
 						alert("请求失败")
 				}
            })  

}

$(function () {
        
		$('#update').click(function(){
             var str ={
		    "title":document.getElementById('title').value,
		    "author":document.getElementById('author').value,
		    "n_Content":document.getElementById('content').value,
		    "nid":nid
		    };
		    var str_json = JSON.stringify(str); 
		   
			  $.ajax({
			    url:"news/updateNews.do",
			    type:"post",
			    data:str_json,
				contentType:"application/json; charset=utf-8",
				dataType:"json", 
				success:function(data){
				if(data>0)
				{
						alert("修改成功");
						location.href="http://localhost:8080/HomeWork/rightNews.jsp";						
				}
				else
				{
						alert("修改失败");
				}
				},
				error:function(){}
			    })
			  });
    });
    $(function () {
        
		$('#addnew').click(function(){

				window.location.href="addnews.jsp";
		 });


    });

	$(document).keyup(function(event){ 
    if(event.keyCode ==13){ 
      $("#select_list").trigger("click"); 
    } 
});
</script>
</head>
<body>
<br><br><br><a href="platformindex.jsp">首页</a>&nbsp; > &nbsp; <span>新闻信息</span>
<form class="form-inline definewidth m20" action="index.html" method="get">  
    作者：
    <input type="text" name="rolename" id="rolename"class="abc input-default" placeholder="" value="">&nbsp;&nbsp;  
    <button type="button" id="select_list" class="btn btn-primary">查询</button>&nbsp;&nbsp; <button type="button" class="btn btn-success" id="addnew">新增新闻</button>
</form>
<table class="table table-bordered table-hover definewidth m10" >
    <thead >
    <tr>
        <th>新闻ID</th>
        <th>新闻标题</th>
        <th>创建时间</th>
        <th>作者</th>
        <th>正文</th>
        <th>操作</th>
        <th></th>
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
                    编辑资源信息
                </h4>
            </div>
            <div class="modal-body" id="loginmodal">
               <form id="loginform" name="loginform" method="post" action="resource.html">
                    <label for="">标题:</label>
                    <input type="text" name="" id="title" class="txtfield" tabindex="1">  
                    <label for="">作者:</label>
                    <input type="text" name="" id="author" class="txtfield" tabindex="2">     
                     <label for="">内容:</label>
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

