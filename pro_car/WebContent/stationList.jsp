<%@ page language="java" 
contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>극장 검색</title>
<style>
	table#t01 tr:nth-child(even) {
	    background-color: #eee;
	}
	table#t01 tr:nth-child(odd) {
	   background-color:#fff;
	}
	table#t01 th {
	    background-color: black;
	    color: white;
	}
</style>
</head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/w3.css">
<body>
<div class="container" style="width:600px; height:50px; overflow:auto; margin-top:80px;">
<table id="t01" class="table table-hover">
		<tr>
			<th width="28px">ID</th>
			<th width="180px">충전소명</th>
			<th width="300px">주소</th>
			<th width="60px">충전기 개수</th>
		</tr>
</table>
</div>
<div class="container" style="width:600px; height:180px; overflow:auto; ">
	<table id="t01" class="table table-hover">
		<c:forEach items="${staList}" var="data">
			<tr>
				<td width="20px">${data.id}</td>
				<td width="180px">${data.csNm}</td>
				<td width="300px">${data.addr}</td>
				<td width="60px" align="center">${data.cnt}</td>
			</tr>
		</c:forEach>
	</table>
</div>
<p>
<a href="index.html">메인으로 이동</a>
</center>

</body>
</html>
