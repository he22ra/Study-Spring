<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.servlet.http.HttpSession" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SimpleDateFormat dataFormat = new SimpleDateFormat("HH:mm:ss");		// 날짜 표시 형식
	
	// 최초 요청 (세션 생성) 시간
	long creationTime = session.getCreationTime();
	String creationTimeStr = dataFormat.format(new Date(creationTime));
	
	// 마지막 요청 시각
	long lastTime = session.getLastAccessedTime();
	String lastTimeStr = dataFormat.format(new Date(lastTime));
%>
<!DOCTYPE html>
<html>
  <head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert title here</title>
  </head>
  <body>
  	<h2>session 설정 확인</h2>
    <ul>
    	<li>세션 유지 시간 : <%= session.getMaxInactiveInterval() %></li>
    	<li>세션 아이디 : <%= session.getId() %></li>
    	<li>최초 요청 시간 : <%= creationTimeStr %> </li>
    	<li>마지막 요청 시간 : <%= lastTimeStr %> </li>
    </ul>
  </body>
</html>