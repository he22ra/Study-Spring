<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String rgba = "Red, Green, Blue, Alpha"; %>
<!DOCTYPE html>
<html>
  <head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JSTL - forTokens 태그 사용</title>
    	<c:forTokens items="<%=rgba %>" delims="," var="color">
    		<span style="color:${color};">${color }</span><br/>
    	</c:forTokens>
  </head>
  <body>
    
  </body>
</html>