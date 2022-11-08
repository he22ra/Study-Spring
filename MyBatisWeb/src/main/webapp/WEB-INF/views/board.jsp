<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="loginId" value="${sessionScope.id}" />
<c:set var="loginout" value="${loginId == null ? 'Login' : 'id:'+=loginId }"/>
<c:set var="loginoutlink" value="${loginId == null ? '/login/login' : '/login/logout' }"/>

<!DOCTYPE html>
<html>
  <head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="<c:url value='/resources/css/menu.css' />">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
  <script src="http://code.jquery.com/jquery-1.11.3.js"></script>
  
  <style type="text/css">
    *{box-sizing : border-box; margin: 0; padding: 0; font-family: "Noto Sans KR", sans-serif;}
	.container	{width: 50%; margin: 0 auto; } 
	.writing-header {position: relative; margin: 20px 0 0 0; padding: 0 0 10px 0; border-bottom: 1px solid #323232;} 
  	.frm {width: 100%;}
  	input { height:35px;}
  	input, textarea {width:100%; margin: 5px 0 10px 0; border: 1px solide #e8e8e8; padding: 2rem 1rem; background-color: #f8f8f8; outline-color: #e6e6e6; }
  	.btn {width: 90px; height:40px; padding: 5px; text-align: center; border: 1px solide #e8e8e8; margin: 15px 5px;}
  </style>
  
  
    <title>게시글 조회</title>
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
	<script type="text/javascript">
		$(document).ready(function(){
				$("#listBtn").on("click",function(){
					location.href="<c:url value='/board/list?page=${page}&pageSize=${pageSize}'/>";	
				}) 			
		})
		
	</script>
	<div class="container">
		<h2 class="writing-header">게시판 ${mode=="new" ? "글쓰기" : "읽기"} </h2>
		<form id="form" class="frm" action="" method="post">
			<input type="hidden" name="bno" value="${boardDto.bno}">
			<input type="text" name="title" value="${boardDto.title }" ${mode=="new" ? "" : "readonly='readonly'" }>
			<textarea rows="20" name="content" ${mode=="new" ? "" : "readonly='readonly'" }>${boardDto.content}</textarea>
			
			<c:if test="${mode eq 'new' }">
				<button type="button" id="writeBtn" class="btn btn-write"><i class="fa fa-pencil"></i>등록</button>
			</c:if>
			<c:if test="${mode ne 'new' }">
				<button type="button" id="writeNewBtn" class="btn btn-write"><i class="fa fa-pencil"></i>글쓰기</button>			
			</c:if>
			<!-- 수정권한 확인  -->
			<c:if test="${boardDto.writer eq loginId}">
				<button type="button" id="modifyBtn" class="btn btn-modify"><i class="fa fa-edit"></i>수정</button>
				<button type="button" id="removeBtn" class="btn btn-remove"><i class="fa fa-trash"></i>삭제</button>
			</c:if>
			<button type="button" id="listBtn" class="btn btn-list"><i class="fa fa-list"></i>목록</button>
		</form>
	</div>			
    	
  </body>
</html>