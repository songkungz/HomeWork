
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html lang="en">
<head>	<title>xxx培训中心</title>	
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

	<!-- scripts -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/numscroller-1.0.js"></script>
	
    <script type="text/javascript">
    $(function(){
     $("#login").click(function(){
       var user = <%=session.getAttribute("user")%>;
       if(user!=null)
       {
       replaceMessage();
       }
       else
       {
       window.location.href("longin.jsp");
       }
     })
    
      function replaceMessage(){
        var newNode=document.createElement("span");
        newNode.innerHTML(<%=session.getAttribute("user")%>)
        var oldNode=document.getElementById("login");  
        oldNode.parentNode.replaceChild(newNode,oldNode);
       }    
       $(function(){
	     list();
	    })
        $.ajax({
         url:'news/indexinfo.do',
         type:'get',
         datatype:'json',
         success:function(list){
             console.log(list);
    //将数据显示在页面上
        var str = "";
      
				
				
				
			</div>    																										
     //遍历数据
       $.each(list,function(index,element){
        str +="<div class='swiper-slide'>";
        str +="<a href='#'>";
        str +="<img src="+element.imge+">";
        str +="</a>";
        str +="<figcaption>";
		str +="<p>"+element.title+"</p>";
		str +="<figcaption>";
         str +="</figcaption></figure></div>	";
       })
//遍历完成之后
       
       $('#index').append(str);
        }
       })
  </script>

</head>
<body>
<!-- 导航栏 -->
		<div class="navbar navbar-default navbar-fixed-top w3ls-navbar">
			<div class= "container brand1">
				<a href="#" class="navbar-brand w3-logo">XXX培训中心</a>
				
				<button class="navbar-toggle" data-toggle="collapse" data-target=".navHeaderCollapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<!-- navbar collapse -->
				<div class="collapse navbar-collapse navHeaderCollapse">
					<ul class="nav navbar-nav navbar-right w3ls-nav topnav">
						<input type="text" placeholder="搜索..">
						<li><a id="login"class="logintext" href="">亲，请登录</a></li>
						<li><a class="scroll" href="#about">首页</a></li>
						<li><a class="scroll" href="#中心简介">关于</a></li>
						<li><a class="scroll" href="#gallery">师资</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">培训ing <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="#service">培训动态</a></li>
								<li><a href="#service">培训展示</a></li>
								<li><a href="#service">学员心声</a></li>
							</ul>
						</li>
						<li><a class="scroll" href="#stats">教学资源</a></li>
						<li><a class="scroll" href="#contact-form">联系我们</a></li>
					</ul>
				</div>
			</div>
		</div>
<!-- 导航栏 -->
<!-- 新闻轮播 -->
<section class="pc-banner">
	<div class="w3-banner-heading">
	<div class="swiper-container">
		<div class="swiper-wrapper">
			<div class="swiper-slide swiper-slide-center none-effect" id="index">
		
				<div class="grid" >
					<figure class="effect-apollo">
								<a href="backstapage/news-show.html"><img src="images/banner001.jpg"></a>
							<figcaption>
								<p>浔阳江头夜送客，枫叶荻花秋瑟瑟</p>
							</figcaption>	
					</figure>
				</div>
			</div>
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
<!-- 中心简介 -->
<div class="w3ls-about" id="about">
	<div class="container w3about">
	<a name="中心简介"></a>
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
<!-- 中心简介 -->

<!-- 培训课程部分 -->
	<div class="gallery" id="gallery">
		<h3 class="center" >培训课程</h3>
		<div class="container">
			<div class="gallery-grids" id="pclass">
		        
		<script type="text/javascript">
	    $(function(){
	     list();
	    })
        $.ajax({
         url:'cou/courses.do',
         type:'get',
         datatype:'json',
         success:function(list){
             console.log(list);
    //将数据显示在页面上
        var str = "";
       
         
     //遍历数据
       $.each(list,function(index,element){
        str +="<div class='col-md-4 col-sm-4 gallery-grid'>";
        str +="<div class='grid'>";
        str +="<figure class='effect-apollo'>";
        str +="<a class='example-image-link' href='"+element['image']+"' data-lightbox='example-set' data-title='Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ut sem ac lectus mattis sagittis. Donec pulvinar quam sit amet est vestibulum volutpat. Phasellus sed nibh odio. Phasellus posuere at purus sit amet porttitor. Cras euismod egestas enim eget molestie. Aenean ornare condimentum odio, in lacinia felis finibus non. Nam faucibus libero et lectus finibus, sed porttitor velit pellentesque.'>";
		str +="<img src='"+element['image']+"' alt='' />";
		str +="<figcaption>";
         str +="<p>课程名："+element['cname']+" </br>老师："+element['c_teacher']+"</p>";
         str +="</figcaption>	</a></figure></div></div>";
       })
//遍历完成之后
       
//将表格添加到body中
       $('#pclass').append(str);
        }
       })
      </script>  		
					<div class="clearfix"> </div>
					<script src="js/lightbox-plus-jquery.min.js"> </script>
			</div>
		</div>
	</div>
					
					
		
					

		
		
		
		
		
		
		
<!-- 培训课程结束 -->
<!-- 师资力量 -->
<!--文科 理科 工科  -->
	<div class="gallery pt-section" data-name="Gallery" id="ptsection-five">
            <div class="ourteam">Our Team</div>
            <ul class="grid2 cs-style-6">
                <li>
                    <figure>
                        <div class="gallery-grid2">
                            <a href="images/文学.jpg" title="点击了解更多" class="b-link-stripe b-animate-go  thickbox">
                                <img src="images/文学.jpg" alt=" " />
                                <figcaption>
                                    <div class="med-text">
                                        <h4>文学</h4>
                                        <p>通古今之变，成一家之言</p>
                                    </div>
                                </figcaption>
                            </a>
                        </div>
                    </figure>
                </li>
                <li>
                    <figure>
                        <div class="gallery-grid2">
                            <a href="images/理学.jpg" title="点击了解更多" class="b-link-stripe b-animate-go  thickbox">
                                <img src="images/理学.jpg" alt=" " />
                                <figcaption>
                                    <div class="med-text">
                                        <h4>理学</h4>
                                        <p>判天地之美，析万物之理</p>
                                    </div>
                                </figcaption>
                            </a>
                        </div>
                    </figure>
                </li>
                <li>
                    <figure>
                        <div class="gallery-grid2">
                            <a href="images/工学.jpg" title="点击了解更多" class="b-link-stripe b-animate-go  thickbox">
                                <img src="images/工学.jpg" alt=" " />
                                <figcaption>
                                    <div class="med-text">
                                        <h4>工学</h4>
                                        <p>不用双手也能成就你的梦想</p>
                                    </div>
                                    
                                </figcaption>
                            </a>
                        </div>
                    </figure>
                </li>
                <li>
                    <figure>
                        <div class="gallery-grid2">
                            <a href="images/管理学.jpg" title="点击了解更多" class="b-link-stripe b-animate-go  thickbox">
                                <img src="images/管理学.jpg" alt=" " />
                                <figcaption>
                                    <div class="med-text">
                                        <h4>管理学</h4>
                                        <p>效率、效率、还是效率</p>
                                    </div>
                                    
                                </figcaption>
                            </a>
                        </div>
                    </figure>
                </li>
                <li>
                    <figure>
                        <div class="gallery-grid2">
                            <a href="images/经济学.jpg" title="点击了解更多" class="b-link-stripe b-animate-go  thickbox">
                                <img src="images/经济学.jpg" alt=" " />
                                <figcaption>
                                    <div class="med-text">
                                        <h4>经济学</h4>
                                        <p>机会成本 ？ 扁平化 ？</p>
                                    </div>
                                    
                                </figcaption>
                            </a>
                        </div>
                    </figure>
                </li>
                <li>
                    <figure>
                        <div class="gallery-grid2">
                            <a href="images/心理学.jpeg" title="点击了解更多" class="b-link-stripe b-animate-go  thickbox">
                                <img src="images/心理学.jpeg" alt=" " />
                                <figcaption>
                                    <div class="med-text">
                                        <h4>心理学</h4>
                                        <p>你在看深渊，深渊也在看你。</p>
                                    </div>
                                    
                                </figcaption>
                            </a>
                        </div>
                    </figure>
                </li>
                <div class="clearfix"> </div>
            </ul>
    </div>
<!-- //师资力量 -->
<!-- 培训Ing -->
	<div class="w3-services" id="service">
		<div class="container service">
			<h3 class="center"> 培训Ing</h3>
			<div class="col-md-6 col-sm-6 service1">
				<div class="col-md-8 col-sm-10 txt-align">
					<h4>培训动态</h4>
					<p>在这里，你能看到培训期间的相关图片和视频和培训需要达到的目标。</p>
				</div>
				<div class="col-md-4 col-sm-2">
					<span class="service-icon fa fa-laptop fa-4x" aria-hidden="true"></span>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="col-md-6 col-sm-6 service2">
				<div class="col-md-4 col-sm-2">
					<span class="service-icon fa fa-book fa-4x" aria-hidden="true"></span>
				</div>
				<div class="col-md-8 col-sm-10 txt-align1">
					<h4>培训展示</h4>
					<p>在这里，你能看到我们培训中心各个时期的培训成果的展示</p>
				</div>
				<div class="clearfix"></div>
			</div>
			<!-- sports events -->
			<div class="col-md-6 col-sm-6 service1">
				<div class="col-md-8 col-sm-10 txt-align">
					<h4>学员心声</h4>
					<p>在这里，你能看到各届学员一些基本信息和心中的目标、理想。</p>
				</div>
				
				<div class="col-md-4 col-sm-2">
					<span class="service-icon fa fa-graduation-cap fa-4x" aria-hidden="true"></span>
				</div>
				<div class="clearfix"></div>
			</div>
				<div class="clearfix"></div>
		</div>
	</div>
<!-- 教学资源-->
<div class="container2">
				<a name="stats"></a>
					<h2 class="tittle">教学资源</h2>
					<div class="course-grids">
						<div class="col-md-6 course-grid">
							<div class="mask">
								<a href="#" target=_blank style="text-decoration: none;"><img src="images/timg.jpg" class="img-responsive zoom-img" /></a>
							</div>
						</div>
						<div class="col-md-6 course-grid1 gri">
							<h4><a href="#" class="jx">教学设备</a></h4><br><br><br><br><br>
							<p>培训会议，课堂教学；传统投影仪不易携带，学校教室里由于学生的顽皮，投影仪放在教室里不安全，容易被学生弄坏，微型投影仪的便携性弥补了教学空缺，以后老师讲课只需要把资料存放在投影仪里就可以展示给学生教学，省去了课本和用钢笔、粉笔手写的麻烦。
							</p>
							<p>在全世界，仅有美国德州仪器(TI)能够提供商品化的DMD芯片产品，其原理主要是通过对微反射镜的控制，达到对光进行开关，从而实现对色阶以及灰阶的，在小小的DMD芯片上，拥有近百万个比头发丝还细微型的小反射镜。
							</p>
							<ul class="grid-part">
								<li><i class="glyphicon glyphicon-ok-sign"> </i>DLP技术，掌上投影机的主要推动者</li>
								<li><i class="glyphicon glyphicon-ok-sign"> </i>LCoS技术，彩色滤光型发展为目前的色序型(</li>
								<li><i class="glyphicon glyphicon-ok-sign"> </i>显示领域的一个新热点！</li>
							</ul>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="course-grids">
						<div class="col-md-6 course-grid1">
							<h4><a href="#" class="jx">教程</a></h4><br><br><br><br><br>
							<p>我们存放了供学生观看的视频，以便对学生课后加深与巩固知识。里面有现场的教学资源视频的录制，学生可在其中反复观看学习。</p>
							<p>为了让学生有更好的学习效率，让学生真正的学会学懂。我们采用了高保真的录制技术，学生可以在其中自行调整播放速度，提高自主学习的体验。</p>
							<ul class="grid-part">
								<li><i class="glyphicon glyphicon-ok-sign"> </i>图文教程</li>
								<li><i class="glyphicon glyphicon-ok-sign"> </i>视频教程</li>
								<li><i class="glyphicon glyphicon-ok-sign"> </i>一对一专业辅导</li>
							</ul>
						</div>
						<div class="col-md-6 course-grid gri">
							<div class="mask">
								<a href="#" target=_blank style="text-decoration: none;"><img src="images/timg1.jpg" class="img-responsive zoom-img" /></a>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="course-grids">
						<div class="col-md-6 course-grid">
							<div class="mask">
								<a href="#" target=_blank style="text-decoration: none;"><img src="images/timg2.jpg" class="img-responsive zoom-img" /></a>
							</div>
						</div>
						<div class="col-md-6 course-grid1 gri">
							<h4><a href="#" class="jx">课件</a></h4><br><br><br><br><br>
							<p>经过教学目标确定，教学内容和任务分析，教学活动结构及界面设计等环节，而加以制作的课程软件。它与课程内容有着直接联系。</p>
							<p>电子教案的设计既包括教材分析、教学设计（复习引入、师生交流互动、练习巩固等）、板书、教学反思等传统环节，还包括课件、资料库、友情链接等能够充分发挥信息技术优势的新环节。即在一个教案中，充分整合图、文、声、像等各种媒体的作用，激发学生的学习兴趣。其最大的特点是提供链接，便于调用，生动直观。</p>
							<ul class="grid-part">
								<li><i class="glyphicon glyphicon-ok-sign"> </i>多媒体课件</li>
								<li><i class="glyphicon glyphicon-ok-sign"> </i>电子教案</li>
								<li><i class="glyphicon glyphicon-ok-sign"> </i>二十年来众多名师力量智慧的总结</li>
							</ul>
						</div>
						<div class="clearfix"></div>
					</div>
					
				</div>
<!-- 教学资源-->				
<!-- 留言 -->
	<div class="agile-contact" id="contact-form">
	
		<div class="container">
			
			<div class="w3ls-form contact-details">
				<h3>关于我们</h3>
					<p class="p1">如果你对我们有什么感想或者建议，请注册登录后在走边的留言框里面留言，我们会期待你的留言。</p>
					<span class="fa fa-envelope" aria-hidden="true"></span>
				<h3>邮箱</h3>
					<p><a>2401483006@qq.com</a></p>
					<span class="fa fa-volume-control-phone" aria-hidden="true"></span>
				<h3>电话</h3>
					<p>852-957-1879</p>
				<h3>请留言</h3></br>
					<a href="comments.jsp"><button>Click me</button></a>
			</div>
		</div>
	</div>
<!-- 留言 -->
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