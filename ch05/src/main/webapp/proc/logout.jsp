<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%
	Cookie cookie = new Cookie("username", null);
	cookie.setMaxAge(0);
	
	response.addCookie(cookie);
	response.sendRedirect("../cookie.jsp?code=101");
%>
