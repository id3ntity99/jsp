<%@page import="entity.User"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%
	User user = (User) session.getAttribute("username");
	if (user == null) {
	  response.sendRedirect("../session.jsp?code=102");
	  return;
	}
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h1>Login Succeed!</h1>	
		<h3>
			Welcome back, <%= user.getName() %>!
		</h3>
		<a href="./logout.jsp">Log out</a>
	</body>
</html>