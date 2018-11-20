<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="jquery.fileupload/css/jquery.fileupload.css">
<link rel="stylesheet" type="text/css" href="jquery.fileupload/css/H-ui.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="jquery.fileupload/js/jquery.ui.widget.js"></script>
<script type="text/javascript" src="jquery.fileupload/js/jquery.iframe-transport.js"></script>
<script type="text/javascript" src="jquery.fileupload/js/jquery.fileupload.js"></script>
<style type="text/css">
.imgSize{
width:190px;
height:266px;
}
</style>
<title>ajax文件上传进度条</title>
<script type="text/javascript">
$(function(){
	//支持的文件类型正则表达式
	var fileType = /\.(doc?x|xls?x|ppt?x|txt|jpg|zip|rar|png|mp4|avi)$/i;
	$("#fileupload").fileupload({
		url: 'file/upload.do',
		dataType: 'json',
		add: function(e, data) { //add表示在选择文件时判断格式是否正确
            var goUpload = true;
            var uploadFile = data.files[0];
            if (!fileType.test(uploadFile.name)) {
            	console.log(uploadFile.name);
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
		
			$('#fileinfo').append("<img class='imgSize'  src="+data.result.filePath+"\\"+data.result.fileName+"><br>")
			.append("<span>文件名："+data.result.fileName+"</span><br>")
			.append("<span>大小："+data.result.fileSize+"</span><br>")
			.append("<span>类型："+data.result.fileType+"</span><br>")
			append("<a href="+data.result.filePath+"\\"+data.result.fileName+">下载</a><br>");
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
</head>
<body>	
	<!-- <form action="xxx" > 你可以将以下代码放入form表单里面-->
       	<div class="formControls col-md-10">
			 <span class="btn btn-success fileinput-button mr-5">
       			<span>浏览文件</span>
       			<input id="fileupload" type="file" name="file">
   			</span>
       		<span id="uploadResult"></span><span id="uploadError" style="color: red;"></span>
   			<div class="mt-5">
   				<span class="uploadTip">只能上传doc,docx,xls,xlsx,ppt,pptx,txt,pdf,zip,rar,jpg格式的文件</span>
   			</div>
			<div id="progress" class="progress mt-10" style="display: none;">
				<div class="progress-bar"><span class="sr-only"></span></div>
			</div>
			<!-- ajax上传成功后返回文件名，如value='xxx.txt' -->
			<input type="hidden" id="fileName" name="fileName" >
			<div id="fileinfo"></div> 		
       	</div>
      
    <!-- </form> -->
</body>

</html>