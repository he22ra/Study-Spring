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
    <h2>폼 값 전송하기</h2>
    <form action="formResult.jsp" name="frm" method="post">
    	이름 : <input type="text" name="name" autofocus><br/>
    	성별 : <input type="radio" name="gender" value="man">남자
    		  <input type="radio" name="gender" value="woman">여자<br/>
    	학력 :
    	<select name="grade">
    		<option value="ele">초등학교</option>
    		<option value="mid">중학교</option>
    		<option value="high">고등학교</option>
    		<option value="univ">대학교</option>
    	</select><br/>
    	관심 : 
    	<input type="checkbox" name="inter" value="pol" />정치
    	<input type="checkbox" name="inter" value="eco" />경제
    	<input type="checkbox" name="inter" value="ent" />연예
    	<input type="checkbox" name="inter" value="spo" />스포츠<br/>
    	
    	<input type="submit" value="전송하기"/>
    </form>
  </body>
</html>