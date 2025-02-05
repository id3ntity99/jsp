<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//Receiving cookie
	Cookie[] cookies = request.getCookies();
	String userName = null;
	for (Cookie cookie : cookies) {
	  String name = cookie.getName();
	  if(name.equals("username")) {
		userName = cookie.getValue();    
	  }
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login Succeed</title>
</head>
<body>
	<h1>Login Successfully!</h1>	
	<h3>Welcome back, <%= userName %>!</h3>
	
	<a href="./logout.jsp">Log out</a>
</body>
</html>