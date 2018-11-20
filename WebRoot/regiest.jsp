<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<!--[if IE 8 ]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9 ]> <html lang="en" class="ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en"> <!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>register</title>


<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<![endif]-->

<link href="css/normalize.css" rel="stylesheet"/>
<link href="css/jquery-ui.css" rel="stylesheet"/>
<link href="css/jquery.idealforms.min.css" rel="stylesheet" media="screen"/>

<style type="text/css">
body{font:normal 15px/1.5 Arial, Helvetica, Free Sans, sans-serif;color: #222;background:url(WebRoot/images/pattern.png);overflow-y:scroll;padding:60px 0 0 0;}
#my-form{width:755px;margin:0 auto;border:1px solid #ccc;padding:3em;border-radius:3px;box-shadow:0 0 2px rgba(0,0,0,.2);}
#comments{width:350px;height:100px;}
</style>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
function  reg(){
		var name = document.getElementById('username').value;
		var sex = document.getElementById('states').value;
		var e_mail = document.getElementsByName('email')[0];
		var password = document.getElementById('pass').value;
		
		 if( name==null ||password==null ||sex==null||e_mail==null)
		 {
		 		 alert('亲，不满足注册条件哦！')
		 		 return false;
		 }
		 else
		 {
		  		 return true;
		 }
		
}


</script>
</head>
<body>


<div class="row">

  <div class="eightcol last">

    <!-- Begin Form -->

    <form id="my-form"  action = "user/regiest.do" onsubmit="return reg()">

        <section name="用户注册">

          <div><label>用户名:</label><input id="username" name="username" type="text"/></div>
          <div><label>密码:</label><input id="pass" name="password" type="password"/></div>
          <div><label>性别:</label>
          <select id="states" name="states">
            <option value="default">&ndash; 选择性别 &ndash;</option>
            <option value="nan">男</option>
            <option value="nv">女</option>
          </select>
        </div>    
         <div><label>年龄:</label><input type="text" name="zip" data-ideal="zip"/></div>
          
          <div><label>邮箱:</label><input id="email" name="email" data-ideal="required email" type="email"/></div>
       
                <div><label>电话:</label><input type="tel" name="phone" data-ideal="phone"/></div>
     
   
      </section>

      <div><hr/></div>

      <div>
        <button type="submit" >提交</button>
        <button id="reset" type="button">重置</button>
      </div>

    </form>

    <!-- End Form -->

  </div>

</div>


<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/jquery.idealforms.js"></script>
<script type="text/javascript">
var options = {

	onFail: function(){
		alert( $myform.getInvalid().length +' invalid fields.' )
	},

	inputs: {
		'password': {
			filters: 'required pass',
		},
		'username': {
			filters: 'required username',
			data: {
			//ajax: { url:'validate.php' }
			}
		},
		'file': {
			filters: 'extension',
			data: { extension: ['jpg'] }
		},
		'comments': {
			filters: 'min max',
			data: { min: 50, max: 200 }
		},
		'states': {
			filters: 'exclude',
			data: { exclude: ['default'] },
			errors : {
				exclude: '选择性别.'
			}
		},
		'langs[]': {
			filters: 'min max',
			data: { min: 2, max: 3 },
			errors: {
				min: 'Check at least <strong>2</strong> options.',
				max: 'No more than <strong>3</strong> options allowed.'
			}
		}
	}
	
};

var $myform = $('#my-form').idealforms(options).data('idealforms');

$('#reset').click(function(){
	$myform.reset().fresh().focusFirst()
});

$myform.focusFirst();
</script>
<div style="text-align:center;">
<p>来源：More Templates </p>
</div>
</body>
</html>