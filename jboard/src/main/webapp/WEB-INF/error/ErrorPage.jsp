<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int statusCode = Integer.parseInt((String) request.getAttribute("statusCode"));
	String message = (String) request.getAttribute("statusCodeMessage");
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h3><%= statusCode %> - <%= message %></h3>		
		<a href="/jboard/user/login.do">돌아가기</a>
	</body>
</html>