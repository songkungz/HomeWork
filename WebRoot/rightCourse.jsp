<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'TrainCourse.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
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

body a{
    padding-left: 20px;
    font-size: 20px;
}
span {
    font-size: 16px;
}
    </style>
    


<!-- 对课程列表的操作 -->


    <script type="text/javascript">
    <!--添加操作-->
    $(function(){
  $("#save").click(function(){
		var str ={
		    "ctype":document.getElementById('Ctype').value,
		    "cname":document.getElementById('Cname').value,
		    "cimage":document.getElementById('Cimage').value,
		    "cnum":document.getElementById('Cnum').value,
		    "ctitle":document.getElementById('Ctitle').value,
		    "csynopsis":document.getElementById('Csynopsis').value,
		    "cprice":document.getElementById('Cprice').value,
		    "cteacher":document.getElementById('Cteacher').value
		    };
		    var str_json = JSON.stringify(str); 
		    alert(str_json)
		     if(confirm("确认添加？")){
			  $.ajax({
			    url:'cou/insertCourses.do',
			    type:"post",
			    data:str_json,
				contentType:"application/json; charset=utf-8",
				dataType:"json", 
				success:function(data){
				if(data>0)
				{
				alert("保存成功");
				}
				else
				{
				alert("保存失败");
				}
				},
				error:function(){}
			    })
			    }
			  });
})
    <!--添加操作结束-->
   
    
    
    <!--修改操作-->
    
    $(function(){
  $("#update").click(function(){
		var str ={
		    "cid":cid,
		
		    "cname":document.getElementById('Cname').value,
		    "cimage":document.getElementById('Cimage').value,
		    "cnum":document.getElementById('Cnum').value,
		    "csynopsis":document.getElementById('Csynopsis').value,
		    "cprice":document.getElementById('Cprice').value,
		    "cteacher":document.getElementById('Cteacher').value
		    };
		    var str_json = JSON.stringify(str); 
		    alert(str_json)
		    if(confirm("确认编辑？")){
			  $.ajax({
			    url:'cou/updateCourses.do',
			    type:"post",
			    data:str_json,
				contentType:"application/json; charset=utf-8",
				dataType:"json", 
				success:function(data){
				if(data>0)
				{
				alert("修改成功");
				window.location.reload();
				}
				else
				{
				alert("修改失败，你可能没有输入内容哦！");
				window.location.reload();
				}
				},
				error:function(){}
			    })
			    }
			  });
})
    
    <!--拼接typeid-->
     
    
    
    <!--修改操作结束-->
    
    
    
    <!--删除操作 -->
    
    
     <!--删除操作-->
    function del(id,pageNow){
        if(confirm("确认删除？")){
        $.ajax({
        url:'cou/deleteCourses.do',
        type:'get',
        datatype:'json',
        data:{"msg":id},
        success:function(){
        alert('删除成功');
       train_course(pageNow);
        },
        error:function(){
        alert("请求失败")}
        })
        }
        else
        alert("你取消了本次操作")
        }
    <!--删除操作结束-->
    
    
    
    
    
    <!--删除操作 结束-->
    
    
    
    </script>






<!-- 对课程列表的操作结束 -->


