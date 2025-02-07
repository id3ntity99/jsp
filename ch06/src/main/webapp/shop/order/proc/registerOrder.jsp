<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String orderId = request.getParameter("orderId");
	String orderProd = request.getParameter("orderProduct");
	String orderCount = request.getParameter("orderCount");

	try {
		 String sql = "INSERT INTO `order` SET `orderId`=?, `orderProduct`=?, `orderCount`=?, `orderDate`=NOW();";
		 Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		 DataSource ds = (DataSource) ctx.lookup("jdbc/shop");
		 Connection conn = ds.getConnection();
		 PreparedStatement psmt = conn.prepareStatement(sql); 
		 
		 psmt.setString(1, orderId);
		 psmt.setString(2, orderProd);
		 psmt.setString(3, orderCount);
		 
		 psmt.executeUpdate();
		 
		 String updateSql = "UPDATE `product` set `stock`= `stock` - ? WHERE `prodNo`=?;";
		 PreparedStatement updateStmt = conn.prepareStatement(updateSql);
		 
		 updateStmt.setString(1, orderCount);
		 updateStmt.setString(2, orderProd);
		 updateStmt.executeUpdate();
		 
		 conn.close();
		 psmt.close();
		 
	} catch (Exception e) {
	  e.printStackTrace();
	}
	
	response.sendRedirect("/ch06/shop/order/list.jsp");
%>