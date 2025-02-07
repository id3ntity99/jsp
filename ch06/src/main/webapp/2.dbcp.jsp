<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>2. DBCP</title>
		<!-- 
			날짜: 2025/02/07
			이름: 이현민
			내용: JSP 데이터베이스 커넥션 풀
			
			- Insert below fragment /Servers/context.xml 
			<Resource 
				name="jdbc/shop" 
				auth="Container" 
				type="javax.sql.DataSource" 
				driverClassName="com.mysql.cj.jdbc.Driver" 
				url="jdbc:mysql://127.0.0.1:3306/shop" 
				username="root" 
				password="1234"
				maxTotal="13"
				maxIdle="13"
				maxWaitMillis="3000"
			/>
			This fragment tells Tomcat that use connection pool 
		 -->
	</head>
	<body>
		<h3>2. DBCP</h3>
		<h4>Shop</h4>
		<a href="./shop">Shopping Mall</a> <!-- URI for index.jsp is omitted -->
	</body>
</html>