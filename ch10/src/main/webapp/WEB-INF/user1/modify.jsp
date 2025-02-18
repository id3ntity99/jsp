<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>user1::modify</title>
</head>
<body>
	<h3>user1 수정</h3>	
	<a href="/ch10">처음으로</a>
	<a href="/ch10/user1/list.do">목록이동</a>
	
	<form action="/ch10/user1/modify.do" method="POST">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" readonly value="${user.uid}" name="uid" placeholder="아이디 입력"> 
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<input type="text" value="${user.name}" name="name" placeholder="이름 입력">
				</td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td>
					<input type="text" value="${user.hp}" name="hp" placeholder="휴대폰 입력">
				</td>
			</tr>
			<tr>
				<td>나이</td>
				<td>
					<input type="number" value="${user.age}" name="age" placeholder="나이 입력">
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="수정">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>