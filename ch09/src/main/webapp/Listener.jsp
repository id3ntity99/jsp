<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	String username = (String) session.getAttribute("username");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>3. Listener</title>
	</head>
	<body>
		<h3>3. Listener</h3>	
		
		<%
			if(username == null) {
		%>
		<h4>Log in</h4>
		<form action="/ch09/login.do" method="POST">
			<input type="text" name="uid" /> <br />
			<input type="password" name="pass" /> <br />
			<input type="submit" value="Log in" />
		</form>
		<%} else { %>
		<h3>Welcome back "<%= username %>"!</h3>
		<a href="/ch09/logout.do">Log out</a>
		<%} %>
	</body>
</html>