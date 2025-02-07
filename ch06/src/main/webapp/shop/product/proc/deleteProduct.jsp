<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String prodNo = request.getParameter("prodNo") ;

	try {
	 Context ctx = (Context) new InitialContext().lookup("java:comp/env");
	 DataSource ds = (DataSource) ctx.lookup("jdbc/shop");
	 Connection conn = ds.getConnection();
	 
	 String sql = "DELETE FROM `product` WHERE `prodNo`=?;";
	 PreparedStatement psmt = conn.prepareStatement(sql);
	 
	 psmt.setInt(1, Integer.parseInt(prodNo));
	 
	 psmt.executeUpdate();
	} catch (Exception e) {
	  e.printStackTrace();
	}
	
	response.sendRedirect("/ch06/shop/product/list.jsp");
%>