<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>User2 Registry</title>
</head>
<body>
<body>
	<h3>user2 등록</h3>	
	<a href="../1.jdbc.jsp">처음으로</a>
	<a href="./list.jsp">목록으로</a>
	
	<form action="./registerUser2.jsp" method="POST">
		<table border="1">
		<tr>
			<td>아이디</td>
			<td>
				<input type="text" name="uid" placeholder="아이디 입력">
			</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>
				<input type="text" name="name" placeholder="이름 입력">
			</td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td>
				<input type="date" name="birth" placeholder="생년월일 입력">
			</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>
				<input type="text" name="주소" placeholder="주소 입력">
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="등록">
			</td>
		</tr>
		</table>
	</form>
</body>
</body>
</html>