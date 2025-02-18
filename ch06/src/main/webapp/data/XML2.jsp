<%@page import="org.jdom2.output.Format"%>
<%@page import="org.jdom2.output.XMLOutputter"%>
<%@page import="org.jdom2.Element"%>
<%@page import="org.jdom2.Document"%>
<%@page import="org.jdom2.JDOMFactory"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ch06.User1VO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/xml;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
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
	  
	  conn.close();
	  stmt.close();
	  rs.close();
	} catch(Exception e ) {
	 	e.printStackTrace();
	}
	
	Document doc = new Document();
	Element usersElement = new Element("users");

	for(User1VO user : users) {
	  Element userElement = new Element("user");
	  Element uidElement = new Element("uid");
	  Element nameElement = new Element("name");
	  Element hpElement = new Element("hp");
	  Element ageElement = new Element("age");
	  
	  uidElement.setText(user.getUid());
	  nameElement.setText(user.getName());
	  hpElement.setText(user.getHp());
	  ageElement.setText(Integer.toString(user.getAge()));
	  
	  userElement.addContent(uidElement);
	  userElement.addContent(nameElement);
	  userElement.addContent(hpElement);
	  userElement.addContent(ageElement);
	  
	  usersElement.addContent(userElement);
	}
	
	doc.setRootElement(usersElement);
	
	XMLOutputter outputter = new XMLOutputter(Format.getPrettyFormat());
	String xml = outputter.outputString(doc);
	out.println(xml);
%>