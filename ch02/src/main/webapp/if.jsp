<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>if</title>
	<%--
		날짜: 2025/02/03
		이름: 이현민
		내용: JSP 조건문
	 --%>
</head>
<body>
	<h3>3. if</h3>	
	<h4>if</h4>
	<%
		int num1 = 1;
	int num2 = 2;
	int num3 = 3;
	int num4 = 4;
	
	if (num1 > 0 ) {
	  out.println("<p>num1 is greater than 0</p>");
	}
	
	if (num2 > num1) {
	%>	
	<p>num2 is greater than num1</p>	
	<%
	}
	%>
	
	<h4>if ~ else</h4>
	<%
		int var1 = 1, var2 = 2;
	if (var1 > var2) {
	%>
	<p>var1 is greater than var2</p>
	<%
	} 
	%>

	<h4>if~else if~else</h4>
	<% int n1 = 1, n2 = 2, n3 = 3, n4 = 4;%>
	<%if (n1 > n2) { %>
	<p>n1 is greater than n2</p>
	<% } else if(n2 > n3) { %>
	<p>n2 is greater than n3</p>
	<% } else if (n3 > n4) {%>
	<p>n3 is greater than n4</p>
	<% } else { %>
	<p>n4 is the greatest</p>
	<% } %>
</body>
</html>