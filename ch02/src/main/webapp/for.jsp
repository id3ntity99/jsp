<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>For loop</title>
	<%--
		날짜: 2025/02/03
		이름: 이현민
		내용: JSP 반복문
	 --%>
</head>
<body>
	<h3>JSP 반복문</h3>
	<h4>for loop</h4>
	<%
		for (int i = 0; i < 5; i++) {
		 	out.println("<p>i = " + i + "</p>");
		}
	%>
	
	<h4>while loop</h4>
	<% 
	%>
	
	<h4>구구단</h4>
	<table border="1">
		<tr>
		<%
			for (int i = 2; i <= 9; i++) {
				out.println("<th>" + i + "단" + "</th>");
			  for (int j = 1; j <= 9; j++) {
			    String result = i + " x " + j + " = " + i * j;
			    out.print(result);
			  }
			  	out.println();	
			}
		%>
		
		</tr>
	</table>
</body>
</html>