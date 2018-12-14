<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link rel="stylesheet" type="text/css" href="css/normalize.css" /><!--CSS RESET-->
	
	<!--  <link rel="stylesheet" type="text/css" href="css/base.css"><!--演示页面样式，使用时可以不引用-->
	
	
	<!--必要样式-->
	<link href="css/photopile.css" rel="stylesheet">
  	<link href="css/demo.css" rel="stylesheet">
	
</head>
<body>

<div class="photopile-wrapper">
	<ul class="photopile">
		<li>
			<a href="images/test1.jpg">
			<img src="images/test1.jpg" alt="Barton Dam, Ann Arbor, Michigan" width="133" height="100" />
			</a>
		</li>
		<li>
			<a href="images/test2.jpg">
			<img src="images/test2.jpg" alt="Building Atlanta, Georgia" width="133" height="100" />
			</a>
		</li>
		<li>
			<a href="images/test3.jpg">
			<img src="images/test3.jpg" alt="Nice day for a swim" width="133" height="100" />
			</a>
		</li>
		<li>
			<a href="images/test4.jpg">
			<img src="images/test4.jpg" alt="The plants that never die" width="100" height="133" />
			</a>
		</li>
		<li>
			<a href="images/test5.jpg">
			<img src="images/test5.jpg" alt="Downtown Atlanta, Georgia" width="100" height="134" />
			</a>
		</li>
		<li>
			<a href="images/test6.jpg">
			<img src="images/test6.jpg" alt="Atlanta traffic" width="100" height="137" />
			</a>
		</li>
		<li>
			<a href="images/test7.jpg">
			<img src="images/test7.jpg" alt="A pathetic dog" width="120" height="120" />
			</a>
		</li>
		<li>
			<a href="images/test8.jpg">
			<img src="images/test8.jpg" alt="Two happy dogs" width="140" height="100" />
			</a>
		</li>
		<li>
			<a href="images/test9.jpg">
			<img src="images/test9.jpg" alt="Antigua, Guatemala" width="100" height="133" />
			</a>
		</li>
		<li>
			<a href="images/认证10.png">
			<img src="images/认证10.png" alt="Playa Blanca, Panama" width="133" height="100" />
			</a>
		</li>
		<li>
			<a href="images/test11.jpg">
			<img src="images/test11.jpg" alt="The bat cave" width="119" height="133" />
			</a>
		</li>
		<li>
			<a href="images/test12.jpg">
			<img src="images/test12.jpg" alt="All Saints Day Kite Festival" width="133" height="100" />
			</a>
		</li>
		<li>
			<a href="images/认证6.jpg">
			<img src="images/认证6.jpg" alt="Red frog" width="133" height="100" />
			</a>
		</li>
		<li>
			<a href="images/test13.jpg">
			<img src="images/test13.jpg" alt="Tikal, Guatemala" width="130" height="130" />
			</a>
		</li>
		
		<li>
			<a href="images/test15.jpg">
			<img src="images/test15.jpg" alt="Summer flowers" width="133" height="100" />
			</a>
		</li>
		<li>
			<a href="images/test16.jpg">
			<img src="images/test16.jpg" alt="Full of hot air" width="133" height="100" />
			</a>
		</li>
		<li>
			<a href="images/认证5.png">
			<img src="images/认证5.png" alt="Panama City, Panama" width="133" height="96" />
			</a>
		</li>
		<li>
			<a href="images/test17.jpg">
			<img src="images/test17.jpg" alt="On the rise" width="133" height="100" />
			</a>
		</li>
		
		<li>
			<a href="images/test19.jpg">
			<img src="images/test19.jpg" alt="The Panama Canal" width="140" height="79" />
			</a>
		</li>
		<li>
			<a href="images/认证9.jpg">
			<img src="images/认证9.jpg" alt="Ceviche Loco" width="140" height="93" />
			</a>
		</li>
		<li>
			<a href="images/test20.jpg">
			<img src="images/test20.jpg" alt="Flags over Brussels" width="133" height="99" />
			</a>
		</li>
		<li>
			<a href="images/test21.jpg">
			<img src="images/test21.jpg" alt="Eiffel Tower" width="100" height="134" />
			</a>
		</li>
		<li>
			<a href="images/认证1.jpeg">
			<img src="images/认证1.jpeg" alt="Never-ending stairs" width="99" height="133" />
			</a>
		</li>
		<li>
			<a href="images/认证2.jpeg">
			<img src="images/认证2.jpeg" alt="Paris, France" width="140" height="93" />
			</a>
		</li>
		<li>
			<a href="images/test14.jpg">
			<img src="images/test14.jpg" alt="Mackinac Island, Michigan" width="111" height="130" />
			</a>
		</li>
		<li>
			<a href="images/认证3.jpg">
			<img src="images/认证3.jpg" alt="Rainbow over Belgium" width="136" height="98" />
			</a>
		</li>
		<li>
			<a href="images/认证4.jpg">
			<img src="images/认证4.jpg" alt="Playa del Carmen" width="136" height="96" />
			</a>
		</li>
		<li>
			<a href="images/test10.jpg">
			<img src="images/test10.jpg" alt="Iximche, Guatemala" width="135" height="128" />
			</a>
		</li>
		
		<li>
			<a href="images/认证7.jpg">
			<img src="images/认证7.jpg" alt="Dogs on a couch" width="133" height="99" />
			</a>
		</li>
		<li>
			<a href="images/认证8.jpg">
			<img src="images/认证8.jpg" alt="Tarantula" width="133" height="97" />
			</a>
		</li>
		<li>
			<a href="images/test18.jpg">
			<img src="images/test18.jpg" alt="Amador Causeway, Panama City" width="133" height="100" />
			</a>
		</li>
		
		<li>
			<a href="images/认证11.jpg">
			<img src="images/认证11.jpg" alt="Pickles" width="133" height="99" />
			</a>
		</li>
		<li>
			<a href="images/认证12.jpg">
			<img src="images/认证12.jpg" alt="Parrot" width="133" height="100" />
			</a>
		</li>
		<li>
			<a href="images/认证13.jpg">
			<img src="images/认证13.jpg" alt="Panama rains" width="133" height="100" />
			</a>
		</li>
		<li>
			<a href="images/fullsize/35.jpg">
			<img src="images/thumbs/35.jpg" alt="Cinta Costera, Panama City" width="120" height="120" />
			</a>
		</li>
		<li>
			<a href="images/fullsize/36.jpg">
			<img src="images/thumbs/36.jpg" alt="Afternoon stroll" width="133" height="100" />
			</a>
		</li>
		<li>
			<a href="images/fullsize/37.jpg">
			<img src="images/thumbs/37.jpg" alt="Overlooking the Panama Canal" width="138" height="94" />
			</a>
		</li>
	</ul>
</div>

<script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/jquery.ui.touch-punch.min.js"></script>
<script src="js/photopile.js"></script>
<script type="text/javascript">
$(function(){
	PhotoPile().scatter();
});
</script>
	
</body>
</html>
