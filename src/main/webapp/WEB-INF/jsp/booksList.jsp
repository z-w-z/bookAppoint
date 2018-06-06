<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
	"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>图书列表</title>
<script type="text/javascript" src="../resources/js/jquery.js"></script>
<style type="text/css">
body{
background-color: #EEEEEE;
}
table{
border-collapse: collapse;  
width:90%;
text-align:center;  
margin-top:5px; 
} 
table td{  
border:2px solid #346A98;  
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
<h2 style="text-align:center;">图书列表</h2>  
<form action="${pageContext.request.contextPath}/books/searchBooks.action" method="post">
查询条件: <input type="text" style="height:20px;" id="bookName" name="bookName" value="请输入关键字"/>&nbsp;&nbsp;
<input type="submit" id="b1" value="检索"/>
</form>
<hr/>
<center>
<table id="tab1">
<tr>
	<td>图书ID</td>
	<td>图书名称</td>
	<td>馆藏数量</td>
	<td>图书简介</td>
	<td>详情</td>
	<td>预约操作</td>
</tr>
<c:forEach items="${booksList }" var="book">
<tr>
	<td>${book.bookId }</td>
	<td>${book.bookName }</td>
	<td id="bookNum">${book.number }</td>
	<td>${book.introd }</td>	
	<td><a href="${pageContext.request.contextPath }/books/bookDetails.action?bookId=${book.bookId }" >图书详情</a></td>
	<td><a href="#" name="${book.bookId }">预约</a></td>
</tr>
</c:forEach>
</table>
</center>
</body>
<script type="text/javascript">
	$("tr a[href='#']").click(function(){
		if('${stuId}'.length==0){
			alert("提示: 登陆系统后方可预约!");
			return false;
		}
		var $this=$(this);
		$.ajax({
			type:'post',
			url:'${pageContext.request.contextPath }/appoint/bookAppoint',
			data:'bookId='+$(this).attr('name')+'&stuId='+'${stuId}',
			success:function(data){	
				window.alert(data);
				if(data.substring(0,6)=='恭喜预约成功'){
					var $bookNum=$this.parent().siblings('#bookNum');
					var num=parseInt($bookNum.text())-1;				
					$bookNum.text(''+num); 
				}				
			}
		});
		return false;
	});
	$('#bookName').focus(function(){
		if(this.value==this.defaultValue){
			this.value='';
		}
	});
	$('#bookName').blur(function(){
		if(this.value==''){
			this.value=this.defaultValue;
		}
	})
</script>
</html>