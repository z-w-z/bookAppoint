<%@page contentType="text/html; charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
	"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
<title>图书详情页</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="../resources/js/jquery.js"></script>
<style type="text/css">

table{
border-collapse: collapse;  
width:60%;
text-align:center;  
margin-top:5px; 
}
table td{  
border:2px solid #AFAFAF;  
} 
</style>
</head>
<body>
<div style="text-align:right; color:red;">    
<c:choose>
	<c:when test="${stuId!=null }">
		当前用户: ${stuId } &nbsp;&nbsp;
		<a href="${pageContext.request.contextPath }/appoint/stuAppoint.action?stuId=${stuId }">查看我的预约</a>&nbsp;&nbsp;
		<a href="${pageContext.request.contextPath }/stu/logout.action" style="color:#0A89DB;"><b>退出系统</b></a>
	</c:when>
	<c:otherwise> 
		<a href="${pageContext.request.contextPath }/stu/login.action" style="color:#0A89DB;"><b>登入系统</b></a>&nbsp;&nbsp; 
	</c:otherwise>
</c:choose>
</div>
<div style="width=100$; height:70px; background-color:silver; text-align:center; line-height: 70px; font-size:24px;"> 
图书详细
</div><hr/>
<center>
<table>
<tr><td width=300px;>图书ID</td><td width=600px>${book.bookId }</td></tr>
<tr><td>图书名称</td><td>${book.bookName }</td></tr>
<tr><td>馆藏数量</td><td id="bookNum">${book.number }</td></tr>
<tr><td>图书作者</td><td>${book.author }</td></tr>
<tr><td>价格</td><td>${book.price }</td></tr>
<tr><td>简介</td><td>${book.introd }</td></tr>
<tr><td>图书封面</td><td>
	<img src="../resources/pic/${book.pic }" height=150px alt="无图片" />
</td></tr>
</table>
<hr/>
<input type="button" id="appoint" value="预约此书" />&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" id="listBooks" value="返回主页" />
</center>
</body>
<script type="text/javascript">
$("input#appoint").click(function(){
	if('${stuId}'.length==0){
		alert("提示: 登陆系统后方可预约!");
		return false;
	}
	$.ajax({
		type:'post',
		url:'${pageContext.request.contextPath }/appoint/bookAppoint',
		data:'bookId=${book.bookId }&stuId='+'${stuId}',
		success:function(data){	
			window.alert(data);
			if(data.substring(0,6)=='恭喜预约成功'){
				var num=parseInt($('#bookNum').text())-1;				
				$('#bookNum').text(''+num); 
			}				
		}
	})
});
$('#listBooks').click(function(){
	window.open("listBooks.action","_self");
})
</script>
</html>