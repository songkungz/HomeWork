<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html lang="en">
<head>	<title>梦帆教育</title>	
<meta name="keywords" content="Edumate a Education Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- stylesheets -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/font-awesome.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/lightbox.css">
     <link rel="stylesheet" href="css/strstyle.css">
    <link rel="stylesheet" href="css/templatemo-style.css">
     <!-- play.css -->
     
  <link type="text/css" rel="stylesheet" href="css/stylecourse.css">
 <!-- play.css -->
 <link rel="stylesheet" href="css/play.css">
 <link rel="stylesheet" type="text/css" href="css/courselist.css">
<!-- 链接被删除，暂时隐藏 -->
<link rel="stylesheet" href="css/coursetable.css">
	<!-- scripts -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/numscroller-1.0.js"></script>
	<script type="text/javascript">
     $( function(){
      value = "${user.uname}";
       if(value.length!=0)
      {
          var alable = document.getElementById("login");
          alable.innerHTML="<span>"+value+"&nbsp;&nbsp;&nbsp;</span><a href='user/quituser.do' >注销</a>";
      }
      else{
      return;
      }
      })    
    </script>
    <style type="text/css">
    .pl{
   padding-bottom:13px;
    }
    </style>
</head>
<style type="text/css">
*{ margin:0px; padding:0px;}
 #menu{ background-color:#eee; width:100%; height:62px; margin:0 auto;}
 .dh{ list-style:none;}
 .shouye  a{ text-decoration:none; color:#000; display:block; width:120px;}
  .rightlogin  a{ text-decoration:none; color:lightred; display:block; width:120px;}
   .rightperson  a{ text-decoration:none; color:#000; display:block; width:120px;}
 ul li ul li{ float:none;margin-top:2px; background-color:#eee; } 
.xiala{width:120px; position:absolute;display:none;  }
 ul li:hover ul{display:block;}
 .shouye{
  line-height:62px; text-align:center; position:relative; float:left;
  padding-left: 5%;
  font-size: 20px;
 }
 .rightlogin{
  line-height:62px; text-align:center; position:relative; float:left;
  padding-left: 60%;
  padding-right: 1%;
 }
 .rightperson{
  line-height:62px; text-align:center; position:relative; float:left;color:white;
 }
</style>

<body>
<!-- 导航栏 -->
		<div class="navbar navbar-default navbar-fixed-top w3ls-navbar">
			<div class= "container brand1">
				<a href="#" class="navbar-brand w3-logo">梦帆教育</a>
				<button class="navbar-toggle" data-toggle="collapse" data-target=".navHeaderCollapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<!-- navbar collapse -->
				<div class="collapse navbar-collapse navHeaderCollapse">
					<ul class="nav navbar-nav navbar-right w3ls-nav topnav">
					

					    
						<li ><a id="login"  class="logintext" padding-top:10px; href="login.jsp">亲，请登录</a></li>
						<li><a class="scroll" href="">首页</a></li>
						<li class="rightperson"><a href="#">课程▼</a>
					    <ul class="xiala">
					      <li><a href="#course">培训课程</a></li>
					      <li><a href="trainShow.jsp">培训动态</a></li>
					      <li><a  href="download.jsp">课程资源</a></li>
					    
					       <li><a href="personal1.jsp">个人中心</a></li>
					    </ul>
					  </li>
						<li><a class="scroll" href="#ptsection-five">师资</a></li>
						<li><a class="scroll" href="#中心简介">中心简介</a></li>
						  <li><a class="scroll" href="comments.jsp">用户反馈</a></li>
					</ul>
				</div>
			</div>
		</div>
<!-- 导航栏 -->
<script type="text/javascript">
   $(function(){
        $.ajax({
         url:'news/indexinfo.do',
         type:'post',
         datatype:'json',
         success:function(list){																						
     //遍历数据
              var str=""
		       $.each(list,function(index,element){
		       str +="<div class='swiper-slide'>";
		       str+="<div class='grid ' >"
		       str+="<figure class='effect-apollo'>"      
		       str +="<a href='#'>";
		       str +="<img src='"+element.imge+"'>";
		       str +="</a>";
		       str +="<figcaption>";
		       str +="<p>"+element.title+"</p>";
			   str +="</figcaption></figure></div></div>";  
		         })  
		         $("#index").append(str);
		       },
		      
       error:function(){
       alert("请求失败")}
      })
 })
</script>
<!-- 新闻轮播 -->
<section class="pc-banner">
	<div class="w3-banner-heading">
	<div class="swiper-container">
		<div class="swiper-wrapper" id="index">
			
			
			<!--  <div class="swiper-slide">
				<a href="#">
				<img src="images/banner002.jpg">
				</a>
			</div>
			<div class="swiper-slide">
					<a href="#">
					<img src="images/banner003.jpg">
					</a>
			</div>

			<div class="swiper-slide">
					<a href="#">
					<img src="images/banner004.jpg">
					</a>
			</div>
			<div class="swiper-slide">
					<a href="#">
					<img src="images/banner005.jpg">
					</a>
			</div>
			-->
		</div>
		
			<div class="button">
				<div class="swiper-button-prev"></div>
				<div class="swiper-button-next"></div>
			</div>	  
	</div>
	</div>
</section>
<!-- 新闻轮播 -->
<!-- 培训课程部分 -->
<div class="gallery pt-section" data-name="Gallery" id="course">
            <div class="ourteam" >培训课程</div>
		<a    href='CourseList.jsp' class='f-s-16 pull-right text-grey' target='_black'><span  class='align-middle'>更多课程</span > <i class='arrow arrow-right' ></i></a>
		   <div class='container' data-v-062ec5dc=''>
		    <div class='m-l--15 m-r--15 m-b--25' >
		<script type="text/javascript">
	  $(function(){
        $.ajax({
         url:'cou/findAllCourse.do',
         type:'post',
         datatype:'json',
         data:{"pageNow":1},
         success:function(list){
         console.log(list);
    //将数据显示在页面上
        var str = "";            
     //遍历数据
    
      
      
       $.each(list.list,function(index=6,element){
        str +="<a href='coursedetail.jsp?id="+element.cid+"' target='_blank' class='CourseListItem_ListItem show' index="+index+">";
        str +="<div class='CourseListItem_cover'>";
        str +="<div class='CourseListItem_img' style='background-image: url("+element.cimage+");'>";
		str +=" <img src='"+element.cimage+"' alt=''></div> ";
		str +="<div class='CourseListItem_tags'>  </div> ";
         str +=" <div class='CourseListItem_status'>共"+element.cnum+"课";
         str +=" </div></div> <div class='CourseListItem_body'><div class='CourseListItem_info'>";
          str +=" <div class='text-ellipsis-line-2 CourseListItem_title'>"+element.ctitle+"</div>";
           str +="<div class='CourseListItem_subtitle'>"+element.csynopsis+"</div></div> ";
            str +="<div class='CourseListItem_price'>￥0.00";
             str +="<del class='CourseListItem_oriPrice'>￥"+element.cprice+"</del></div></div></a>";  
	 		})
         $('#more').append(str);
		},
		error:function(){
		alert("请求失败！");
		}
	 })
 })
      </script>  
         </div>	
         	</div>
      </div>	
     <div id='more'></div>			
<!-- 培训课程结束 -->
<!-- 师资力量 -->

<!--文科 理科 工科  -->
	<div class="gallery pt-section" data-name="Gallery" id="ptsection-five">
            <div class="ourteam" >Our Team</div>
            <ul class="grid2 cs-style-6"    >
                <div class="clearfix" id="teacherinfo"> </div>
            </ul>
            <div class=""><a href=""></a></div>
    </div>
   <script type="text/javascript" charset="UTF-8">
	    $(function(){
        $.ajax({
         url:'column/columninfo.do',
         type:'post',
         data:{"pageNow":1},
         success:function(column){
             console.log(column);
    //将数据显示在页面上
        var str = "";
     //遍历数据
       $.each(column.list,function(index,element){
        var name =encodeURI(element['name']);
         str+="<li ><figure>"
         str +="<div class='gallery-grid2'>";
         str +=" <a href='teacherlist.jsp?type="+name+"' title='点击了解更多' class='b-link-stripe b-animate-go  thickbox'>";
         str +="<img src='"+element['image']+"'/>";
         str +=" <figcaption>";
		 str +="<div class='med-text'>";
		 str +=" <h4>"+element['name']+"</h4>";
         str +=" <p>"+element['describe']+"</p>";
         str +=" </div></figcaption></a></div></figure></li>";
       })
//遍历完成之后      
//将表格添加到body中
       $('#teacherinfo').append(str);
       
        },
        error:function(){
        alert("请求失败！");
        }
       })
        })
      </script>  
<!-- //师资力量 -->

<!-- 中心简介 -->
<div class="w3ls-about" id="about">
	<div class="container w3about">
	<a name="中心简介"></a>
		<div class="about-txt">
		<h3>发展历史</h3>
		<br>
		<p>培训中心成立于2000年，秉承“一切为了学生，创建终身教育大课堂”的办学理念，是一个针对高中生、初中生的培训机构，建成以来我们一共培训了xx起高中生、xx期初中学生；高中生一本上线率xx%，二本上线率xx%；初中生上线率xx%。</p>
		<br>
		<h3>培训内容</h3>
		<br>
		<p>针对高中生高考的科目，文理科都有相应的课程视频，还有历年高考题目讲解视频；针对初中生中考的科目，我们也有相应的视频课程和历年中考题目讲解视频。</p>
		<br>
		<h3>主要目标&未来展望</h3>
		<br>
		<p>我们以“艰苦磨砺、勤思创新、执着追求”作为文化核心，将“以人为本、实施创新教育、创建终身教育大课堂、精心打造一个国际性教育品牌，建成一个完善的全球服务网”为目标，逐步走向教育服务多元化，形成了“xxx”这一著名教育品牌，并成为一家大型跨国集团化教育机构。</p>
		<br>

		</div>
	<div class="about-img">
		<img src="images/banner3.jpg" class="img-responsive" alt="about image" />
		</div>
	</div>
</div>
<!-- 中心简介 -->
		

<!-- 联系我们 -->
<div class="contact w3ls-contact" id="contact">
	<div class="container w3-contact">
	<div class="list1">
	<ul class="contact-list">
		<li class="heading"> 关于我们</li>
		<li>+86</li>
		<li>18786186883</li>
		<li><a href="mailto:yourmailid@company.com">sharf_wang@163.com</a></li>
	</ul>
	
	<ul class="contact-hrs">
		<li class="heading">工作日</li>
		<li>周一至周五</li>
		<li>09:00  - 18:30 </li>
	</ul>
	</div>
	<div class="list2">
	<ul class="social-links">
		<li class="heading">联系我们 </li>
		<li><a href="https://weibo.com/u/3294879587">微博</a></li>
		<li><a href="qq.com">QQ</a></li>
		<li><a href="weixin.com">微信</a></li>
		<li><a href="facebook.com">facebook </a></li>
	</ul>
	
	<ul class="sub-scribe">
		<li class="heading">Subscribe</li>
		<li>
			<form action="/" method="post">
				<input type="email" name="email" placeholder="Enter Your E-Mail" required><br>
				<input type="submit" value="Subscribe"><br>
			</form>
		</li>
	</ul>
	</div>
	</div>
	<div class="agileits-w3layouts">
		<div class="container">
			<p>@XXX培训中心2018| Design by <a href="http://w3layouts.com"> The group tenth</a></p>
		</div>
	</div>
</div>
<!-- 联系我们 -->
	<!-- stylesheets -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/font-awesome.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/lightbox.css">
	<link rel="stylesheet" href="css/component.css">
	<!-- scripts -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/numscroller-1.0.js"></script>
	<script src="js/modernizr.custom.js"></script>
	<script src="js/swiper.min.js"></script>
	<script type="text/javascript">
	
</html>