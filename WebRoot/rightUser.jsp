<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
    <title>用户管理</title>
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
userList();
})
<!--分页显示全部数据 -->
function userList(pageNow){
	$.ajax({
	url:"user/userinfo.do",
 	type:"post",
 	data:{"pageNow":1},
 	success:function(list){	
 	console.log(list)
			$("#user_list").html("");
	 			$.each(list.list,function(index,value){	
		 			$("#user_list").append("<tr>")
		 			.append("<td>"+value.uid+"</td>")
		 			.append("<td><a href='platfomShowNew.jsp?id="+value.uid+"'>"+value.uname+"</a></td>")
		 			.append("<td>"+value.sex+"</td>")
		 			.append("<td>"+value.age+"</td>")
		 			.append("<td>"+value.phone+"</td>")
		 			.append("<td>"+value.e_mail+"</td>")
		 			.append("<td><button  onclick=deleteUser("+value.uid+") class=''  type=button>删除</button></td>")
		 			.append("<td><button id='update' class='' onclick=updateUser("+value.uid+")  type=button   data-toggle='modal' data-target=#myModal>修改</button></td>")
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
                   User(page);
   
               }
           });
           },
 	error:function(){
 		alert("请求失败")
 	}
 }
 )
 }

       

  function User(pageNow){
	$.ajax({
	url:"user/userinfo.do",
 	type:"post",
 	data:{"pageNow":pageNow},
 	dataType:"json",
 	success:function(list){	
	 		$("#user_list").html("");
	 			$.each(list.list,function(index,value){	
		 			$("#user_list").append("<tr>")
		 			.append("<td>"+value.uid+"</td>")
		 			.append("<td><a href='platfomShowNew.jsp?id="+value.uid+"'>"+value.uname+"</a></td>")
		 			.append("<td>"+value.sex+"</td>")
		 			.append("<td>"+value.age+"</td>")
		 			.append("<td>"+value.phone+"</td>")
		 			.append("<td>"+value.e_mail+"</td>")
		 			.append("<td><button  onclick=deleteUser("+value.uid+") class=''  type=button>删除</button></td>")
		 			.append("<td><button id='update' class='' onclick=updateUser("+value.uid+")  type=button   data-toggle='modal' data-target=#myModal>修改</button></td>")
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
                url:"user/selectuser.do",
                type:"post",
                data:{"condition":document.getElementById('rolename').value,
                "pageNow":1
                },  
                dataType:"json",//返回的数据类型
                success:function(list){	        
                $("#user_list").html("");
	 			$.each(list.list,function(index,value){	
		 			$("#user_list").append("<tr>")
		 			.append("<td>"+value.uid+"</td>")
		 			.append("<td><a href='platfomShowNew.jsp?id="+value.uid+"'>"+value.uname+"</a></td>")
		 			.append("<td>"+value.sex+"</td>")
		 			.append("<td>"+value.age+"</td>")
		 			.append("<td>"+value.phone+"</td>")
		 			.append("<td>"+value.e_mail+"</td>")
		 			.append("<td><button  onclick=deleteUser("+value.uid+") class=''  type=button>删除</button></td>")
		 			.append("<td><button id='update' class='' onclick=updateUser("+value.uid+")  type=button   data-toggle='modal' data-target=#myModal>修改</button></td>")
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
 function deleteUser(id){
    var msg =confirm("确定删除么？");
    if(msg==true)
        {
        $.ajax({
                url:"user/deleteUser.do",
                type:"post",
                data:{"id":id},
                success:function(data){	
                if(data>0){
                        alert('删除成功！');
                		location.href = "http://localhost:8080/HomeWork/rightUser.jsp";
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
function updateUser(id){
 $.ajax({
                url:"user/finduserbyid.do",
                type:"post",
                data:{"id":id},
                dataType:"json",
                success:function(data){	
                console.log(data);
                    uid=data.uid;		      
			            $("#uage").val(data.age);
			            $("#uemail").val(data.e_mail);
			            $("#uphone").val(data.phone);
			 	},
			 	error:function(){
 						alert("请求失败")
 				}
            })  

}

$(function () {
        
		$('#update').click(function(){
             var str ={
		    "age":document.getElementById('uage').value,
		    "phone":document.getElementById('uphone').value,
		    "e_mail":document.getElementById('uemail').value, 
		    "uid":uid
		    };
		    var str_json = JSON.stringify(str); 
			  $.ajax({
			    url:"user/updateUser.do",
			    type:"post",
			    data:str_json,
				contentType:"application/json; charset=utf-8",
				dataType:"json", 
				success:function(data){
				if(data>0)
				{
						alert("修改成功");
						location.href="http://localhost:8080/HomeWork/rightUser.jsp";						
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
    $(document).keyup(function(event){ 
    if(event.keyCode ==13){ 
      $("#select_list").trigger("click"); 
    } 
});
</script>
</head>
<body>
<br><br><br><a href="platformindex.jsp">首页</a>&nbsp; > &nbsp; <span>用户管理</span>
<form class="form-inline definewidth m20"  >  
    用户名:
    <input type="text" name="rolename" id="rolename"class="abc input-default" placeholder="" value="">&nbsp;&nbsp;  
    <button type="button" class="btn btn-primary" id="select_list">查询</button>&nbsp;&nbsp;
</form>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr >
        <th>ID</th>
        <th>用户名</th>
        <th>性别</th>
        <th>年龄</th>
        <th>电话</th>
        <th>邮箱</th>
         <th>操作</th>
         <th></th>
    </tr>
    </thead>
    <tbody id="user_list"></tbody>
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
                    <label for="">年龄:</label>
                    <input type="text" name="" id="uage" class="txtfield" tabindex="1">  
                    <label for="">邮箱:</label>
                    <input type="text" name="" id="uemail" class="txtfield" tabindex="2">     
                     <label for="">电话:</label>
                    <input type="text" name="" id="uphone" class="txtfield" tabindex="3">                          
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
