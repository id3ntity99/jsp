<%@page import="entity.User"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String uid = request.getParameter("uid");
	String pass = request.getParameter("pass");
	
	if (uid.equals("abc") && pass.equals("1234")) {
	 User user = new User();
	 user.setUid(uid);
	 user.setPass(pass);
	 user.setName("홍길동");
	 user.setAge(23);
	 
	 session.setAttribute("username", user);
	 
	response.sendRedirect("./loginSuccess.jsp"); 
	} else {
	  response.sendRedirect("../session.jsp?code=100");
	}
%>