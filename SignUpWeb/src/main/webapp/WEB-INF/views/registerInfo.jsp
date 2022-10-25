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
    <h3>id : ${param.id}</h3>
    <h3>pw : ${param.pw}</h3>
    <h3>name : ${param.name}</h3>
    <h3>email : ${param.email}</h3>
    <h3>birth : ${param.birth}</h3>
    <h3>sns : ${paramValues.sns[0]}
			  ${paramValues.sns[1]}
			  ${paramValues.sns[2]}</h3>
  </body>
</html>