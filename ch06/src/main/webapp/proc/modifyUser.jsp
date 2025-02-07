<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String uid = request.getParameter("uid");
	String userName = request.getParameter("name");
	String hp = request.getParameter("hp");
	String age = request.getParameter("age");
	
	Context ctx = (Context) new InitialContext().lookup("java:comp/env");
	DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
	Connection conn = ds.getConnection();
	
	try {
	  	String sql = "UPDATE `user1` SET `name`=?, `hp`=?, `age`=? WHERE `uid`=?";
	 	PreparedStatement psmt = conn.prepareStatement(sql);
	 	psmt.setString(1, userName);
	 	psmt.setString(2, hp);
	 	psmt.setString(3, age);
	 	psmt.setString(4, uid);
	 	psmt.executeUpdate();
	 	
	 	conn.close();
	 	psmt.close();
	 	
	} catch(Exception e) {
	  e.printStackTrace();
	}
	
	response.sendRedirect("../user1/list.jsp");
%>