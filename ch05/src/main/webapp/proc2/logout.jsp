<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	session.removeAttribute("username");
	session.invalidate();
	response.sendRedirect("../session.jsp?code=101");
%>