<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
    <title>教师管理</title>
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
teacherList();
})
function teacherList(pageNow){
	$.ajax({
	url:"teacher/teacherinfo.do",
 	type:"post",
 	data:{"pageNow":1},
 	success:function(list){	
			$("#teacher_list").html("");
	 			$.each(list.list,function(index,value){	
		 			$("#teacher_list").append("<tr>")
		 			.append("<td>"+value.tid+"</td>")
		 			.append("<td><a href='platfomShowNew.jsp?id="+value.tid+"'>"+value.tname+"</a></td>")
		 			.append("<td>"+value.age+"</td>")
		 			.append("<td>"+value.sex+"</td>")
		 			.append("<td >"+value.information+"</td>")
		 			.append("<td><button  onclick=deleteTeacher("+value.tid+","+list.pageNow+") class=''  type=button>删除</button></td>")
		 			.append("<td><button id='update' class='' onclick=updateTeacher("+value.tid+")  type=button   data-toggle='modal' data-target=#myModal>修改</button></td>")
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
                   teacher(page);
               }
           });
           },
 	error:function(){
 		alert("请求失败")
 	}
 }
 )
 }

       
<!--根据页码显示数据-->
  function teacher(pageNow){
	$.ajax({
	url:"teacher/teacherinfo.do",
 	type:"post",
 	data:{"pageNow":pageNow},
 	dataType:"json",
 	success:function(list){	
	 		$("#teacher_list").html("");
	 			$.each(list.list,function(index,value){	
		 			$("#teacher_list").append("<tr>")
		 			.append("<td>"+value.tid+"</td>")
		 			.append("<td><a href='platfomShowNew.jsp?id="+value.tid+"'>"+value.tname+"</a></td>")
		 			.append("<td>"+value.age+"</td>")
		 			.append("<td>"+value.sex+"</td>")
		 			.append("<td>"+value.information+"</td>")
		 			.append("<td><button  onclick=deleteTeacher("+value.tid+","+list.pageNow+") class=''  type=button>删除</button></td>")
		 			.append("<td><button id='update' class='' onclick=updateTeacher("+value.tid+")  type=button   data-toggle='modal' data-target=#myModal>修改</button></td>")
		 			.append("</tr>")
	 		})
	 		
	 	},
 	error:function(){
 		alert("请求失败")
 	}
 }
 )
 }
 <!-- 查询并分页-->
 $(function( ){              
　　// test 的点击事件
　　$("#select_list").click(function(){ 
            $.ajax({
                url:"teacher/selectacher.do",
                type:"post",
                data:{"condition":document.getElementById('rolename').value,
                "pageNow":1
                },  
                dataType:"json",//返回的数据类型
                success:function(list){	   
                
                	$("#teacher_list").html("");
			 			$.each(list.list,function(index,value){	
				 			$("#teacher_list").append("<tr class='oh'>")
				 			.append("<td>"+value.tid+"</td>")
				 			.append("<td><a href='platfomShowNew.jsp?id="+value.tid+"'>"+value.tname+"</a></td>")
				 			.append("<td>"+value.age+"</td>")
				 			.append("<td>"+value.sex+"</td>")
				 			.append("<td>"+value.information+"</td>")
				 			.append("<td><button  onclick=deleteTeacher("+value.tid+","+list.pageNow+") class=''  type=button>删除</button></td>")
				 			.append("<td><button id='update' class='' onclick=updateTeacher("+value.tid+")  type=button   data-toggle='modal' data-target=#myModal>修改</button></td>")
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
  <!-- 删除-->
 function deleteTeacher(id,pageNow){
    var msg =confirm("确定删除么？");
    if(msg==true)
        {
        $.ajax({
                url:"teacher/deleteTeacher.do",
                type:"post",
                data:{"id":id,
                "pageNow":pageNow},
                success:function(data){	
                if(data>0){
                        alert('删除成功！');
                		teacher(pageNow);
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
<!--查询并显示内容在模态框-->
function updateTeacher(id){
 $.ajax({
                url:"teacher/findteacherbyid.do",
                type:"post",
                data:{"id":id},
                dataType:"json",
                success:function(data){	
                console.log(data);
                     tid=data.tid;
		                $("#tid").val(data.tid);
			            $("#tname").val(data.tname);
			            $("#tage").val(data.age);
			            $("#tsex").val(data.sex);
			            $("#tinfo").val(data.information);
			 	},
			 	error:function(){
 						alert("请求失败")
 				}
            })  

}
<!--修改-->
$(function () {
        
		$('#update').click(function(){
             var str ={
		    "tname":document.getElementById('tname').value,
		    "age":document.getElementById('tage').value,
		    "sex":document.getElementById('tsex').value,
		    "information":document.getElementById('tinfo').value,
		    "tid":tid
		    };
		    var str_json = JSON.stringify(str); 
			  $.ajax({
			    url:"teacher/updateTeacher.do",
			    type:"post",
			    data:str_json,
				contentType:"application/json; charset=utf-8",
				dataType:"json", 
				success:function(data){
				if(data>0)
				{
						alert("修改成功");
						location.href="http://localhost:8080/HomeWork/teacher.jsp";						
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
        
		$('#addteacher').click(function(){

				window.location.href="addteacher.jsp";
		 });


    });
    $(document).keyup(function(event){ 
    if(event.keyCode ==13){ 
      $("#select_list").trigger("click"); 
    } 
});
</script>
    <style type="text/css">
        body {
            padding-bottom: 40px;
        }
        .sidebar-nav {
            padding: 9px 0;
        }

        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }
.oh{
 overflow:hidden;
}

    </style>
    
</head>
<body>
<br><br><br><a href="platformindex.jsp">首页</a>&nbsp; > &nbsp; <span>教师信息</span>
<form class="form-inline definewidth m20" >  
    教师名称：
    <input type="text" name="rolename" id="rolename"class="abc input-default" placeholder="" value="">&nbsp;&nbsp;  
    <button type="button" class="btn btn-primary" id="select_list">查询</button>&nbsp;&nbsp; <button type="button" class="btn btn-success" id="addteacher">新增老师</button>

</form>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr align="center" >
        <th>教师ID</th>
        <th>姓名</th>
        <th>性别</th>
        <th>年龄</th>
        <th>简介</th>
         <th>操作</th>
         <th></th>
    </tr>
    </thead>
    <tbody id="teacher_list" ></tbody>
	</table>
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
                    <label for="">教师ID:</label>
                    <input type="text" name="" id="tid" class="txtfield" tabindex="1">
      
                    <label for="">姓名:</label>
                    <input type="text" name="" id="tname" class="txtfield" tabindex="2">

                    <label for="">性别:</label>
                    <input type="text" name="" id="tsex" class="txtfield" tabindex="3">

                    <label for="">年龄:</label>
                    <input type="text" name="" id="tage" class="txtfield" tabindex="4">

                    <label for="">简介:</label>
                    <textarea type="" name="" id="tinfo" class="txtfield" tabindex="5"></textarea>

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
