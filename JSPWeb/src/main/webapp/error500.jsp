<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="IsErrorPage.jsp"%>
<!DOCTYPE html>
<html>
  <head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>page 지시어 - errorPage, isErrorPage</title>
  </head>
  <body>
    <%
    	
    		int myAge = Integer.parseInt(request.getParameter("age")) + 10;
        	out.println("추가된 년 수가" +myAge+"입니다.");
    	
    
    %>
  </body>
</html>