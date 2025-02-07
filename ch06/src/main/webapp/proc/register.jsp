<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String uid = request.getParameter("uid");	
	String name = request.getParameter("name");	
	String hp = request.getParameter("hp");	
	String age = request.getParameter("age");	
	
	Context	ctx = (Context) new InitialContext().lookup("java:comp/env"); 
	DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
	Connection conn = ds.getConnection();


	
	try {
		String sql = "INSERT INTO `user1` VALUE (?,?,?,?);";
		PreparedStatement psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, uid);
		psmt.setString(2, name);
		psmt.setString(3, hp);
		psmt.setString(4, age);
		
		psmt.executeUpdate();
		
		conn.close();
		psmt.close();
	} catch (SQLException e) {
	  e.printStackTrace();
	} 
	
	response.sendRedirect("../user1/list.jsp");
%>