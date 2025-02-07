<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ch06.User1VO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
  	List<User1VO> users = new ArrayList<>();
	try {
	  //Creating JDNI service object
	  Context initCtx = new InitialContext();
	  Context ctx = (Context) initCtx.lookup("java:comp/env"); // JNDI
	  
	  DataSource ds = (DataSource) ctx.lookup("jdbc/studydb"); // Getting resource data from web.xml
	  Connection conn = ds.getConnection();

	  Statement stmt = conn.createStatement();
	  
	  String sql = "SELECT * FROM `user1`;";
	  ResultSet res = stmt.executeQuery(sql);
	  while(res.next()) {
	    User1VO vo = new User1VO();
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
			<%
			for (User1VO u : users) {
			%>
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
				<a href="./modify.jsp?uid=<%=u.getUid()%>">수정</a>
				<a href="../proc/delete.jsp?uid=<%=u.getUid()%>">삭제</a>
			</td>
			<%
				}
			%>
		</tr>
	</table>	
</body>
</html>