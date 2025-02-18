<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// Check for a request that was forwarded by HelloController
	System.out.printf("hello.jsp received a request[HashCode=%d] forwareded from HelloController. [SessionID = %s]", 
	    request.hashCode(), 
	    request.getSession().getId());
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Hello</title>
	</head>
	<body>
		<h3>Hello</h3>	
		<a href="/ch10">index</a>
		<a href="/ch10/hello.do">Hello</a>
		<a href="/ch10/welcome.do">Welcome</a>
		<a href="/ch10/greeting.do">Greeting</a>
	</body>
</html>