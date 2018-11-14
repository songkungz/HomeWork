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
<!-- <link rel="stylesheet" type="text/css" href="css/default.css" /> -->
<style type="text/css">
 
      input[type=text],
      input[type=password] {
        font-size: 13px;
        min-height: 32px;
        margin: 4;
        padding: 7px 8px;
        outline: none;
        color: #333;
        background-color: #fff;
        background-repeat: no-repeat;
        background-position: right center;
        border: 1px solid #ccc;
        border-radius: 3px;
        box-shadow: inset 0 1px 2px rgba(0,0,0,0.075);
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        transition: all 0.15s ease-in;
        -webkit-transition: all 0.15s ease-in 0;
        vertical-align: middle;
      }
      .sbttn {
        position: relative;
        display: inline-block;
        margin: -10;
        padding: 8px 20px;
        font-size: 15px;
        font-weight: bold;
        color: #333;
        text-shadow: 0 1px 0 rgba(255,255,255,0.9);
        white-space: nowrap;
        background-color: #eaeaea;
        background-image: -moz-linear-gradient(#fafafa, #eaeaea);
        background-image: -webkit-linear-gradient(#fafafa, #eaeaea);
        background-image: linear-gradient(#fafafa, #eaeaea);
        background-repeat: repeat-x;
        border-radius: 3px;
        border: 1px solid #ddd;
        border-bottom-color: #c5c5c5;
        box-shadow: 0 1px 3px rgba(0,0,0,.05);
        vertical-align: middle;
        cursor: pointer;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        -webkit-touch-callout: none;
        -webkit-user-select: none;
        -khtml-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
        -webkit-appearance: none;
      }
      .sbttn:hover,
      .sbttn:active {
        background-position: 0 -15px;
        border-color: #ccc #ccc #b5b5b5;
      }
      .sbttn:active {
        background-color: #dadada;
        border-color: #b5b5b5;
        background-image: none;
        box-shadow: inset 0 3px 5px rgba(0,0,0,.15);
      }
      .sbttn:focus,
      input[type=text]:focus,
      input[type=password]:focus {
        outline: none;
        border-color: #51a7e8;
        box-shadow: inset 0 1px 2px rgba(0,0,0,.075), 0 0 5px rgba(81,167,232,.5);
      }
     
      label[for=search_box] {
        display: block;
        text-align: left;
      }
      #search_box label {
        font-weight: 200;
        padding: 20px 0;

      }
      #search_box input[type=text] {
        font-size: 18px;
        width: 90%;
		
      }
      #search_box .button {
        padding: 10px;
        width: 90px;
      }
