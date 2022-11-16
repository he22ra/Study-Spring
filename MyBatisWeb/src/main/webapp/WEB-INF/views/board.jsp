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
  	.btn {width: 90px; height:40px; padding: 5px; text-align: center; border: 1px solide #e8e8e8; margin: 15px 5px; cursor:pointer;}
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
				let bno = ${boardDto.bno}
		    	
		    	let showList = function(bno){
		    		$.ajax({
		    			type: 'GET',			// 요청 메서드
		    			url : '/heart/comments?bno='+bno,	//요청 URI
		    			success : function(result) {		// 서버로부터 응답이 도착하면 호출
							$("#commentList").html(toHtml(result))	//result는 서버가 전송한 데이터
						},
						error: function() { alert("error")}	//에러가 발생할 때 호출될 함수
		    		})
		    	}
				
				let toHtml = function(comments) {
		    		let tmp = "<div>"
		    		
					comments.forEach(function(comment) {
							tmp += '<p data-cno='+ comment.cno
							tmp += ' data-bno=' + comment.bno
							tmp += ' data-pcno=' + comment.pcno + '>'
							tmp += ' commenter=<span class="commenter">' + comment.commenter + '</span>'
							tmp += ' comment=<span class="comment">' + comment.comment + '</span>'
							tmp += ' <button class="delBtn">삭제</button>'
							tmp += '</p>'		
					})
					
					return tmp += "</div>"
				}
			
				$("#sendBtn").click(function() {
//					if (bno == ${boardDto.bno})
					showList(bno)
				})
				
/* 				$(".delBtn").click(function() {				// [send]를 누르고 나서 [삭제]버튼이 보이므로 이벤트 활성화가 안됨.
					alert("삭제버튼클릭")
				}) */
				
				$("#commentList").on("click",".delBtn",function(){
					let cno = $(this).parent().attr("data-cno")		//<li>태그는 <button>의 부모
					let bno = $(this).parent().attr("data-bno")		//attr중 사용자 정의 attr를 선택함.
					
					$.ajax({
						type: 'DELETE',								// 요청 메서드
						url : '/heart/comments/'+cno+'?bno='+bno, 	// 요청 uri
						success : function(result) {				// 서버로부터 응답이 도착하면 호출될 함수
							alert(result)							// result 서버가 전송한 데이터
							showList(bno)							// 갱신된 결과 출력
						},
						error : function() {alert("error")}			// 에러발생
					})	
					
				})
				
				
			
				$("#listBtn").on("click",function(){
//					location.href="javascript:history.back(-1)'/>";
					location.href="<c:url value='/board/list${searchItem.queryString}'/>";
				})
				
				$("#writeBtn").on("click",function(){
					let form = $("#form");
					form.attr("action","<c:url value='/board/write' />");
					form.attr("method", "post");
					
					if(formCheck())
						form.submit();
				})
				
				let formCheck = function() {
					let form = document.getElementById("form");
					if(form.title.value=="") {
						alert("제목을 입력하세요.");
						form.title.focus();
						return false;
					}
					if(form.content.value=="") {
						alert("내용을 입력하세요.");
						form.content.focus();
						return false;
					}
					return true;
				}
				
				$("#removeBtn").on("click", function() {
					if(!confirm("정말로 삭제하시겠습니까?")) return;
				
					let form = $("#form")
					form.attr("action","<c:url value='/board/remove${searchItem.queryString}' />")
					form.attr("method", "post")
					form.submit()
				})
				
				$("#modifyBtn").on("click", function() {
					let form = $("form");
					let isReadonly = $("input[name=title]").attr('readonly');
					
					//1. 읽기 상태이면 수정상태로 변경
					if(isReadonly=='readonly'){
						$(".writing-header").html("게시판 수정")
						$("input[name=title]").attr('readonly', false)
						$("textarea").attr('readonly',false)
						$("#modifyBtn").html("<i class='fa fa-pencil'></i> 등록")
						return;
					}
					//2.수정 상태면 수정된 내용을 서버로 전송
					form.attr("action", "<c:url value='/board/modify${searchItem.queryString}' />")
					form.attr("method", "post")
					if(formCheck())
						form.submit();
					
				})
		})
		
	</script>
	<script type="text/javascript">
		let msg="${msg}";
		if(msg =="WRT_ERR") alert("게시물 등록에 실패하였습니다. 다시 시도해 주세요.");
		if(msg =="MOD_ERR") alert("게시물 수정에 실패하였습니다. 다시 시도해 주세요.");
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
			<button id="sendBtn" type="button">SEND</button>
    		<div id="commentList"></div>
		</form>
	</div>			
    	
  </body>
</html>