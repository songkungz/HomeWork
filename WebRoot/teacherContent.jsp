<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html style="font-size: 100px;"><!--<![endif]--><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教师资料</title>
<link rel="stylesheet" type="text/css" href="css/teachercontent.css">
<style type="text/css">
.fl{
padding-left:60px;
}
</style>
</head>

<script src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
Request = {  
        QueryString : function(item){  
        var svalue = location.search.match(new RegExp("[\?\&]" + item + "=([^\&]*)(\&?)","i"));  
        return svalue ? svalue[1] : svalue;  
        }  
        }            
tid = decodeURI(Request.QueryString("tid"));
  $(function(){
        $.ajax({
         url:"teacher/findteacherbyid.do",
         type:'post',
         data:{"id":tid},
         success:function(teacher){
         console.log(teacher);
             $("#part1").append("<div class='block clearfix'>")
            .append("<div class='img'")
             .append("<img src="+teacher.image+"></div>")
             .append("<div class='text-box'>")
             .append("<div class='dorname'>")
             .append("<div class='title1'></div>")
             .append("<div class='title2'>教授</div>")
             .append("<div class='title2'>"+teacher.information+"</div></div></div></div>")
                                         
    //将数据显示在页面上
        var str = "";
     //遍历数据
         tname = teacher.tname                                           
      $.each(teacher.t_course,function(index,element){ 
         str+="<tr class='tr1'>"
         str +=" <td class='td1'>";
         str +="  <div class='td'>"+tname+"</div>  </td>";
         str +=" <td class='td1'>";
         str +=" <a href='coursedetail.jsp?id="+element.cid+"'><div class='td2'>"+element.cname+"</a></div>";
		 str +="</td>";
		 str +=" <td class='td1'>";
         str +=" <div class='td'>2018年11月20日 18:30-21:00</div>";
         str +=" </td>";
        str +="  <td class='td1'>";
         str +="<div class='td'>120人</div>";
         str+=" </td></tr>"
       })
          $('#course').append(str);
        },
        error:function(){
        alert("请求失败！");
        }
       })
        })
      </script>  
</script>
<body class="w_1366">
<div id="myalert-shadow" class="myalert-shadow"></div>
<!-- header -->
<input type="hidden" id="catebynav" value="/department_neikxx/doctor">


    <div class="body_box dorctordtail" style="min-height: 219px;">
    <div class="position">
	<div class="block" >您现在的位置： 
		<a href="index.jsp">首页</a>
        &gt;<a href="teacherlist.jsp?type=<%=request.getParameter("type")%>">教师团队</a>
					 &gt;教师信息	</div></div>
    <div class="part1 fl" id="part1">
        
          
    </div>
    <div id="docker-visit" class="part2" id="part2"><div class="block">
    <div class="title1">
        <span>授课信息</span>
    </div>
    <div class="table" >
        <table>
            <tbody  id="course">
            <tr class="trth" >
                <th class="th1">教师</th>
                <th class="th2">教授科目</th>

                <th class="th4">授课日期</th>
                <th class="th5">选课人数</th>
            </tr>
           
             
             
            </tbody>
        </table>
    </div>
</div></div>
</body></html>