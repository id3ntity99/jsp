<%@page import="ch.qos.logback.core.recovery.ResilientSyslogOutputStream"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="ch06.User1VO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.security.spec.DSAGenParameterSpec"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	  
    List<User1VO> users = new ArrayList<>();

	try {
	  Context ctx = (Context) new InitialContext().lookup("java:comp/env");
	  DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
	  Connection conn = ds.getConnection();
	  
	  Statement stmt = conn.createStatement();
	  ResultSet rs = stmt.executeQuery("select * from user1");
	  
	  while(rs.next()) {
	    User1VO user1 = new User1VO();
	    user1.setUid(rs.getString(1));
		user1.setName(rs.getString(2));
		user1.setHp(rs.getString(3));
		user1.setAge(rs.getInt(4));
		
		users.add(user1);
	  }
	} catch(Exception e ) {
	 	e.printStackTrace();
	}

	Gson gson = new Gson();
	String json = gson.toJson(users);
	System.out.println(json);
	out.println(json);
%>