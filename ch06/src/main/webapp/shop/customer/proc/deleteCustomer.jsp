<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String custId = request.getParameter("custId");
	String sql = "DELETE FROM `customer` WHERE `custId`=?;";
	
	try {
	  Context ctx = (Context) new InitialContext().lookup("java:comp/env");
	  DataSource ds = (DataSource) ctx.lookup("jdbc/shop");
	  Connection conn = ds.getConnection();
	  PreparedStatement psmt = conn.prepareStatement(sql);
	 	
	  psmt.setString(1, custId);
	  psmt.executeUpdate();
	  
	  conn.close();
	  psmt.close();
	} catch (Exception e) {
	  e.printStackTrace();
	}
	
	response.sendRedirect("/ch06/shop/customer/list.jsp");
%>