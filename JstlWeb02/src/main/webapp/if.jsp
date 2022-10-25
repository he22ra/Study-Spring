<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JSTL - IF</title>
  </head>
  <body>
    <!-- 변수 선언 -->
    <c:set var="number" value="100" />
    <c:set var="string" value="Java" />
    <c:set var="true" value="true" />
    
    <h4>JSTL의 if 태그로 짝수/홀수 판단</h4>
    <c:if test="${number mod 2 eq 0 }" var="result">
    	${number}은 짝수 입니다.<br/>
   	</c:if>
   		result : ${result } <br/>
   		
   	<h4>문자열 비교, else 구문 흉내</h4>
   	<c:if test="${string eq 'Java'}" var="result2">
   		'Java'가 맞습니다.<br/>
   	</c:if>
   	<c:if test="${not result2 }">
   		'Java'가 아닙니다.<br/>
   	</c:if>
   	
   	<h4>test 값에 EL이 아닌 정수 입력</h4>
   	<c:if test="100" var="result3">
   		EL이 아닌 정수를 지정하면, false
   	</c:if>
   	result3: ${result3 } <br/>
   	<h4>test 값에 EL 정수 입력</h4>
   	<c:if test="100" var="result3">
   		EL이 아닌 정수를 지정하면, false
   	</c:if>
   	
   	<h4>대소문자 구분</h4>
   	<c:if test="tRuE" var="result4">
   		대소문자 구분없이 "tRuE"일 경우 true<br/>
   	</c:if>
   	result4: ${result4 } <br/>
   	
  </body>
</html>