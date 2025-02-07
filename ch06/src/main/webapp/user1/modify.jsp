<%@page import="java.sql.ResultSet"%>
<%@page import="ch06.User1VO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
String uid = request.getParameter("uid");

	String host ="jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "root";
	String pass = "1234";
	User1VO targetUser = new User1VO();
	
	try {
	String update  = "UPDATE `user1` SET `name`=?, `hp`=?, `age`=? WHERE `uid`=?;";
	String select  = "SELECT * FROM `user1` WHERE `uid`=?;";
	 Class.forName("com.mysql.cj.jdbc.Driver");
	 Connection conn = DriverManager.getConnection(host, user, pass);
	 PreparedStatement psmt = conn.prepareStatement(select);
	 psmt.setString(1, uid);
	 
	 ResultSet res = psmt.executeQuery();
	 
	 if (res.next()) {
	   targetUser.setUid(res.getString(1));
	   targetUser.setName(res.getString(2));
	   targetUser.setHp(res.getString(3));
	   targetUser.setAge(res.getInt(4));
	 }
	} catch (Exception e) {
	  e.printStackTrace();
	}
	
	response.sendRedirect("./list.jsp");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>user1::modify</title>
</head>
<body>
	<h3>user1 수정</h3>	
	<a href="../1.jdbc.jsp">처음으로</a>
	<a href="./list.jsp">목록이동</a>
	
	<form action="../proc/modifyUser.jsp" method="POST">
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
			<td>휴대폰</td>
			<td>
				<input type="text" value=<%= targetUser.getHp()%> name="hp" placeholder="휴대폰 입력">
			</td>
		</tr>
		<tr>
			<td>나이</td>
			<td>
				<input type="number" value=<%= targetUser.getAge()%> name="age" placeholder="나이 입력">
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