<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Product Registry</title>
	</head>
	<body>
		<h3>Product Registry</h3>	
		<a href="/ch06/shop">Go to main page</a>
		|
		<a href="/ch06/shop/product/list.jsp">Go to Customers List</a>
		
		<form action="/ch06/shop/product/proc/registerProduct.jsp" method="POST">
			<table border="1">
				<tr>
					<td>제품명</td>
					<td>
						<input type="text" name="prodName" placeholder="제품명 입력"/>
					</td>
				</tr>
				<tr>
					<td>재고량</td>
					<td>
						<input type="number" name="stock" placeholder="재고량 입력"/>
					</td>
				</tr>
				<tr>
					<td>가격</td>
					<td>
						<input type="number" name="price" placeholder="가격 입력"/>
					</td>
				</tr>
				<tr>
					<td>제조사</td>
					<td>
						<input type="text" name="company" placeholder="제조사 입력"/>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="Register"/>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>