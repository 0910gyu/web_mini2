<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String message = (String) request.getAttribute("error");
	%>
	지금 발생된 error는
	<%=message%>입니다
	<br><br><br>
	<a href="index.html">메인으로 가기</a>
</body>
</html>