<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Customer Registry</title>
	</head>
	<body>
		<h3>Customers Registry</h3>	
		<a href="/ch06/shop">Go to main page</a>
		|
		<a href="/ch06/shop/customer/list.jsp">Go to Customers List</a>
		
		<form action="/ch06/shop/customer/proc/registerCustomer.jsp" method="POST">
			<table border="1">
				<tr>
					<td>고객 아이디</td>
					<td>
						<input type="text" name="custId" placeholder="아이디 입력"/>
					</td>
				</tr>
				<tr>
					<td>고객명</td>
					<td>
						<input type="text" name="name" placeholder="이름 입력"/>
					</td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td>
						<input type="text" name="hp" placeholder="휴대폰 입력"/>
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<input type="text" name="addr" placeholder="주소 입력"/>
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