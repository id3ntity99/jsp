<%@page import="java.util.ArrayList"%>
<%@page import="ch06.User2VO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String dbUser = "root";
	String pass = "1234";
	List<User2VO> users = new ArrayList<>();
	
	try {
	  Class.forName("com.mysql.cj.jdbc.Driver");
	} catch (ClassNotFoundException e) {
	  e.printStackTrace();
	}
	
	try (Connection conn = DriverManager.getConnection(host, dbUser, pass);
	    	Statement stmt = conn.createStatement()) {
	  String query = "SELECT * FROM `user2`;";
	  ResultSet res = stmt.executeQuery(query);
	  
	  while(res.next()) {
		User2VO user = new User2VO();  	  
		user.setUid(res.getString(1));
		user.setName(res.getString(2));
		user.setBirth(res.getString(3));
		user.setAddr(res.getString(4));
		users.add(user);
	  }
	  
	  res.close();
	} catch (Exception e) {
	  e.printStackTrace();
	}
	  
%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>User2 List</title>
	</head>
	<body>
	<h3>user2 목록</h3>	
	<a href="../1.jdbc.jsp">처음으로</a>
	<a href="./register.jsp">등록하기</a>
	
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>생년월일</th>
			<th>주소</th>
			<th>관리</th>
		</tr>
			<% for (User2VO u: users) { %>
		<tr>
			<% 
				  	out.print("<td>");
					out.print(u.getUid());	  
				  	out.print("</td>");
				  	out.print("<td>");
					out.print(u.getName());	  
				  	out.print("</td>");
				  	out.print("<td>");
					out.print(u.getBirth());	  
				  	out.print("</td>");
				  	out.print("<td>");
					out.print(u.getAddr());	  
				  	out.print("</td>");
		  	%>
			<td>
				<a href="./modify.jsp?uid=<%=u.getUid()%>">수정</a>
				<a href="./deleteUser2.jsp?uid=<%=u.getUid()%>">삭제</a>
			</td>
			<%
				}
			%>
		</tr>
	</table>	
	</body>
</html>