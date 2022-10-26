<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ERROR</title>
  </head>
  <body>
    <h2>에러 발생</h2>
    발생한 예외 : ${pageContext.exception}<br/>
    예외 메세지 : ${pageContext.exception.message }<br/>
    <ol>
    	<c:forEach items="${ex.stackTrace }" var="i">
    		<li>${i.toString() }</li>
    	</c:forEach>
    </ol>
  </body>
</html>