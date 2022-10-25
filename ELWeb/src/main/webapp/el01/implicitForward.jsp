<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EL - 내장객체</title>
  </head>
  <body>
	<h2>implicitForward 페이지 </h2>
	<h3>각 영역에 저장된 속성 읽기</h3>
	<ul>
		<li>page 영역 : ${pageScope.scopeValue}</li>
    	<li>request 영역 : ${requestScope.scopeValue}</li>
    	<li>session 영역 : ${sessionScope.scopeValue}</li>
    	<li>application 영역 : ${applicationScope.scopeValue}</li>
	</ul>
  </body>
</html>