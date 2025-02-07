<%@page import="ch06.ProductVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ch06.CustomerVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
 	List<ProductVO> products = new ArrayList<>();

	try {
	 Context ctx = (Context) new InitialContext().lookup("java:comp/env");
	 DataSource ds = (DataSource) ctx.lookup("jdbc/shop");
	 Connection conn = ds.getConnection();
	 
	 Statement stmt = conn.createStatement(); 
	 ResultSet res = stmt.executeQuery("SELECT * FROM `Product`;");
	 
	 while (res.next()) {
	  ProductVO product = new ProductVO(); 
	  product.setProdNo(res.getInt(1));
	  product.setProdName(res.getString(2));
	  product.setStock(res.getInt(3));
	  product.setPrice(res.getInt(4));
	  product.setCompany(res.getString(5));
	  products.add(product);
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
		<title>Products List</title>
	</head>
	<body>
		<h3>Products List</h3>	
		<a href="/ch06/shop">Go to main page</a>
		|
		<a href="/ch06/shop/product/register.jsp">Register Product</a>
		
		<table border="1">
			<tr>
				<th>상품번호</th>	
				<th>상품명</th>	
				<th>재고량</th>	
				<th>가격</th>	
				<th>제조사</th>	
				<th>관리</th>	
			</tr>
			<%
			for (ProductVO product : products) {
			%>
			<tr>
				<td><%= product.getProdNo() %></td>
				<td><%= product.getProdName() %></td>
				<td><%= product.getStock() %></td>
				<td><%= product.getPrice() %></td>
				<td><%= product.getCompany() %></td>
				<td>
					<a href="/ch06/shop/product/modify.jsp?prodNo=<%= product.getProdNo() %>">수정</a>
					<a href="/ch06/shop/product/proc/deleteProduct.jsp?prodNo=<%= product.getProdNo() %>">삭제</a>
				</td>
				<%
			 }
				%>
			</tr>
		</table>
		
		<h4>Order</h4>		
		<form action="/ch06/shop/order/proc/registerOrder.jsp">
			<table border="1">
				<tr>
					<td>상품 번호</td>
					<td>
						<input type="text" name="orderProduct" placeholder="상품번호 입력" />
					</td>
				</tr>
				<tr>
					<td>주문자 아이디</td>
					<td>
						<input type="text" name="orderId" placeholder="주문자 아이디 입력" />
					</td>
				</tr>
				<tr>
					<td>주문수량</td>
					<td>
						<input type="number" name="orderCount" placeholder="주문수량 입력" />
					</td>
				</tr>
				<tr>
					<td>상품 번호</td>
					<td>
						<input type="submit" value="주문하기" />
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>