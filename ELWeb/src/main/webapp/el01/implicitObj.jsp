<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("scopeValue", "값-page 영역");
	request.setAttribute("scopeValue", "값-request 영역");
	session.setAttribute("scopeValue", "값-session 영역");
	application.setAttribute("scopeValue", "값-application 영역");
%>
<!DOCTYPE html>
<html>
  <head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EL - 내장객체</title>
  </head>
  <body>
    <h2>4가지 영역에 저장된 속성 읽기 (EL 내장 객체 사용)</h2>
    <ul>
    	<li>page 영역 : ${pageScope.scopeValue}</li>
    	<li>request 영역 : ${requestScope.scopeValue}</li>
    	<li>session 영역 : ${sessionScope.scopeValue}</li>
    	<li>application 영역 : ${applicationScope.scopeValue}</li>
    </ul>
    
    <h3>영역에 지정없이 속성 읽기</h3>
    <ul>
    	<li>${scopeValue }</li>
    </ul>
    <jsp:forward page="implicitForward.jsp"/>
    
  </body>
</html>