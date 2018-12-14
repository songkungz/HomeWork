<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.text.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
String datetime=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(Calendar.getInstance().getTime()); 
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="natural_live">
  <meta name="Keywords" content="barrage">
  <meta name="Description" content="">
  
<link rel="stylesheet" type="text/css" href="css/classshow.css">
  <link rel="stylesheet" type="text/css" href="css/style1.css">
  <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
  <title>弹幕</title>
  	<!-- 输出课程列表 -->

<script type="text/javascript">
          Requst={
          QueryString:function(item)
          {
          var svalue=location.search.match(new RegExp("[\?\&]"+item+"=([^\&]*)(\&?)","i"));
          return svalue ? svalue[1]:svalue;
          }
          }
          cl=Requst.QueryString("CouList")
    
      
	    $(function(){
	   // var ty=request.getParameter("type")
	   // alert(ty)
	     list(); })
	    function list(){
        $.ajax({
         url:'../bel/belongtocourse.do?pageNow=1&Belongto=<%=request.getParameter("Cname") %>',
         type:'get',
        // data:{"Ctype":"1"},
         success:function(list){
             console.log(list);
    //将数据显示在页面上
        var str = "";
        
     //遍历数据
       $.each(list.list,function(index,element){
          pg=list.pageNow;
          index=index+1;
         
       str+="<a href='CourseVideo.jsp?CouList="+element['course_list']+"&Cname=<%=request.getParameter("Cname") %>'>";
        str+="<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第"+ index +"课　 &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+element['course_list']+"</li>";
        str+="</a>";
        
      })
//遍历完成之后
       //str+="</ul>";
//将表格添加到body中
       $('#belongtocourse').append(str);
        }
        
       })
       }
       
       
        function courselist(pageNow){
	$.ajax({
	url:'../bel/belongtocourse.do?Belongto=<%=request.getParameter("Cname") %>&pageNow='+pageNow,
    type:'get',
    datatype:'json',
 	//data:{"pageNow":pageNow+1},
 	dataType:"json",
 	success:function(list){	
	 		console.log(list);
    //将数据显示在页面上
        var str = "";
       // str+=" <ul class='list-group'>";
        //str+=" <li class='list-group-item'><h2>课程目录</h2></li>";
         
     //遍历数据
       $.each(list.list,function(index,element){
        pg=list.pageNow;
          index=index+6;
          str+="<a href='CourseVideo.jsp?CouList="+element['course_list']+"&Cname=<%=request.getParameter("Cname") %>'>";
        str+="<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第"+ index +"课　 &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+element['course_list']+"</li>";
        str+="</a>";
	 		})
	 		
//将表格添加到body中
       $('#belongtocourse').append(str);
	 	},
 	error:function(){
 		alert("请求失败")
 	}
 }
 )
 }    
       
      </script>  

<!-- 输出课程列表结束 -->
  
 </head>
 <body>
  <div class="Dplayer_box">
    <div class="player_av">
        <div id="barrage"><video width="100%" height="100%"  src="video/test2.mp4" controls></video></div>
	
</div><div class="Dplayer_danmu">
        <div class="Dplayer_watching">
            <span class="Dplayer-watching-number" title="">课程目录</span>
           
        </div>
        
        <ul class="Dplayer_list">
            <li>课程节数</li>
            <li>课程内容</li></ul>
        <ul class="list_ovefiow" id="belongtocourse">
           
            
        </ul>
        
    </div>
    </div>
<div id="btn" id="myModalLabel">
                      <input type='hidden' id='CourseList' value='<%=request.getParameter("CouList") %>'></input>                
                       <input type='hidden' id='Uname' value='卢本伟'></input>
                       <input type='hidden' id='Head_image' value='images/55kai.jpg'></input>
                       <input type='hidden' id='Comment_time' value=datetime></input>
		               <input  type="text" id="text"></input>
		              <button class="my-btn" type="submit" name="save" id="save" >发送</button>
		
	</div>
    
