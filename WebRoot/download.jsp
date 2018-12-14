<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <link rel="stylesheet" type="text/css" href="jquery.fileupload/css/jquery.fileupload.css">
<link rel="stylesheet" type="text/css" href="jquery.fileupload/css/H-ui.css">

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="jquery.fileupload/js/jquery.ui.widget.js"></script>
<script type="text/javascript" src="jquery.fileupload/js/jquery.iframe-transport.js"></script>
<script type="text/javascript" src="jquery.fileupload/js/jquery.fileupload.js"></script>
  <link href="css/down_list_style.css" rel="stylesheet" type="text/css">
<script>
function windowHeight() {
	var de = document.documentElement;
	return self.innerHeight||(de && de.clientHeight)||document.body.clientHeight;
}
window.onload=window.onresize=function(){
	var wh=windowHeight();
	document.getElementById("xt-left").style.height = document.getElementById("xt-right").style.height = (wh-document.getElementById("xt-top").offsetHeight)+"px";
}
</script>
 <script type="text/javascript">   

$(function(){
	//支持的文件类型正则表达式
	var fileType = /\.(jpg|png|jpeg|RAR|zip|avi|mp4|pdf|doc|docx|txt)$/i;
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
  <div class="body_box dorctordtail" style="min-height: 219px;">
    <div class="position">
    <br>
	<div class="block" >您现在的位置： 
		<a href="index.jsp">首页</a>
					 &gt;资源共享	</div></div>
  <div class="xt-center">
    <div class="xt-table">
        <table cellpadding="0" cellspacing="0" border="0" bgcolor="#dcdcdc" width="100%" id="list">
            <tr >
            <th>文件名</th>
            <th>类型</th>
            <th>分享时间</th>
            <th>链接</th>
            </tr>
            <tr  ></tr>    
        </table>
    </div>
  <!--   <div class="xt-fenye">
        <div class="xt-fenye-left">当前第 1 / 270 页,每页10条，共 2696条记录</div>
        <div class="xt-fenye-right">
            <a href="#">首页</a>
            <a href="#">上一步</a>
            <a href="#">下一步</a>
            <a href="#">尾页</a>
            <input type="text" name="text" />
            <a href="#" class="xt-link">跳转</a>
        </div>
    </div> -->
</div>
  </head>
  
  <body>
    <div class="formControls col-md-10">
			 <span class="btn btn-success fileinput-button mr-5">
       			<span>文件分享</span>
       			<input id="fileupload" type="file" name="file">
   			</span>
       		<span id="uploadResult"></span><span id="uploadError" style="color: red;"></span>
   		
			<div id="progress" class="progress mt-10" style="display: none;">
				<div class="progress-bar"><span class="sr-only"></span></div>
			</div>
			<!-- ajax上传成功后返回文件名，如value='xxx.txt' -->
			<input type="hidden" id="fileName" name="fileName" >
			<div id="fileinfo"></div> 		
       	</div>
       	      <script>
       	      $(function(){
				$.ajax({
					url:"file/filelist.do",
				 	type:"post",
				 	dataType:"json",
				 	success:function(list){	
				 	console.log(list);
				 	var str="";
					 $.each(list,function(index,element){
			               str+="<tr>";
			               str+="<td><a href='file/download.do?filename="+element.fileName+"'>"+element.fileName+"</a></td>";
			               str+="<td>"+element.fileType+"</td>";
			               str+="<td>"+element.fileTime+"</td>";
			               str+="<td><a href='file/download.do?filename="+element.fileName+"'>下载</a></td>";
			               str+="</tr>";
                     })
                     $("#list").append(str);
				    },
				 	error:function(){
				 		alert("请求失败")
				 	}
				 })
				});
       	      </script>
  </body>
</html>
