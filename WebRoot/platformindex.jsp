<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML>
<html>
 <head>
  <title></title>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <link href="platform/assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
  <link href="platform/assets/css/bui-min.css" rel="stylesheet" type="text/css" />
   <link href="platform/assets/css/main-min.css" rel="stylesheet" type="text/css" />
 </head>
 <script src="js/jquery.min.js"></script>

 <body>

  <div class="header">
    
      <div class="dl-title">
       <!--<img src="/chinapost/Public/assets/img/top.png">-->
      </div>

    <div class="dl-log">欢迎您，<span class="dl-log-user">root</span><a href="superuser/quituser.do" title="退出系统" class="dl-log-quit">[退出]</a>
    </div>
  </div>
   <div class="content">
    <div class="dl-main-nav">
      <div class="dl-inform"><div class="dl-inform-title"><s class="dl-inform-icon dl-up"></s></div></div>
      <ul id="J_Nav"  class="nav-list ks-clear">
        

      </ul>
    </div>
    <ul id="J_NavContent" class="dl-tab-conten">

    </ul>
   </div>
  <script type="text/javascript" src="platform/assets/js/jquery-1.8.1.min.js"></script>
  <script type="text/javascript" src="platform/assets/js/bui-min.js"></script>
  <script type="text/javascript" src="platform/assets/js/common/main-min.js"></script>
  <script type="text/javascript" src="platform/assets/js/config-min.js"></script>
  <script>
    BUI.use('common/main',function(){
      var config = [{id:'1',menu:[{text:'信息管理',items:[{id:'12',text:'用户管理',href:'rightUser.jsp'},{id:'3',text:'新闻管理',href:'rightNews.jsp'},{id:'4',text:'教师管理',href:'rightTeacher.jsp'},{id:'5',text:'课程管理',href:'rightCourse.jsp'},{id:'6',text:'类别管理',href:'rightColumn.jsp'},{id:'7',text:'意见反馈',href:'rightComment.jsp'}]}]}];
      new PageUtil.MainPage({
        modulesConfig : config
      });
    });
   
  </script>
 </body>
</html>