<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내장객체 - response</title>
  </head>
  <body>
    <h2> 로그인 폼</h2>
    <%
 		String loginErr = request.getParameter("loginErr");
    	if (loginErr != null) out.println("로그인 실패");
    %>
    <form action="reponseLogin.jsp" method="post">
    	아이디 : <input type="text" name="user_id" /> <br />
    	비밀번호 : <input type="password" name="user_pw" /> <br />
    	<input type="submit" value="로그인" />	
    </form>
    
    <h2> 2. HTTP 응답 헤더</h2>
    <form action="./responseHeader.jsp" method="get">
    	날짜 형식 : <input type="text" name="add_date" value="2022-10-14 11:59" /><br />
    	숫자 형식 : <input type="text" name="add_int" value="0111" /><br />
    	이름 형식 : <input type="text" name="add_str" value="이순신" /><br />
 		<input type="submit" value="HTTP 응답 헤더" />
    </form>
  </body>
</html>