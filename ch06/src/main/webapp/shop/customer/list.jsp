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
 	List<CustomerVO> customers = new ArrayList<>();

	try {
	 Context ctx = (Context) new InitialContext().lookup("java:comp/env");
	 DataSource ds = (DataSource) ctx.lookup("jdbc/shop");
	 Connection conn = ds.getConnection();
	 
	 Statement stmt = conn.createStatement(); 
	 ResultSet res = stmt.executeQuery("SELECT * FROM `customer`;");
	 
	 while (res.next()) {
	  CustomerVO customer = new CustomerVO(); 
	  customer.setCustId(res.getString(1));
	  customer.setName(res.getString(2));
	  customer.setHp(res.getString(3));
	  customer.setAddr(res.getString(4));
	  customer.setRdate(res.getString(5));
	  customers.add(customer);
	 }
	 
	 conn.close();
	 stmt.close();
	 res.close();

	} catch (Exception e){
	  
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Customers List</title>
	</head>
	<body>
		<h3>Customers List</h3>	
		<a href="/ch06/shop">Go to main page</a>
		|
		<a href="/ch06/shop/customer/register.jsp">Register Customer</a>
		
		<table border="1">
			<tr>
				<th>고객 아이디</th>	
				<th>고객명</th>	
				<th>휴대폰</th>	
				<th>주소</th>	
				<th>가입일</th>	
				<th>관리</th>	
			</tr>
			<%
			for (CustomerVO customer : customers) {
			%>
			<tr>
				<td><%= customer.getCustId() %></td>
				<td><%= customer.getName() %></td>
				<td><%= customer.getHp() %></td>
				<td><%= customer.getAddr() %></td>
				<td><%= customer.getRdate() %></td>
				<td>
					<a href="/ch06/shop/modify.jsp?custId=<%= customer.getCustId() %>">수정</a>
					<a href="/ch06/shop/proc/deleteCustomer.jsp?<%= customer.getCustId() %>">삭제</a>
				</td>
				<%
					}
				%>
			</tr>
		</table>
	</body>
</html>