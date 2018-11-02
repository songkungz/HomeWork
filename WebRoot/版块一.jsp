<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
	<title>首页</title>
	<!-- stylesheets -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/font-awesome.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/lightbox.css">
	<!-- scripts -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/numscroller-1.0.js"></script>
<script type="text/javascript" src="js/swiper.min.js">
 window.onunload =setImg(addr);//打开页面的时候执行
 function setImg(addr){//动态添加图片地址
　　　　　　　　　
                $("#logo").attr("src","business/getImg?addr="+addr+"");
            }
</script>	
</head>
<body>
	
		<div class="navbar navbar-default navbar-fixed-top w3ls-navbar">
			<div class= "container brand1">
				<a href="#" class="navbar-brand w3-logo">首页</a>
				
				<button class="navbar-toggle" data-toggle="collapse" data-target=".navHeaderCollapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<!-- navbar collapse -->
				<div class="collapse navbar-collapse navHeaderCollapse">
					<ul class="nav navbar-nav navbar-right w3ls-nav">
						<li><a class="scroll" href="#home">Home</a></li>
						<li><a class="scroll" href="#about">Home</a></li>
						<li><a class="scroll" href="#team">About</a></li>
						<li><a class="scroll" href="#gallery">Team</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Departments <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="#service">Arts</a></li>
								<li><a href="#service">Science</a></li>
								<li><a href="#service">Commerce</a></li>
							</ul>
						</li>
						<li><a class="scroll" href="#stats">Stats</a></li>
						<li><a class="scroll" href="#blog">Blog</a></li>
						<li><a class="scroll" href="#contact-form">Contact</a></li>
					</ul>
				</div>
			</div>
		</div>
		<section class="pc-banner">
			<div class="w3-banner-heading">
	<div class="swiper-container">
		<div class="swiper-wrapper">
			<div class="swiper-slide swiper-slide-center none-effect">
				
						<div class="grid">
							<figure class="effect-apollo">
										<img src="images/banner001.jpg">
									<figcaption>
										<p>浔阳江头夜送客，枫叶荻花秋瑟瑟</p>
									</figcaption>	
							</figure>
						</div>
			</div>
			<div class="swiper-slide">
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
		</div>
		<div class="button">
			<div class="swiper-button-prev"></div>
			<div class="swiper-button-next"></div>
		</div>
	  
	</div>
		<!-- navbar end-->
		<!-- <div class="w3-banner-heading">
			<h1>Welcome To The World Unique Education Place.</h1>
			<P>Beyond Excellence Skills</p> 
		</div> -->
	<!-- banner ends -->
	  </section>
	  <!-- 中心简介 -->
	<div class="w3ls-about" id="about">
		<div class="container w3about">
			<div class="about-txt">
				<h3>发展历史</h3>
				<br>
				<p>xxx培训中心成立于2000年，秉承“一切为了学生，创建终身教育大课堂”的办学理念，是一个针对高中生、初中生的培训机构，建成以来我们一共培训了xx起高中生、xx期初中学生；高中生一本上线率xx%，二本上线率xx%；初中生上线率xx%。</p>
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
	<!-- 中心简介 end -->
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
		</div>
	</div>
	<!-- //Contact Section -->
		<!-- //footer -->
	<!-- copyright -->
	<div class="agileits-w3layouts">
		<div class="container">
			<p>@XXX培训中心2018| Design by <a href="http://w3layouts.com"> The group tenth</a></p>
		</div>
	</div>
</body>
</html>