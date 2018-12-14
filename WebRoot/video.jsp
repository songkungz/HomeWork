<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="natural_live">
  <meta name="Keywords" content="barrage">
  <meta name="Description" content="">
  <title>弹幕</title>
  <style>
	*{margin:0;padding:0;}
 
	#barrage{
		margin:auto;
		margin-top:50px;
		position:relative;
		width:100%;
		height:100%;
		
	}
 
	#barrage div{
		width:100%;
		height:20px;
		line-height:20px;
		position:absolute;
	}
 
	#btn{
		margin:auto;
		margin-top:0px;
		height:50px;
		width:600px;
		margin-left: 19%;
	}
	#text{
		font-size:20px;
		height:30px;
		width: 456px;
		border-radius:4px;
		border:1px solid #c8cccf;
		color:#6a6f77;
	}
	#submit{
		padding:7px;
		font-size:14px;
		height:30px;
		border-radius:4px;
		border:1px solid #c8cccf;
	}
  </style>
  <style type="text/css">
.article-container{
    background-color: #ffffff;
    padding-top:20px;
    width:1024px;
    margin:20px auto;
  }
  
  .article_r{
    padding-top:10px;
    float:right;
  }
  .pulisher,.time,.article_view,.article_comments,.article_del{
    clear:both;
    margin-right:25px;
    font-size: 15px;
  }
  .title{
    font-weight:bold;
    font-size: 30px;
    text-align: center;
  }
  .article_content{
    background: #ffffff;
    clear:both;
    padding:1em 4em;
    margin-top: 40px;
  }
  p{
    text-indent: 2em;
    text-overflow: hidden;
    font-size:18px;
  }
  
  /*话题内容图片*/
  .ImgContent{  
    width:350px;
    margin:0px auto;  
    padding: 5px;  
    overflow:hidden;  
    
}  
 
.NavLinks{  
    padding:5px;  
    width:100px;
    height: 100px;
    float: left;  
    overflow: hidden;     
} 
 
.NavLinks img{  
    width: 100%;  
    height: 100%;  
}   
.hitShowPic {
width:350px;
clear:both;
margin-left:430px;
}
.hitShowPic span {
  font-size: 15px;
  text-align: center;
}
    /*以下评论的css*/
   .show_reply_list {
    margin-right:1em;
     color: grey;
   }
    .comment_list {
    background-color: #ffffff;
    padding-top:5px;
    width:900px;
    margin:0 auto;
  }
    .comment {
      width:900px;
      margin-top:10px;
    }
    .comment_details {
      float:right;
    }
    .comment_content {
      clear:both;
      margin:5px 50px;
      font-size:16px;
    }
  .comment_add_or_last {
    
    margin:0 auto;
    clear: both;
    width:600px;
    height:50px;
    background: #F0F0F0;
    text-align: center;
    font-size:20px;
     line-height: 40px;   
     margin-bottom: 40px;
  }
  .imgdiv{
       width:80px;
       height:70px;
      float:left;
 
  }
  .imgcss {
    width:60px;
    height:60px;
    border-radius: 50%;
  }
  .comment_name { 
    margin-left:10px;
    color:#3D9EEA;
    font-size:16px;
    font-weight: bolder;
  }
  .layui-icon {
    font-size: 13px; 
    color: grey;
  }
  .del {
    float:right;
  
  }
  .del_comment {
     margin-right:50px;
  }
 
 
 
  .reply_list {
    clear:both;
    display:none;
    width:900px;
  
    padding-right:15px;
    margin-top:10px;
      font-size:16px;
    
  }
  .reply {
    clear:both;
    width:700px;
    margin:4px auto;
   
  }
  .reply_name {
    color:#3D9EEA;
  }
  .del_reply {
      float:right;
  }
  .show_remain_reply {
     width:600px;
     height:40px;
     text-align:center;font-size:18px; 
     background-color: #F0F0F0;
     margin:0 auto;
     line-height: 40px;
     display:none;
  }
