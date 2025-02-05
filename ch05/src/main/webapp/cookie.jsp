<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Cookie Test</title>
	<!-- 
		날짜: 2025/02/05
		이름: 이현민
		내용: JSP Cookie session 
	 -->
</head>
<body>
	<h3>1. Cookie Test</h3>	
	<form action="./proc/createCookie.jsp" method="post">
		<input type="text" name="uid" placeholder="아이디 입력"/> <br>
		<input type="password" name="pass" placeholder="비밀번호 입력"/> <br>
		<input type="submit" value="Submit"/> <br>
	</form>
</body>
</html>