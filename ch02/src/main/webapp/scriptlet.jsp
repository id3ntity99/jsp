<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Scriptlet</title>
	<%--JSP comment syntax
		날짜: 2025/02/03
		이름: 이현민
		내용: 2장 JSP 기본문법
	 --%>
</head>

<body>
	<h3>1. 스크립트 요소</h3>	
	<h4>스크립트릿(Scriptlet)</h4>
	<%
		// Use Java code here.
		String greeting = "Hello, world!";
		out.println("<p>Greeting from java code: " + greeting + "</p>");
	%>
	
	<h4>표현식(Expression)</h4>
	<p>Using expression: <%= greeting %></p>
</body>

</html>