<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Cookie Creation</title>
</head>
<body>
	<h3>Cookie Creation</h3>	
	<%
		String uid = request.getParameter("uid"); //uid = abc
		String pass = request.getParameter("pass"); //password = 1234. In real life, the password must be hased before storing in DB.
		
		String ctxPath = application.getContextPath();
		
		if (uid.equals("abc") && pass.equals("1234")) {
		 	Cookie cookie = new Cookie("username", uid);
		 	cookie.setMaxAge(60 * 3); // 3 mins
		 	cookie.setPath(ctxPath);
		 	
			response.addCookie(cookie);
		 	response.sendRedirect("./successLogin.jsp");
		} else  {
		  response.setStatus(401);
		  pageContext.forward("./failLogin.jsp");
		}
	%>
	
	<p>Context Path : <%= ctxPath %> </p>
</body>
</html>