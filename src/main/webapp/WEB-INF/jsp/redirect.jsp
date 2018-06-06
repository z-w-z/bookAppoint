<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
<title>转向页面</title>
<style type="text/css">
div{
background-color: #CEE0E0;
margin:100px auto;
height:70px;
width:600px;
}
</style>
</head>
<body style="text-align:center;">
<div>
<span style="color:red;font-size:20px;"><b>${message }</b></span> 
<hr/>
系统<span id="num">3</span>秒后为您跳转至登录页面
</div>
</body>
<script type="text/javascript">
function desNum(){
	var myspan=document.getElementById('num');
	var num=parseInt(myspan.innerText);
	if(num==1){
		window.location.href="login.action";
	}
	myspan.innerText=num-1+'';		
}
setInterval("desNum()",1000);
</script>
</html>