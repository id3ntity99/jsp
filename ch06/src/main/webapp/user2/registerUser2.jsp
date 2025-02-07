<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String uid = request.getParameter("uid");	
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String addr = request.getParameter("addr");
	
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String dbUser = "root";
	String pass = "1234";
	
	String sql = "INSERT INTO `user2` VALUES (?,?,?,?);";

	try (Connection conn = DriverManager.getConnection(host, dbUser, pass);
	     PreparedStatement psmt = conn.prepareStatement(sql)) {
	 	Class.forName("com.mysql.cj.jdbc.Driver"); 
	 	psmt.setString(1, uid);
	 	psmt.setString(2, name);
	 	psmt.setString(3, birth);
	 	psmt.setString(4, addr);
	 	psmt.executeUpdate();
	} catch(Exception e) {
	 	e.printStackTrace();
	}
	
	response.sendRedirect("./list.jsp");
%>