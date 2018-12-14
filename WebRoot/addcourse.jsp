<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>新闻发布系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="jquery.fileupload/css/jquery.fileupload.css">
<link rel="stylesheet" type="text/css" href="jquery.fileupload/css/H-ui.css">
<link rel="stylesheet" rev="stylesheet" href="platform/css/style.css" type="text/css" media="all" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="jquery.fileupload/js/jquery.ui.widget.js"></script>
<script type="text/javascript" src="jquery.fileupload/js/jquery.iframe-transport.js"></script>
<script type="text/javascript" src="jquery.fileupload/js/jquery.fileupload.js"></script>
<style type="text/css">
.imgSize{
width:190px;
height:266px;
}
.formControls{
	position: absolute;
	padding-top: 3%;
	padding-left: 17%;
}
</style>
<script type="text/javascript">
 <!--添加操作-->
    $(function(){
  $("#save").click(function(){
		var str ={
		    "ctype":document.getElementById('type').value,
		    "cname":document.getElementById('name').value,
		    "cimage":filepath,
		    "cnum":document.getElementById('number').value,
		    "csynopsis":document.getElementById('describe').value,
		    "cprice":document.getElementById('price').value,
		    "cteacher":document.getElementById('teacher').value
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
			window.location.href="http://localhost:8080/HomeWork/rightCourse.jsp";
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
   
</script>
<title>ajax文件上传进度条</title>
<script type="text/javascript">
$(function(){
	//支持的文件类型正则表达式
	var fileType = /\.(jpg|png|jpeg)$/i;
	$("#fileupload").fileupload({
		url: 'file/upload.do',
		dataType: 'json',
		add: function(e, data) { //add表示在选择文件时判断格式是否正确
            var goUpload = true;
            var uploadFile = data.files[0];
            if (!fileType.test(uploadFile.name)) {
            	$('#uploadResult').html('');
            	$('#uploadError').html('文件格式不正确');
            	$('#fileName').val('');
                goUpload = false;
            }
            if (goUpload == true) {
                data.submit();
            }
		},
		done: function(e, data) {   //done为文件上传成功需要做的事情
			$('#progress').hide();
			$('#uploadError').html('');
			$('#uploadResult').html(data.result.fileName+' 上传成功');
			//上传成功将文件名赋值给fileName属性,以便将文件名提交到数据库存储
		    filepath=data.result.filePath+"\\"+data.result.fileName
			
		},
		progressall: function(e, data) {  //进度条显示
			$('#progress').show();
			$('#uploadError').html('');
			$('#uploadResult').html('');
			var progress = parseInt(data.loaded / data.total * 100, 10); 
			$('#progress .progress-bar span').css('width', progress + '%');
		}
	});
});

$(function (){
	$.ajax({
	url:"column/allcolumn.do",
 	type:"post",
 	success:function(list){	
                 console.log(list);
	 			$.each(list,function(index,value){	
		 		$("#majorlist").append("<option>"+value.name+"</option>");
	 		})  
           },
 	error:function(){
 		alert("请求失败")
 	}
 }
 )
 })
 $(function(){
 $("#type").change(function(){
$.ajax({
	url:"teacher/selectbytype.do",
 	type:"post",
 	data:{"type":document.getElementById("type").value},
 	success:function(list){	
                 console.log(list);
	 			$.each(list,function(index,value){	
		 		$("#tlist").append("<option>"+value.tname+"</option>");
	 		})  
           },
 	error:function(){
 		alert("请求失败")
 	}
 }
 )
});
 })
 

</script>

<style type="text/css">
<!--
.atten {font-size:12px;font-weight:normal;color:#F00;}
-->
.imgSize{
width:190px;
height:266px;
}
</style>
</head>

<body class="ContentBody">
  <form action="" method="post" enctype="multipart/form-data" name="fom" id="fom" target="sypost" >
<div class="MainDiv">

<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >课程添加页面</th>
  </tr>
  <tr>
    <td class="CPanel">
		
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
		<tr><td align="left">
		</td></tr>
		<TR>
			<TD width="100%">
				<fieldset style="height:100%;">
				<legend>添加课程</legend>
				
					  <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
					 
					 

					   <tr>
		<tr>		 
       <div class="formControls col-md-10">
			 <span class="btn btn-success fileinput-button mr-5">
       			<span>课程图片</span>
       			<input id="fileupload" type="file" name="file">
   			</span>
       		<span id="uploadResult"></span><span id="uploadError" style="color: red;"></span>
   			<div class="mt-5">
   				<span class="uploadTip" float=right>只能上传jpg,png,jpeg格式的文件</span>
   			</div>
			<div id="progress" class="progress mt-10" style="display: none;">
				<div class="progress-bar"><span class="sr-only"></span></div>
			</div>
			<!-- ajax上传成功后返回文件名，如value='xxx.txt' -->
			<input type="hidden" id="fileName" name="fileName" >
			<div id="fileinfo"></div> 		
       	</div>
     </tr>	
					  </tr>
					  <br><br><br><br>
					     <tr>

					    <td nowrap align="right" width="13%">课程名:</td>

					    <td with="41%"><input id="name" name="sex" class="text" style="width:250px;height: 40px;" type="text" size="50" /></td>

					</tr>
					<br>
					  <tr>

					    <td nowrap align="right" width="13%">课程类型:</td>
					    <td with="41%">
					    <input  id="type" list="majorlist" name="major" class="text" style="width:250px;height: 40px;" type="text" size="50" />
					   <datalist id="majorlist">
					   </datalist></td>

					</tr><br>
					  <tr>

					    <td nowrap align="right" width="13%">授课老师:</td>

					    <td with="41%">   <input  id="teacher" list="tlist" name="major" class="text" style="width:250px;height: 40px;" type="text" size="50" />
					   <datalist id="tlist">
					   </datalist></td>
					</tr>
					  <tr>

					    <td nowrap align="right" width="13%">价格：</td>

					    <td with="41%">   <input  id="price"  name="major" class="text" style="width:250px;height: 40px;" type="text" size="50" />
					   </td>
					</tr>
					
					 <tr>

					    <td nowrap align="right" width="13%">学时数：</td>

					    <td with="41%">   <input  id="number"  name="major" class="text" style="width:250px;height: 40px;" type="text" size="50" />
					   </td>
					</tr>
					  <tr>

					    <td nowrap align="right" width="13%">课程简介:</td>

					    <td with="41%"><textarea rows="" cols="" id = "describe" style="width:250px;height: 88px;"></textarea></td>

					</tr>
					
					 
					    </tr>
					  </table>
			 <br />
				</fieldset>			</TD>
		</TR>
		
		</TABLE>
	
	
	 </td>
  </tr>
  

		
		
		
		
		<TR>
			<TD colspan="2" align="center" height="50px">
			<input type="button" name="Submit" value="保存" class="button"  id="save" "/>　
			
			<input type="button" name="Submit2" value="返回" class="button" onclick="window.history.go(-1);"/></TD>
		</TR>
		</TABLE>
	
	
	 </td>
  </tr>
  
  
  
  
  </table>
  
</div>
</form>
</body>
</html>

