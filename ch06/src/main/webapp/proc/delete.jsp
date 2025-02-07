<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "root";
	String pass = "1234";
	
	String uid = request.getParameter("uid");
	
	try {
	  	String sql = "DELETE FROM `user1` WHERE `uid`=?;";
	 	Class.forName("com.mysql.cj.jdbc.Driver"); 
	 	Connection conn = DriverManager.getConnection(host, user, pass);
	 	PreparedStatement psmt = conn.prepareStatement(sql);
	 	psmt.setString(1, uid);
	 	psmt.executeUpdate();
	 	conn.close();
	 	psmt.close();
	} catch(Exception e) {
	  e.printStackTrace();
	}
	
	response.sendRedirect("../user1/list.jsp");
%>