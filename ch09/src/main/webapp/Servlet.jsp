<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>1. Servlet</title>
		<!-- 
			날짜: 2025/02/12
			이름: 이현민
			내용: Java Servlet 	
			
			# Servlet Life Cycle: Container loads Servlet class -> Container calls init() method 
			  -> Container calls doGet()/doPost() methods when the request has arrived 
			  -> Container calls destroy() method. 
			
			# Writing HTML codes with Servlet is uncomfortable. That's why JSP comes in.
			
			# Servlet's URL Routing mechanism is either using web.xml or @WebServlet annotation.
			
			
		 -->
	</head>
	<body>
			<h3>1. Servlet</h3>	
			<a href="/ch09/hello.do">Hello</a>
			<a href="/ch09/welcome.do">Welcome</a>
			<a href="/ch09/greeting.do">Greeting</a>
			<form action="/ch09/hello.do" method="POST">
				<input type="submit" value="submit"/>
			</form>
			
	</body>
</html>