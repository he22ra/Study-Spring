<%@page import="utlls.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String loginId = CookieManager.readCookie(request, "loginId");
	String cookieCheck = "";
	if(!loginId.equals("")){
		cookieCheck = "checked";
	}
%>
<!DOCTYPE html>
<html>
  <head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <!-- CSS -->
  <link rel="stylesheet" href="assets/css/dist/bootstrap.min.css"> <!-- 부트스트랩 -->
  <link rel="stylesheet" href="assets/css/owl.css">   <!-- 캐러셀(carousel) -->
  <link rel="stylesheet" href="assets/css/animate.css">   <!-- 애니메이션효과 -->
  <link rel="stylesheet" href="assets/css/main.css" > <!-- main style-->
  <link rel="stylesheet" href="assets/css/headers.css" > <!-- header-->
  <link rel="stylesheet" href="assets/css/dist/form-validation.css" > <!-- form -->

  <!-- JS -->
  <script src="assets/js/bootstrap.bundle.min.js"></script> 
  <script src="http://www.w3schools.com/lib/w3data.js"></script> 
  <!-- 아이콘  -->
  <script src="https://kit.fontawesome.com/7f409b18dd.js" crossorigin="anonymous"></script>
  <!-- 네이버 로그인 -->
  <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
  <!-- 카카오 로그인 -->
  <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.0.0/kakao.min.js" integrity="sha384-PFHeU/4gvSH8kpvhrigAPfZGBDPs372JceJq3jAXce11bVA6rMvGWzvP4fMQuBGL" crossorigin="anonymous"></script>
  <script>Kakao.init('a552d7347e0153f2016931655fb81ce2'); /*  // 사용하려는 앱의 JavaScript 키 입력 */</script>
  <!-- 구글 로그인 -->
  <meta name ="google-signin-client_id" content="95590378121-8118g73bm3el7ee5chueqomti4ga4m80.apps.googleusercontent.com">
  <script src="https://apis.google.com/js/platform.js" async defer></script>
  
  
    <title>Cookie - 아이디 저장하기</title>
  </head>
  <body>
    	<div class="form-signin w-100 m-auto">
          <form action="idsaveProcess.jsp" method="post">
            <img class="mb-4 text-center" src="assets/img/purplaying_logo_kor.png" alt="" width="200px">
            <h1 class="mb-3 fw-normal text-center">퍼플레잉 로그인</h1>
        
            <div class="form-floating py-2">
              <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" name="user_id" value="<%=loginId%>">
              <label for="floatingInput">Email address</label>
            </div>
            <div class="form-floating py-2">
              <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="user_pw">
              <label for="floatingPassword">Password</label>
            </div>
        
            <div class="checkbox mb-3">
              <label>
                <input type="checkbox" name="save_ck" value="Y"<%=cookieCheck %>> 다음에도 내 정보 기억하기
              </label>
            </div>
            <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
            <p class="mt-5 mb-3 text-muted">&copy; 2017–2022</p>
          </form>
        </div>
  </body>
</html>