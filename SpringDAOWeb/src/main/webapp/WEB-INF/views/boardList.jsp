<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   

<c:set var="loginout" value="${sessionScope.id == null ? 'Login' : 'Logout' }"/>
<c:set var="loginoutlink" value="${sessionScope.id == null ? '/login/login' : '/login/logout' }"/> 
    
<!DOCTYPE html>
<html>
  <head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 리스트</title>
  <link rel="stylesheet" href="<c:url value='/resources/css/menu.css'/>">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
  
  </head>
  <body>
    <div id="menu">
		<ul>
			<li id="logo">ezen</li>
			<li><a href="<c:url value='/' />">Home</a></li>
			<li><a href="<c:url value='/board/list' />">Board</a></li>
			<li><a href="<c:url value='${loginoutlink}'/>">${loginout }</a></li>
			<li><a href="<c:url value='/register/add'/>">SingUp</a></li>
			<li><a href=""><i class="fas fa-search small"></i></a></li>
		</ul>
	</div>
	<div style="text-align: center;">
		<h1>board/list</h1>
		<h1>1111</h1>
		<h1>2222!</h1>
		<h1>333!</h1>
	</div>
  </body>
</html>