<!-- 根据课程类型查询的课程列表 -->

 <script type="text/javascript">
              
	    $(function(){
	     list(); })
	    function list(){
        $.ajax({
         url:'cou/findAllCourse.do',
         type:'get',
         data:{"pageNow":1},
         success:function(list){
         
             $("#course_list").html("");
             console.log(list);
    //将数据显示在页面上
        
     //遍历数据
       $.each(list.list,function(index,element){
       index=index+1;
       $("#course_list").append("<tr style='overflow:hidden'>")
		 			.append("<td>"+index+"</td>")
		 			.append("<td>"+element['ctype']+"</td>")
		 			.append("<td>"+element['cname']+"</td>")
		 			.append("<td>"+element['cimage']+"</td>")
		 			.append("<td>"+element['cnum']+"</td>")
		 			.append("<td>"+element['csynopsis']+"</td>")
		 			.append("<td>"+element['cprice']+"</td>")
		 			.append("<td>"+element['cteacher']+"</td>")
		 			.append("<td width='3%'><button onclick='del("+element['cid']+","+list.pageNow+");' class='btn btn-primary btn-lg'>删除</BUTTON></td>")
		 			.append("<td width='3%'><button class='btn btn-primary btn-lg' data-toggle='modal' data-target='#myModal' onclick='update("+element['cid']+")'>编辑</button></td>")
		 			.append(" <td width='3%'><button  class='btn btn-primary btn-lg'data-toggle='modal' data-target='#myModal1' onclick='show("+element['cid']+")'>查看</button>")   	
                    .append("</td></tr>")      
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
                   train_course(page);
   
               }
           });
           },
 	error:function(){
 		alert("请求失败")
 	}
 })
 
     }  
     
      function train_course(pageNow){
     
	$.ajax({
	url:'cou/findAllCourse.do',
 	type:"get",
 	data:{"pageNow":pageNow},
 	dataType:"json",
 	success:function(list){	
	 		 $("#course_list").html("");
         
       $.each(list.list,function(index,element){
               	index=index+1;
       $("#course_list").append("<tr>")
		 			.append("<td>"+index+"</td>")
		 			.append("<td>"+element['ctype']+"</td>")
		 			.append("<td>"+element['cname']+"</td>")
		 			.append("<td>"+element['cimage']+"</td>")
		 			.append("<td>"+element['cnum']+"</td>")
		 			.append("<td >"+element['csynopsis']+"</td>")
		 			.append("<td>"+element['cprice']+"</td>")
		 			.append("<td>"+element['cteacher']+"</td>")
		 			.append("<td width='3%'><button onclick='del("+element['cid']+");' class='btn btn-primary btn-lg'>删除</BUTTON></td>")
		 			.append("<td width='3%'><button class='btn btn-primary btn-lg' data-toggle='modal' data-target='#myModal' onclick='update("+element['cid']+")'>编辑</button></td>")
		 			.append(" <td width='3%'><button  class='btn btn-primary btn-lg' data-toggle='modal' data-target='#myModal1' onclick='show("+element['cid']+")'>查看</button>")   	
                    .append("</td></tr>")      
     		})
	 		
	 	},
 	error:function(){
 		alert("请求失败")
 	}
 }
 )
 }
     
     
     
      <!--条件查询-->
   $(function( ){              
　　// test 的点击事件
　　$("#select_list").click(function(){ 
            $.ajax({
                url:"cou/findCourseByName.do",
                type:"post",
                data:{"cname":document.getElementById('CName').value,
                "pageNow":1
                },  
                dataType:"json",//返回的数据类型
                success:function(list){	   
                       
                	 $("#course_list").html(""); 
	 				$.each(list.list,function(index,element){
				 			index=index+1;
                $("#course_list").append("<tr>")
		 			.append("<td>"+index+"</td>")
		 			.append("<td>"+element['ctype']+"</td>")
		 			.append("<td>"+element['cname']+"</td>")
		 			.append("<td>"+element['cimage']+"</td>")
		 			.append("<td>"+element['cnum']+"</td>")
		 			.append("<td>"+element['csynopsis']+"</td>")
		 			.append("<td>"+element['cprice']+"</td>")
		 			.append("<td>"+element['cteacher']+"</td>")
		 			.append("<td width='3%'><button onclick='del("+element['cid']+");' class='btn btn-primary btn-lg'>删除</BUTTON></td>")
		 			.append("<td width='3%'><button class='btn btn-primary btn-lg' data-toggle='modal' data-target='#myModal' onclick='update("+element['cid']+")'>编辑</button></td>")
		 			.append(" <td width='3%'><button class='btn btn-primary btn-lg' data-toggle='modal' data-target='#myModal1' onclick='show("+element['cid']+")'>查看</button>")   	
                    .append("</td></tr>")     
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
                   train_course(page);
   
               }
               })
	 				
			 	},
			 	error:function(){
 						alert("请求失败")
 				}
            })  
　});
  })     
    <!--条件查询结束-->   

    <!--查询并显示内容在模态框-->
