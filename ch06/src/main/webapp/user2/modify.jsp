<%@page import="java.awt.print.Printable"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="ch06.User2VO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String uid = request.getParameter("uid");
	out.print(uid);

	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String dbUser = "root";
	String pass = "1234";
	
	String query = "SELECT * FROM `user2` WHERE `uid`=?";
	
	User2VO targetUser = new User2VO();
	
	try {
	  Class.forName("com.mysql.cj.jdbc.Driver");
	} catch (ClassNotFoundException e) {
	  e.printStackTrace();
	}
	
	try (Connection conn = DriverManager.getConnection(host, dbUser, pass);
	    PreparedStatement psmt = conn.prepareStatement(query)) {
	  
	  psmt.setString(1, uid);
	  ResultSet res = psmt.executeQuery();
	  
	  if (res.next()) {
	   	targetUser.setUid(res.getString(1));
	   	targetUser.setName(res.getString(2));
	   	targetUser.setBirth(res.getString(3));
	   	targetUser.setAddr(res.getString(4));
	  }
	  
	  res.close();
	} catch (Exception e) {
	  e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>User2 Modify</title>
</head>
<body>
	<h3>user2 수정</h3>	
	<a href="../1.jdbc.jsp">처음으로</a>
	<a href="./list.jsp">목록이동</a>
	
	<form action="./modifyUser2.jsp" method="POST">
		<table border="1">
		<tr>
			<td>아이디</td>
			<td>
				<input type="text" value=<%= targetUser.getUid()%> name="uid" readonly> 
			</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>
				<input type="text" value=<%= targetUser.getName()%> name="name" placeholder="이름 입력">
			</td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td>
				<input type="date" value=<%= targetUser.getBirth()%> name="birth" placeholder="휴대폰 입력">
			</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>
				<input type="text" value=<%= targetUser.getAddr()%> name="addr" placeholder="나이 입력">
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="수정">
			</td>
		</tr>
		</table>
	</form>
</body>
</html>