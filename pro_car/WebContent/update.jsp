<%@page import="car.dto.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">




</style>
</head>
<body>
		<%
  		 MemberVO mem = (MemberVO)session.getAttribute("mem");
		%>
<br>
	<h3>���� ���� �����ϱ�</h3>
		<br>
		<form action="logSc" method="post">
			  <table border="1" cellspacing="1" width="60%">
				  <tr>
					<td width=30%>����� ���̵�</td>
					<td width=70%><%=mem.getId()%></td>
				  </tr>
				  <tr>
					<td width="30%">�̸�</td>
					<td width="70%">${mem.name }</td>
				  </tr>
				  <tr>
					<td width="30%">��й�ȣ ����</td>
					<td width="70%"><input type="password" name="password"
					value="<%=mem.getPassword()%>"></td>
				  </tr>			  
				  <tr>
					<td width="30%">�̸��� �ּ�</td>
					<td width="70%">${mem.email }</td>	  
				  <tr>				  
			</table>  
			<input type="hidden" value="update"  name="command">
			<input type="submit" value="����" ><br>
			
		</form>
		

</body>
</html>