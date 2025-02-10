<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String sender = request.getParameter("sender");
	String receiver = request.getParameter("receiver");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	String appPassword =""; //TODO Save this appPassword to application.properties and get it from there
	Properties prop = new Properties();
	prop.put("mail.smtp.host", "smpt.gmail.com");
	prop.put("mail.smtp.port", "465");
	prop.put("mail.smtp.auth", "true");
	prop.put("mail.smtp.ssl.enable", "true");
	prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	
	Session gmailSession = Session.getInstance(prop, new  Authenticator(){
	  protected PasswordAuthentication getPasswordAuthentication() {
	    return new PasswordAuthentication(sender, appPassword);
	  }
	});
	
	Message msg = new MimeMessage(gmailSession);
	
	try {
	  msg.setFrom(new InternetAddress(sender, "보내는 사람", "UTF-8"));
	  msg.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
	  msg.setSubject(title);
	  msg.setContent(content, "text/html;charset=UTF-8");
	  
	  Transport.send(msg);
	} catch (Exception e) {
	  e.printStackTrace();
	}
	
	response.sendRedirect("../3.EmailTest.jsp");
%>