<%@page import="ch06.CustomerVO"%>
<%@page import="ch06.ProductVO"%>
<%@page import="javax.swing.plaf.basic.BasicBorders"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ch06.OrderVO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<% 
 	List<OrderVO> orders = new ArrayList<>();

	try {
	 Context ctx = (Context) new InitialContext().lookup("java:comp/env");
	 DataSource ds = (DataSource) ctx.lookup("jdbc/shop");
	 Connection conn = ds.getConnection();
	 
	 String sql = "SELECT " + "    o.orderNo," + "    p.prodName," + "    o.orderCount,"
		+ "    p.company," + "    c.name," + "    c.hp," + "    o.orderDate " + "FROM `order` AS o "
		+ "JOIN `product` AS p ON o.orderProduct = p.prodNo "
		+ "JOIN `customer` AS c ON o.orderId = c.custId;";
	 Statement stmt = conn.createStatement(); 
	 ResultSet res = stmt.executeQuery(sql);
	 
	 while (res.next()) {//FIX this
	  OrderVO order = new OrderVO(); 
	  ProductVO prod = new ProductVO();
	  CustomerVO cust = new CustomerVO();
	  order.setProduct(prod);
	  order.setCustomer(cust);
	  
	  order.setOrderNo(res.getInt(1));
	  prod.setProdName(res.getString(2));
	  order.setOrderCount(res.getInt(3));
	  prod.setCompany(res.getString(4));
	  cust.setName(res.getString(5));
	  cust.setHp(res.getString(6));
	  order.setOrderDate(res.getString(7));
	  
	  orders.add(order);
	 }
	 
	 conn.close();
	 stmt.close();
	 res.close();

	} catch (Exception e){
	 	e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Customers List</title>
	</head>
	<body>
		<h3>Orders List</h3>	
		<a href="/ch06/shop">Go to main page</a>
		|
		<a href="/ch06/shop/product/list.jsp">Product List</a>
		
		<table border="1">
			<tr>
				<th>주문번호</th>	
				<th>주문상품</th>	
				<th>주문수량</th>	
				<th>제조사</th>	
				<th>주문자</th>	
				<th>주문자 연락처</th>	
				<th>주문일자</th>	
			</tr>
			<%
			for (OrderVO order : orders) {
			%>
			<tr>
				<td><%= order.getOrderNo() %></td>
				<td><%= order.getProduct().getProdName() %></td>
				<td><%= order.getOrderCount() %></td>
				<td><%= order.getProduct().getCompany() %></td>
				<td><%= order.getCustomer().getName() %></td>
				<td><%= order.getCustomer().getHp() %></td>
				<td><%= order.getOrderDate() %></td>
				<%
			 }
				%>
			</tr>
		</table>
	</body>
</html>