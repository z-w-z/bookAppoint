<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登陆界面</title>
</head>
<body style="text-align:center;">
<script type="text/javascript" src="../resources/js/jquery.js"></script>
<h2 style="margin-top:249px; color:white; ">
欢迎注册个人账号</h2>
<form action="${pageContext.request.contextPath}/stu/regist.action" method="post">
学　号: <input id="i1" type="text" name="stuId"/><br/>
密　码: <input id="i2" type="text" name="password"/><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="提交" onclick="return sub();"/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="reset" value="重置" style="margin-top:5px;" />
	</form>
</body>
<style>
body{
background-image: url(../resources/pic/background01.jpg);
background-size: cover;
}
</style>
<script type="text/javascript">
function sub(){
	if(!$("#i1").val()){
		alert("学号不能为空");
		return false;
	}
	if(!/^[0-9]+$/.test($("#i1").val())){
		alert("学号只能为数字");
		return false;
	}
	if(!$("#i2").val()){
		alert("密码不能为空");
		return false;
	}
	if(!/^[0-9]+$/.test($("#i2").val())){
		alert("密码只能为数字");
		return false;
	}
	return true;
}
</script>
</html>