.highlight { background: yellow; color: red; }
.prelight { background: blue; color: white; }
#tip { background: #FFFFCC; border: 2px solid #999; width: 200px; text-align: center; display: none; font-size: 15px; }
/*#search_box { background: white; opacity: 0.8; text-align:right }*/
/*#search_btn { background: #0f79be; margin-top: 6px; border-radius: 2px; border: 0px; width: 100px; line-height: 24px; color: white; }*/
/*#searchstr { font-size: 14px; height: 20px; }*/
</style>
<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript">
(function($) {
    $.fn.fixDiv = function(options) {
        var defaultVal = {
            top: 20
        };
        var obj = $.extend(defaultVal, options);
		$this = this;
        var _top = $this.offset().top;
        var _left = $this.offset().left;
        $(window).scroll(function() {
            var _currentTop = $this.offset().top;
            var _scrollTop = $(document).scrollTop();
            if (_scrollTop > _top) {
                $this.offset({
                    top: _scrollTop + obj.top,
                    left: _left
                });
            } else {
                $this.offset({
                    top: _top,
                    left: _left
                });
            }
        });
        return $this;
    };
})(jQuery);
$(function(){
	/*$("#search_box").fixDiv({ top: 0 });*/
	$('#search_btn').click(highlight);//点击search时，执行highlight函数；
	$('#searchstr').keydown(function (e) {
	    var key = e.which;
	    if (key == 13) highlight();
	})
	
	var i = 0;
	var sCurText;
	function highlight(){
		clearSelection();//先清空一下上次高亮显示的内容；
		
		var flag = 0;
	    var bStart = true;
		
		
		$('#tip').text('');
	    $('#tip').hide();
	    var searchText = $('#searchstr').val();
		var _searchTop = $('#searchstr').offset().top+30;
		var _searchLeft = $('#searchstr').offset().left;
		if($.trim(searchText)==""){
			//alert(123);
			showTips("请输入查找内容",_searchTop,3,_searchLeft);
			return;
		}
			
			
		var searchText = $('#searchstr').val();//获取你输入的关键字；
		var regExp = new RegExp(searchText, 'g');//创建正则表达式，g表示全局的，如果不用g，则查找到第一个就不会继续向下查找了；
		var content = $("#content").text();
		if (!regExp.test(content)) {
			showTips("没有找到要查找的内容",_searchTop,3,_searchLeft);
	        return;
	    } else {
	        if (sCurText != searchText) {
	            i = 0;
	            sCurText = searchText;
	         }
	     }
		
		$('p').each(function(){
			var html = $(this).html();
			var newHtml = html.replace(regExp, '<span class="highlight">'+searchText+'</span>');//将找到的关键字替换，加上highlight属性；

			$(this).html(newHtml);//更新；
			flag = 1;
		});
		
		if (flag == 1) {
			if ($(".highlight").size() > 1) {
				var _top = $(".highlight").eq(i).offset().top+$(".highlight").eq(i).height();
				var _tip = $(".highlight").eq(i).parent().find("strong").text();
				if(_tip=="") _tip = $(".highlight").eq(i).parent().parent().find("strong").text();
				var _left = $(".highlight").eq(i).offset().left;
	            var _tipWidth = $("#tip").width();
				if (_left > $(document).width() - _tipWidth) {
	                    _left = _left - _tipWidth;
	            }
				$("#tip").html(_tip).show();
	            $("#tip").offset({ top: _top, left: _left });
	            $("#search_btn").val("查找下一个");
			}else{
				var _top = $(".highlight").offset().top+$(".highlight").height();
				var _tip = $(".highlight").parent().find("strong").text();
	            var _left = $(".highlight").offset().left;
	            $('#tip').show();
	            $("#tip").html(_tip).offset({ top: _top, left: _left });
			}
			$("html, body").animate({ scrollTop: _top - 85 });
	        i++;
	        if (i > $(".highlight").size() - 1) {
	            i = 0;
	        }
		}
	}
	function clearSelection(){
		$('p').each(function(){
			//找到所有highlight属性的元素；
			$(this).find('.highlight').each(function(){
				$(this).replaceWith($(this).html());//将他们的属性去掉；
			});
		});
	}
	
	//mask
	var tipsDiv = '<div class="tipsClass"></div>'; 
	$( 'body' ).append( tipsDiv );
	function showTips( tips, height, time,left ){ 
		var windowWidth = document.documentElement.clientWidth; 
		$('.tipsClass').text(tips);
		$( 'div.tipsClass' ).css({ 
		'top' : height + 'px', 
		'left' :left + 'px', 
		'position' : 'absolute', 
		'padding' : '8px 6px', 
		'background': '#000000', 
		'font-size' : 15 + 'px', 
		'font-weight': 900,
		'margin' : '0 auto', 
		'text-align': 'center', 
		'width' : 'auto', 
		'color' : '#fff', 
		'border-radius':'2px', 
		'opacity' : '0.8' ,
		'box-shadow':'0px 0px 10px #000',
		'-moz-box-shadow':'0px 0px 10px #000',
		'-webkit-box-shadow':'0px 0px 10px #000'
		}).show(); 
		setTimeout( function(){$( 'div.tipsClass' ).fadeOut();}, ( time * 1000 ) ); 
	} 
})
/**/
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
			<div class="w3-banner-heading"></div>
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

	  </section>
	  <!-- 中心简介 -->
	  		<div id="main">
   <div class="demo">
     <div id="search_box">
		<input class="textbox" id="searchstr" type="text" size="12" name="searchstr" />　
        <input class="sbttn" id="search_btn" type="button" value="页内查找" />
	 </div>
<div id="content">
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