function update(id){
 $.ajax({
                url:"cou/findCourseById.do",
                type:"post",
                data:{"id":id},
                dataType:"json",
                success:function(data){	
                console.log(data);
               	cid=data.cid;
			            $("#Ctype").val(data.ctype);
			            $("#Cname").val(data.cname);
			            $("#Cimage").val(data.cimage);
			            $("#Cnum").val(data.cnum);
		                $("#Csynopsis").val(data.csynopsis);
		                $("#Cprice").val(data.cprice); 
		                 $("#Cteacher").val(data.cteacher);         
			 	},
			 	error:function(){
 						alert("请求失败")
 				}
            })  
					
}
function show(id){
 $.ajax({
                url:"cou/findCourseById.do",
                type:"post",
                data:{"id":id},
                dataType:"json",
                success:function(data){	
             document.getElementById('name').textContent=data.cname;
			 document.getElementById('picuture').src=data.cimage;
			  document.getElementById('teacher').textContent=data.cteacher;
			  document.getElementById('info').textContent=data.csynopsis;
			  document.getElementById('type').textContent=data.ctype;
			 	},
			 	error:function(){
 						alert("请求失败")
 				}
            })  
					
}

$(function () {
        
		$('#addcourse').click(function(){

				window.location.href="addcourse.jsp";
		 });


    });
       </script>  
</head>
<body>

              
   
       
   

<!-- 根据课程类型查询的课程列表结束 -->

<br><br><br><a href="platformindex.jsp">首页</a>&nbsp; > &nbsp; <span>培训课程</span>
<form class="form-inline definewidth m20" action="index.html" method="get">  
   课程名称：
    <input type="text" name="CName" id="CName"class="abc input-default" placeholder="" value="">&nbsp;&nbsp;  
    <button type="button" id="select_list" class="btn btn-primary">查询</button>
    <button   type="button" id="addcourse" class="btn btn-primary btn-lg" >添加</button>
</form>

         <table class='table table-bordered table-hover definewidth m10'>
    <thead>
    <tr align='center'>
       <th>课程ID</th>
        <th>课程类型</th>
        <th>课程名称</th>
        <th>图片</th>
        <th>课时</th>
        <th>简介</th>
           <th>价格</th>
            <th>老师</th>
            <th>操作</th>
    </tr>
    </thead>
    <tbody id="course_list">
        </tbody></table>
     <div class="">
        <div style="margin-top: 100px;">
            <ul id="page"></ul>
        </div>
    </div>


           
         <!-- 模态框 -->
         <div class="modal-content modal" id="myModal" tabindex="-1" aria-labelledby="myModalLabel" role="dialog" aria-hidden="true" data-backdrop="true" >
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    编辑资源信息
                </h4>
            </div>
            <div class="modal-body" id="loginmodal">
               <form id="loginform" name="loginform" align=center >
                     
                     <label for="">课程名:</label>
                    <input type="text" name="Cname" id="Cname" class="txtfield" tabindex="2">
                    
                    <label for="">图片路径:</label>
                    <input type="text" name="Cimage" id="Cimage" class="txtfield" tabindex="3">
                    
                    <label for="">课时:</label>
                    <input type="text" name="Cnum" id="Cnum" class="txtfield" tabindex="4">
                    
                    <label for="">简介:</label>
                    <textarea type="" name="Csynopsis" id="Csynopsis" class="txtfield" tabindex="6"></textarea>

                    <label for="">价格:</label>
                    <input type="text" name="Cprice" id="Cprice" class="txtfield" tabindex="7">
                    
                    <label for="">任课老师:</label>
                    <input type="text" name="Cteacher" id="Cteacher" class="txtfield" tabindex="8">

                    <div class="center">
                        <button type="button" name="save" id="update" class="flatbtn-blu hidemodal" value="确认添加" tabindex="5">确认添加</button>
                        <button type="button" class="flatbtn-blu hidemodal" data-dismiss="modal">关闭</button>
                    </div>
                </form>
            </div>
        </div>
        <!-- 模态框end -->
      
        <!-- 模态框 -->
         <div class="modal-content modal" id="myModal1" tabindex="-1" aria-labelledby="myModalLabel" role="dialog" aria-hidden="true" data-backdrop="true" >
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    课程信息
                </h4>
            </div>
            <div class="modal-body" id="loginmodal">
               <form id="loginform" name="loginform"  >
                     <img alt="" src="" id="picuture">
                     <label for="">课程名:</label>
                    <p  id="name"></p>
                      <label for="">课程类型:</label>
                    <p  id="type"></p>
                      <label for="">授课老师:</label>
                    <p id="teacher"></p>
                    <label for="">课程简介:</label>
                    <p  id="info"></p>
                    
                </form>
            </div>
        </div>
        <!-- 模态框end -->
            

</body>

</html>

