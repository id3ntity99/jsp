<%@page import="com.google.gson.Gson"%>
<%@page import="ch06.User1VO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	User1VO user = new User1VO();
	user.setUid("abc123");
	user.setName("John Doe");
	user.setHp("010-1234-5678");
	user.setAge(33);
	
	Gson gson = new Gson();
	String strJson = gson.toJson(user);	
	System.out.println(strJson);
%>