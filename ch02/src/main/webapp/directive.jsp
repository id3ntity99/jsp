<%@page import="java.awt.Checkbox"%>
<%@page import="sub1.Account"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" info="dev by id3ntity99"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Directive</title>
	<%--
		날짜: 2025/02/03
		이름: 이현민
		내용: JSP 반복문
	 --%>
</head>
<body>
	<h3>4. 지시자</h3>	
	
	<h4>page 지시자</h4>
	<%
		Account kim = new Account("국민은행", "110-11-1001", "김유신", 10000);
		Account lee = new Account("우리은행", "110-11-2001", "이순신", 30000);
		
		kim.deposit(35000);
		kim.withdraw(7000);
		kim.print(out); //JSP internal object 'out'
		
		lee.deposit(40000);
		lee.withdraw(8000);
		lee.print(out);
		
		// page 지시자 info 속성값 참조
		String info = getServletInfo();
	%>
	
	<p>info:<%= info %></p>
	
	<h4>include 지시자</h4>
	<%@ include file="./inc/_header.jsp" %>
	<%@ include file="./inc/_footer.jsp" %>
		
	<h4>tablib 지시자</h4>
	
	<p>JSTL에서 실습</p>
</body>
</html>