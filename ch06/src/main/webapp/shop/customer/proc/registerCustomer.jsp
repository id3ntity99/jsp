<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String custId = request.getParameter("custId");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String addr = request.getParameter("addr");
	try {
	  Context ctx = (Context) new InitialContext().lookup("java:comp/env");
	  DataSource ds = (DataSource) ctx.lookup("jdbc/shop");
	  Connection conn = ds.getConnection();
	  
	  String sql = "INSERT INTO `customer` VALUES (?, ?, ?, ?, NOW());";
	  PreparedStatement psmt = conn.prepareStatement(sql);
	  psmt.setString(1, custId);
	  psmt.setString(2, name);
	  psmt.setString(3, hp);
	  psmt.setString(4, addr);
	  psmt.executeUpdate();
	  
	  conn.close();
	  psmt.close();
	  
	} catch (Exception e) {
		e.printStackTrace();  
	}
	
	response.sendRedirect("/ch06/shop/customer/list.jsp");
%>