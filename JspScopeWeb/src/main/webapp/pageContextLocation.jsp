<%@page import="kr.co.ezenac.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert title here</title>
  </head>
  <body>
    <h2>이동 후 페이지 영역 속성값 읽기</h2>
    <%
    	Object pInteger = pageContext.getAttribute("ezenInteger"); 
    	Object pString = pageContext.getAttribute("ezenString"); 
    	Object pPerson = pageContext.getAttribute("pagePerson"); 
    %>
    
    <ul>
    	<li>Integer 객체 :  <%=(pInteger == null) ? "값 없음" : pInteger %></li>
    	<li>String 객체 :  <%=(pString == null) ? "값 없음" : pString %></li>
    	<li>Person 객체 :  <%=(pPerson == null) ? "값 없음" : ((Person)pPerson).getName()%></li>
    </ul>
  </body>
</html>