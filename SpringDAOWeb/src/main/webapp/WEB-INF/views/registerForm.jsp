<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
  <head>
	<meta charset="UTF-8">
 	<meta http-equiv="X-UA-Compatible" content="IE=edge">
 	<meta name="viewport" content="width=device-width, initial-scale=1.0">
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
  	<style type="text/css">
 	 	*{box-sizing : border-box; --primary-color : rgb(100,30,150);}
 	 	.title { font-size: 50px; margin:40px 0 0px 0;}
  		form { display:flex; flex-direction: column; align-items: center; position: absolute;
  			   width: 400px; height:680px; top: 50%; left: 50%;
  			   transform: translate(-50%, -50%);
  			   border: 3px solid rgb(100,10,150);}
 	 	.msg {text-align: center; margin-bottom: 20px; height: 30px; font-size: 14px; color: red;}
 	 	label {width:300px; height:30px; margin-top:4px;}
  		.input-field {width: 300px; height: 40px; border: 1px solid var(--primary-color); padding: 0 10px; margin-bottom: 10px;}
  		.sns-chk{margin-top: 5px;}
 	 	button {width: 200px; height: 60px; background-color: var(--primary-color); border: 0; border-radius: 5px;
  				font-size:16px; color:#fff; margin: 20px 0 30px 0; }
 	 </style>
  	<title>회원가입</title>
  </head>
  <body>
  	<form:form modelAttribute="user">
  		<div class="title">Register</div>
  		<div id="msg" class="msg">
  			<form:errors path="id" />
  		</div>
    	<div class="title"> 회원가입 </div>
    	<label for="">아이디</label>
    	<input class="input-field" type="text" name="id" placeholder="5~12자리의 영대소문자, 숫자 조합" autofocus/>
    	<label for="">비밀번호</label>
    	<input class="input-field" type="password" name="pwd" placeholder="8~12자리의 영대소문자, 숫자 조합"/>
    	<label for="">이름</label>
    	<input class="input-field" type="text" name="name" placeholder="이순신"/>
    	<label for="">이메일</label>
    	<input class="input-field" type="text" name="email" placeholder="i.d@site.com"/>
    	<label for="">생일</label>
    	<input class="input-field" type="text" name="birth" placeholder="2000-01-11"/>
    		
    	<div class="sns-chk">
    		<label><input type="checkbox" name="sns" value="fb"/>페이스북</label>
    		<label><input type="checkbox" name="sns" value="kt"/>카카오톡</label>
    		<label><input type="checkbox" name="sns" value="in"/>인스타그램</label>
    	</div>
    		<button>회원 가입</button>
    	</form:form>
    	
    	<script type="text/javascript">
	  		function formCheck(frm) {
				let msg = ''
				if (frm.id.value.length < 8) {
					setMessage('id의 길이는 5자리 이상이어야 합니다.', frm.id)
					return false;
				}
				if (frm.pw.value.length < 8) {
					setMessage('pw의 길이는 8자리 이상이어야 합니다.', frm.pw)
					return false;
				}
			}

    		function setMessage(msg, element) {
				document.getElementById("msg").innerHTML = `<i class="fa fa-circle-exclamation">${'${msg}'}</i>`;
				if (element) {
					element.select();
				}
			}
    	</script>
  </body>
</html>