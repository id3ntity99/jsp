<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="sub1.User">
	<jsp:setProperty property="uid" name="user"/>
	<jsp:setProperty property="name" name="user"/>
	<jsp:setProperty property="hp" name="user"/>
	<jsp:setProperty property="age" name="user"/>
</jsp:useBean>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>userProc</title>
</head>
<body>
	<h3>Received Data</h3>	
	<p>
		UID: <%= user.getUid() %> <br>
		Name: <%= user.getName() %> <br>
		HP: <%= user.getHp() %> <br>
		age: <%= user.getAge() %> <br>
	</p>
	
	<a href="../3.useBean.jsp">Go back</a>
</body>
</html>