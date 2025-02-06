<%@page import="java.security.interfaces.RSAKey"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ch06.UserVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
String host ="jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "root";
	String pass = "1234";
	String sql = "SELECT * FROM `user1`;";
  	List<UserVO> users = new ArrayList<>();
	try {
	  Class.forName("com.mysql.cj.jdbc.Driver");
	  Connection conn = DriverManager.getConnection(host, user, pass);
	  Statement stmt = conn.createStatement();
	  
	  ResultSet res = stmt.executeQuery(sql);
	  while(res.next()) {
	    UserVO vo = new UserVO();
	    vo.setUid(res.getString(1));
	    vo.setName(res.getString(2));
	    vo.setHp(res.getString(3));
	    vo.setAge(res.getInt(4));
	    
	    users.add(vo);
	  }
	  
	  res.close();
	  stmt.close();
	  conn.close();
	} catch (Exception e) {
	  e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>user1::list</title>
</head>
<body>
	<h3>user1 목록</h3>	
	<a href="../1.jdbc.jsp">처음으로</a>
	<a href="./register.jsp">등록하기</a>
	
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>휴대폰</th>
			<th>나이</th>
			<th>관리</th>
		</tr>
			<% for (UserVO u : users) { %>
		<tr>
			<% 
				  	out.print("<td>");
					out.print(u.getUid());	  
				  	out.print("</td>");
				  	out.print("<td>");
					out.print(u.getName());	  
				  	out.print("</td>");
				  	out.print("<td>");
					out.print(u.getHp());	  
				  	out.print("</td>");
				  	out.print("<td>");
					out.print(u.getAge());	  
				  	out.print("</td>");
		  	%>
			<td>
				<a href="./modify.jsp">수정</a>
				<a href="#">삭제</a>
			</td>
			<%
				}
			%>
			<tr>
				<td>a101</td>
				<td>홍길동</td>
				<td>010-2121-0101</td>
				<td>21</td>
				<td>
					<a href="./modify.jsp">수정</a>
					<a href="#">삭제</a>
				</td>
			<tr>
		</tr>
	</table>	
</body>
</html>