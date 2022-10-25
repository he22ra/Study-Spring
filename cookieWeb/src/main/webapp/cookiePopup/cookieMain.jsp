<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cookie</title>
  </head>
  <body>
    <h2>쿠키(Cookie) 생성 및 설정</h2>
    <%
    	Cookie cookie = new Cookie("newCookie", "내가만든쿠키");
    	cookie.setPath(request.getContextPath());
    	cookie.setMaxAge(3600);		// 유지시간 3600초 = 1시간
    	response.addCookie(cookie);	// 응답헤더에 쿠키 추가
    %>
    
    <h2>쿠키 설정 후 쿠키 값 확인</h2>
    <%
    	Cookie[] cookies = request.getCookies();	// 요청 헤더의 모든 쿠키 읽기
    	for (Cookie c : cookies) {
    		String cookieName = c.getName();
    		String cookieValue = c.getValue();
    		out.println(String.format("%s : %s<br/>", cookieName, cookieValue));
    	}
    %>
  </body>
</html>