</div>


	
      <div class="comment_list">
        <h3 style="text-indent: 2em;">评论列表</h3>
      <hr>
      
      
      
      
          <div class="comment" >
          <ul id="CommentLists"></ul>
          </div>
          
        <!-- 评论列表操作 -->  
          
          <script type="text/javascript">
          
         //  var words = new Array();//用来装弹幕的内容
	    function comment(coulist){
        $.ajax({
         url:'../com/coment.do?pageNow=1&courselist='+coulist,
         type:'get',
         success:function(list){
             console.log(list);
    //将数据显示在页面上
        var str = "";
        
     //遍历数据
       $.each(list.list,function(index,element){
          pg=list.pageNow;
         // words[index]=element['comment_content'];
             str+="<div class='imgdiv'>";
             str+="     <img class='imgcss'  src='"+element['head_image']+"'/>";
             str+="   </div>";
             str+="   <div class='conmment_details'>";
             str+="     <div style='float:left;''>";
             str+="      <span class='comment_name'>"+element['uname']+" </span> <span class='show_reply_list'>["+element['comment_time']+"]</span>：   ";       
             str+="    </div>";
             str+="    <div class='del'>";
             str+="   <button onclick='del("+element['commentid']+")'><span  class='show_reply_list'>删除</span></button>";
             str+="   <a class='del_comment' data-id='1'>  ";
             str+=" </div>";
             str+="   <div class='my-pl-con'>"+element['comment_content']+"</div></div><hr></div>";
                
        
      })
//遍历完成之后
       //str+="</ul>";
       $('#CommentLists').append(str);
        }
        
       })
       }
       
       
       
       
       <!--添加操作-->
    $(function(){
  $("#save").click(function(){
		var str ={
		    "courselist":document.getElementById('CourseList').value,
		    "uname":document.getElementById('Uname').value,
		    "head_image":document.getElementById('Head_image').value,
		    "comment_time":document.getElementById('Comment_time').value,
		    "comment_content":document.getElementById('text').value
		    };
		    var str_json = JSON.stringify(str); 
		    alert(str_json)
		     if(confirm("确认添加？")){
			  $.ajax({
			    url:'http://localhost:8080/TEST4/com/insertComment.do',
			    type:"post",
			    data:str_json,
				contentType:"application/json; charset=utf-8",
				dataType:"json", 
				success:function(data){
				if(data>0)
				{
				alert("保存成功");
				}
				else
				{
				alert("保存失败");
				}
				},
				error:function(){}
			    })
			    }
			  });
})
    <!--添加操作结束-->
    <!--添加拼接-->
  <!--删除操作-->
    function del(id){
        alert(id)
        if(confirm("确认删除？")){
        $.ajax({
        url:'http://localhost:8080/TEST4/com/deleteComment.do',
        type:'get',
        datatype:'json',
        data:{"msg":id},
        success:function(){
        alert('删除成功');
        window.location.reload();
        },
        error:function(data){
        alert(id)
        alert("请求失败")}
        })
        }
        else
        alert("你取消了本次操作")
        }
    <!--删除操作结束-->
    
          
          </script>
          
          <!-- 评论列表操作结束 -->  
          
          
          
          
          
           
           
     
     
     
 
       <div class="comment_add_or_last" >
       <a   onclick='comment(cl),danmu()'>查看评论</a>
        
            </div> 
     
       
       
       
       


	<script type="text/javascript">
		var timer=null;
		var current=[];//存储当前输入框的内容
		var newarr=[];//存储每个弹幕距左边框的距离
		var flag=0;//标志量
		var num=new Array();//数组，用来存储划分每个块的序号
		var words = ["富强","民主","文明","和谐","自由","平等","公正","法治","爱国","敬业","诚信","友善"];
		
		
		function q(id){
              return document.getElementById(id); 	
		}
          
		
		
		
		
		for(var i=0;i<q("barrage").offsetHeight/20 - 1;i++){
			num.splice(i,0,i);//将整个显示框划分成多个块，并对每个块进行标号
			//console.log(num)
		}
		//console.log(num)
		//console.log(num.length)
 
		function  danmu(){//加载页面发生的事件
 
			clearInterval(timer);//清除定时器
			for(var i = 0;i<10;i++){
				setTimeout(function(){
					var word=words[random(0,words.length-1)];//随机产生一个弹幕的内容
					create(word);//创建一个弹幕
				},100*random(10,100))//给弹幕随机加一个延迟
				
			}
			timer=setInterval(move,20);//开启定时器
		}
 
		function create(w){//创建一个弹幕
				var node=document.createElement("div");//创建一个div元素，用来存储弹幕的信息
				//console.log(words.length)
				node.innerHTML=w;
				//console.log($("barrage").offsetHeight)
				var t= random(0,num.length-1);
				//console.log(num)
				node.style.top=num[t]*20+"px";//从划分的块中随机选中一块。
				Delete(num[t]);//删除已被选中的块
				//console.log(t)
				//console.log(node.style.top);
				node.style.left="456px";
				node.style.color="#"+randomColor();//随机颜色
				q("barrage").appendChild(node);//插入子节点
				flag++;//创建了一个新弹幕时，更新为0
				
				//console.log(node.offsetLeft)
		}
 
		function move(){
			var arr=q("barrage").getElementsByTagName("div");//获取所有的弹幕
            for(var i=0;i<arr.length;i++){
                newarr.push(arr[i].offsetLeft);//将每个弹幕距左边边框的距离分别存储在newarr数组中
                arr[i].style.left=newarr[i]+"px";//更新距离
                newarr[i] = newarr[i] - 2;//每次减少2px
                if(newarr[i]<0){
					//console.log(arr[i].innerHTML)
					if(currentTest(arr[i].innerHTML) && flag != 0){//当是从输入框发送的弹幕时而且是第一次时,将内容添加到预备的词库中，并删除这个div元素。这么做是为了将弹幕数量维持在一定数量，防止在输入框发送大量弹幕，导致出现错误。
						//console.log(current)
						words.push(arr[i].innerHTML);
						q("barrage").removeChild(arr[i]);
						newarr.splice(i,1);//在newarr中删除这个div
						flag--;
					}else{//当弹幕到达最左边时，弹幕内容再次随机，同时，将这个块加入到预选块中，并在预选块中随机再选一个，颜色也再次随机，这样就保持块的数量不变。
						newarr[i]=600;
						//console.log(parseInt(arr[i].style.top))
						//console.log(arr[i].style.top/20)
						arr[i].innerHTML=words[random(0,words.length-1)];
						num.splice(num.length,0,parseInt(arr[i].style.top)/20);
						
						
						var t= random(0,num.length);
						arr[i].style.top=num[t]*20+"px";
						Delete(num[t]);
						//console.log(num)
						//console.log(node.style.top);
						arr[i].style.left="456px";
						arr[i].style.color="#"+randomColor();
					}
				}
            }
		}
 
		q("submit").onclick=function(){//输入款发送弹幕
			create($("text").value);
			current[current.length]=q("text").value;
			console.log(current)
			q("text").value="";
		}
		//console.log(num)
		function Delete(m){//从预选块中删除已被选择的块
			for(var i = 0;i < num.length;i++){
				if(num[i] == m){
					//console.log(m)
					num.splice(i,1);
				}
			}
		}
 
		function currentTest(m){
			var fl=false;
			for(var i = 0;i < current.length;i++){
				if(current[i] == m){
					//console.log(m)
					current.splice(i,1);
					fl=true;
				}
			}
			return fl;
		}
 
		function randomColor(){//随机颜色
			var color=Math.ceil(Math.random()*16777215).toString(16);
 
			while(color.length < 6){
				color = "0" + color;
			}
			return color;
		}
 
		function random(m,n){//随机在m、n之间的整数
			return Math.round(Math.random()*(n - m)) + m;
		}
	</script>
 </body>
</html>