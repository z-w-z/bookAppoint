<%@page contentType="text/html; charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
	"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
<title>预约图书列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
table thead th{
border:2px solid #346A98;
}
table td{  
border:2px solid #346A98;  
}
</style>
</head>
<body>
<div style="text-align:right; color:#F2050D;">
		当前用户: ${stuId } &nbsp;&nbsp;
		<a href="${pageContext.request.contextPath }/books/listBooks.action" style="color:#0A89DB;">返回主页</a>&nbsp;&nbsp;
		<a href="${pageContext.request.contextPath }/stu/logout.action" style="color:#0A89DB;"><b>退出系统</b></a>&nbsp;&nbsp;
</div>
<div style="width=100$; height:60px; background-color:silver; text-align:center; line-height: 60px; font-size:24px;"> 
     已预约图书列表
</div><br/>
<center>
<table class="table table-hover">
    <thead>
    <tr>
        <th>图书ID</th> 
        <th>图书名称</th>
        <th>图书简介</th>
        <th>预约时间</th>
        <th>图书详情</th>  
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${appointsList }" var="appoint">
     <tr>      
         <td>${appoint.bookId }</td>
         <td>${appoint.book.bookName }</td>
         <td>${appoint.book.introd }</td>
         <td><fmt:formatDate value="${appoint.appointTime }" pattern="yyyy-MM-dd HH:mm"/></td>
         <td><a href="${pageContext.request.contextPath }/books/bookDetails.action?bookId=${appoint.bookId }">详情</a></td>
         <td><a href="#" name="${appoint.bookId }">取消预约</a></td>
     </tr>
	</c:forEach>
    </tbody>
</table> 
</center>
</body>
<script type="text/javascript">
	$("tr a[href='#']").click(function(){
		if('${stuId}'.length==0){
			alert("提示: 登陆后方可执行此操作!"); 
			return false;
		}
		var $this=$(this);
		$.ajax({
			type:'post',
			url:'${pageContext.request.contextPath }/appoint/cancelAppoint',
			data:'bookId='+$(this).attr('name')+'&stuId='+'${stuId}',
			success:function(data){	
				window.alert(data);
				if(data.substring(0,6)=='成功取消预约'){
					$this.parent().parent().remove();
				}				
			}
		});
		return false;
	});
</script>
</html>