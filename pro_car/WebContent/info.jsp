<%@page import="car.dao.LoginDAO"%>
<%@page import="car.dto.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
<%

	MemberVO mem = (MemberVO)(request.getSession().getAttribute("loginMember"));
	
	 String id = mem.getId();
	System.out.println(id);
	/*  LoginDAO dao = LoginDAO.getInstance(); */
/* 	 MemberVO mem = dao.getUserInfo(id);*/	
	System.out.println(mem);
	/*  session.setAttribute("vo", mem); */
/* 	 session.getAttribute("mem");
 */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>info</title>
<style>

table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    padding: 8px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

tr:hover{background-color:#f5f5f5}

</style>
</head>
<body>
		<h3>개인 회원 정보 보기</h3>
	<br>
	
	<form action="logSc" method="post">
		
		<table border="1" cellspacing="1" width="60%">
			<tr>
				<td width=30%>사용자 아이디</td>
				<td width=70%>
					<%=id %>
				</td>
			</tr>
			<tr>
				<td width="30%">비밀번호</td> 
				<td width=70%>
					 <%=mem.getPassword() %>
				</td>
			</tr>
			<tr>
				<td width="30%">이름</td>
				<td width=70%>
					 <%=mem.getName() %>
				</td>
			</tr>
			<tr>
				<td width="30%">이메일</td>
				<td width=70%>
					<%=mem.getEmail() %>
				</td>
			</tr>
			<tr>
				<td width="30%">집 주소</td>
				<td width=70%>
					<%=mem.getAddr() %>
				</td>
			</tr>
			<tr>
				<td width="30%">전화번호</td>
				<td width=70%>
					<%=mem.getPhone() %>
				</td>
			</tr>
		</table>
		<br> <br> 
		<input type="button" value="수정하기" Onclick="location.href='update.jsp'">
		<%-- <input type="hidden" value="<%=mem.getId() %>" name="id"> --%>
		<input type="button" value="메인으로" Onclick="location.href='loginView.jsp'">
		
	</form>

</body>
</html>