</style>
<style>
        .Dplayer_box{overflow:hidden;width:980px;height:456px;margin:100px auto;margin-bottom: 10px ;display:block;border-top:1px solid #e5e9ef;border-bottom:1px solid #e5e9ef;background-color:#f6f9fa}#barrage{background-size:100% 100%;margin-top:30px}.player_av{width:680px;height:100%;float:left;background:#000}.Dplayer_danmu{width:299px;float:right;height:100%}.Dplayer_watching{width:100%;height:60px;line-height:60px;display:inline-block;font-size:12px;color:#99a2aa;box-shadow:#ddd 0 0 5px}.Dplayer-watching-number{margin-left:20px;font-size:18px;font-weight:700;color:#222;padding:0}.Dplayer_list{width:100%;height:30px;overflow:hidden}.Dplayer_list li{margin-left: 50px; width:60px;height:30px;float:left;color:#99a2aa;font-size:12px;text-align:center;line-height:30px}.Dplayer_list li:nth-child(1){width:58px!important}.Dplayer_list li:nth-child(2){width:136px!important}.list_ovefiow{width:100%;height:363px;overflow:auto}.danmuku_list{width:100%;height:20px;line-height:20px;text-align:left;color:#99a2aa;font-size:12px;display:block;margin:auto;overflow:auto;margin-top:5px}.danmuku_list li{float:left;width:60px;height:20px;white-space:nowrap;cursor:pointer}.danmuku_list li:nth-child(1){width:58px;margin-left:8px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap}.danmuku_list li:nth-child(2){width:125px;margin-right:15px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap}.danmuku_list li:nth-child(2):hover{color:#00a1d6}.danmuku_list li:nth-child(3){margin-left:5px}
    </style>
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
            <li>课程内容</li>
            
        </ul>
        <ul class="list_ovefiow">

        </ul>

    </div>
    </div>
<div id="btn">
		<input type="text" id="text"></input>
		<input type="button" id="submit" value="发送"></input>
	</div>
    
</div>





	
	


	
      <div class="comment_list">
        <h3 style="text-indent: 2em;">评论列表</h3>
      <hr>
          <div class="comment">
             <div class="imgdiv">
                <img class="imgcss"  src="./images/user.jpg"/>
             </div>
             <div class="conmment_details">
                <div style="float:left;">
                  <span class="comment_name">大白 </span>     <span>22分钟前</span>
                  
                </div>
                <div class="del">
                  <span  class="show_reply_list">查看回复</span>
                  
                </div>
                 <div class="comment_content" >  感觉林丹越来越帅了，好棒感觉林丹越来越帅了，好棒感觉林丹越来越帅了，好棒感觉林丹越来越帅了，好棒感觉林丹越来越帅了，好棒
                </div>
            </div>


	<script>
		var timer=null;
		var current=[];//存储当前输入框的内容
		var newarr=[];//存储每个弹幕距左边框的距离
		var flag=0;//标志量
		var num=new Array();//数组，用来存储划分每个块的序号
		//var t=12;
		var words = ["富强","民主","文明","和谐","自由","平等","公正","法治","爱国","敬业","诚信","友善"];
		function $(id){
			return document.getElementById(id);
		}
		for(var i=0;i<$("barrage").offsetHeight/20 - 1;i++){
			num.splice(i,0,i);//将整个显示框划分成多个块，并对每个块进行标号
			//console.log(num)
		}
		//console.log(num)
		//console.log(num.length)
 
		window.onload = function(){//加载页面发生的事件
 
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
				$("barrage").appendChild(node);//插入子节点
				flag++;//创建了一个新弹幕时，更新为0
				
				//console.log(node.offsetLeft)
		}
 
		function move(){
			var arr=$("barrage").getElementsByTagName("div");//获取所有的弹幕
            for(var i=0;i<arr.length;i++){
                newarr.push(arr[i].offsetLeft);//将每个弹幕距左边边框的距离分别存储在newarr数组中
                arr[i].style.left=newarr[i]+"px";//更新距离
                newarr[i] = newarr[i] - 2;//每次减少2px
                if(newarr[i]<0){
					//console.log(arr[i].innerHTML)
					if(currentTest(arr[i].innerHTML) && flag != 0){//当是从输入框发送的弹幕时而且是第一次时,将内容添加到预备的词库中，并删除这个div元素。这么做是为了将弹幕数量维持在一定数量，防止在输入框发送大量弹幕，导致出现错误。
						//console.log(current)
						words.push(arr[i].innerHTML);
						$("barrage").removeChild(arr[i]);
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
 
		$("submit").onclick=function(){//输入款发送弹幕
			create($("text").value);
			current[current.length]=$("text").value;
			//console.log(current)
			$("text").value="";
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