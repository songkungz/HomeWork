<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    
  	<script type="text/javascript" src="plupload/js/jqueryui/jquery-ui.min.js"></script>
  	<link rel="stylesheet" href="plupload/js/jqueryui/jquery-ui.min.css" rel="external nofollow" />
  	<script type="text/javascript" src="plupload/js/plupload.full.min.js"></script>
  	<script type="text/javascript" src="plupload/js/jquery.ui.plupload/jquery.ui.plupload.min.js"></script>
  	<script type="text/javascript" src="plupload/js/i18n/zh_CN.js"></script>
  	<link rel="stylesheet" type="text/css" href="plupload/js/jquery.ui.plupload/css/jquery.ui.plupload.css" rel="external nofollow" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jquery-3.3.1.min.js">
	</script>
	<script type="text/javascript">
	$(function(){
	
	})
	  function newsList(){
		$.ajax({
		url:"news/newsinfo.do",
	 	type:"post",
	 	success:function(list){	
	 		$("#news_list").html("");
	 		$.each(list,function(index,value){	
		 			$("#news_list").append("<tr>")
		 			.append("<td>"+value.title+"</td>")
		 			.append("<td>"+value.n_Content+"</td>")
		 			.append("<td>"+value.author+"</td>")
		 			.append("<td>"+value.time+"</td>")
		 			.append("<td>"+"<a href='news/deleteNews.do?id="+value.nid+"'>删除</a>" +"</td>")
		 			.append("</tr>")
	 		})
	 		
	 	},
	 	error:function(){
	 		alert("请求失败")
	 	}
	 }
	 )
	 }
$(function() {
  // Initialize the widget when the DOM is ready
  var uploader = $("#uploader").pluploadQueue({
   // General settings
   runtimes: 'html5,flash,silverlight,html4',
   url: "file/upload.do",
   
   // Maximum file size
   max_file_size: '10000mb',
 
   chunk_size: '1mb',
 
   // Resize images on clientside if we can
   resize: {
    width: 200,
    height: 200,
    quality: 90,
    crop: true // crop to exact dimensions
   },
 
   // Specify what files to browse for
   filters: [
    {title: "Image files", extensions: "jpg,gif,png"},
    {title: "Vedio files", extensions: "mp4,mkv"},
    {title: "Zip files", extensions: "zip,avi"}
   ],
	 multipart_params: {
	   name:document.getElementsByName("file")[0]
	},
   // Rename files by clicking on their titles
   rename: true,
 
   // Sort files
   sortable: true,
 
   // Enable ability to drag'n'drop files onto the widget (currently only HTML5 supports that)
   dragdrop: true,
 
   // Views to activate
   views: {
    list: true,
    thumbs: true, // Show thumbs
    active: 'thumbs'
   },
 
   // Flash settings
   flash_swf_url: 'js/Moxie.swf',
 
   // Silverlight settings
   silverlight_xap_url: 'js/Moxie.xap'
  });
 
  $("#toStop").on('click', function () {
   uploader.stop();
  });
 
  $("#toStart").on('click', function () {
   uploader.start();
  });
 });
	
 </script>
  </head>
  
  <body>

  
  		<div id="uploader">
 		<p>Your browser doesn't have Flash, Silverlight or HTML5 support.</p>
		</div>
		   <form  method="post" enctype="multipart/form-data">
		   <input type="file"  name="file" value="选择文件">
			<button id="toStop">暂停一下</button>
			<button id="toStart">再次开始</button>
			</form>
         <table id="news_list">
         </table>
  </body>
</html>
