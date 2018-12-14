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
$(function(){
  $("#save").click(function(){
		var str ={
		    "name":document.getElementById('name').value,
		    "describe":document.getElementById('describe').value,
		    "image":filepath
		    };
		    var str_json = JSON.stringify(str); 
			  $.ajax({
			    url:"column/insertColumn.do",
			    type:"post",
			    data:str_json,
				contentType:"application/json; charset=utf-8",
				dataType:"json", 
				success:function(data){
				if(data>0)
				{
						alert("保存成功");
						window.location.href="http://localhost:8080/HomeWork/rightColumn.jsp";
				}
				else
				{
						alert("保存失败");
				}
				},
				error:function(){}
			    })
			  });
})
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
      <th class="tablestyle_title" >栏目添加页面</th>
  </tr>
  <tr>
    <td class="CPanel">
		
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
		<tr><td align="left">
		</td></tr>

		<TR>
			<TD width="100%">
				<fieldset style="height:100%;">
				<legend>添加栏目</legend>
				
					  <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
					 
					  <tr>
					    <td nowrap align="right" width="13%">栏目名称:</td>
					    <td width="41%"><input  id="name" name="cname" class="text" style="width:250px;height: 40px;" type="text" size="40" /></td></tr>
					   <tr>
		<tr>		 
       <div class="formControls col-md-10">
			 <span class="btn btn-success fileinput-button mr-5">
       			<span>栏目图片</span>
       			<input id="fileupload" type="file" name="file">
   			</span>
       		<span id="uploadResult"></span><span id="uploadError" style="color: red;"></span>
   			<div class="mt-5">
   				<span class="uploadTip">只能上传jpg,png,jpeg格式的文件</span>
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
					  <br><br><br><br><br>
					 
					    <td nowrap align="right" height="120px">栏目简介:</td>
					    <td colspan="3"><textarea  id="cdescribe" name="n_Content" rows="5" cols="80"></textarea></td>
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

