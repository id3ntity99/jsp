<%@page import="java.util.List"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String uid = request.getParameter("uid");

	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String dbUser = "root";
	String pass = "1234";
	
	String sql = "DELETE FROM `user2` WHERE `uid`=?;";
	
	try {
	  Class.forName("com.mysql.cj.jdbc.Driver");
	} catch(ClassNotFoundException e) {
	  e.printStackTrace();
	}
	
	try (Connection conn = DriverManager.getConnection(host, dbUser, pass);
	    PreparedStatement psmt = conn.prepareStatement(sql)) {
	  psmt.setString(1, uid);
	  psmt.executeUpdate();
	} catch (Exception e) {
	  e.printStackTrace();
	}
	
	response.sendRedirect("./list.jsp");
%>