<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>2. include tag</title>
	<!-- 
		날짜: 2025/02/05
		이름: 이현민
		내용: JSP 액션태그
	 -->
</head>
<body>
	<h3>2. include action tag</h3>	
	
	<!-- The included JSP using include directive are inserted statically, 
	that is, at a compilation time. -->
	<h4>2.1 include directive</h4>
	<%@ include file="./inc/_header.jsp" %>
	<%@ include file="./inc/_footer.jsp" %>
	
	<!-- On the other hand, using both include method and include action tag,
	a JSP is inserted at a runtime -->
	<h4>2.2 include method</h4>
	<%
		pageContext.include("./inc/_header.jsp");
		pageContext.include("./inc/_footer.jsp");
		    
	%>	
	
	<h4>2.3 include action tag</h4>
	<jsp:include page="./inc/_header.jsp"></jsp:include>
	<jsp:include page="./inc/_footer.jsp"></jsp:include>
</body>
</html>