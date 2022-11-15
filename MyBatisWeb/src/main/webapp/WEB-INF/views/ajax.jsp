<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="http://code.jquery.com/jquery-1.11.3.js"></script>
  
    <title>ajax</title>
  </head>
  <body>
    	<h2>{name:"ezen", age:10}</h2>
    	<button id="sendBtn" type="button">SEND</button>
    	
    	<h2>Data from Server :</h2>
    	<div id="data"></div>
    	
    	<script type="text/javascript">
    	$(document).ready(function(){
    		let person = {name:"ezen", age:10}
    		let person2 = {}
    		$("#sendBtn").click(function(){
    			$.ajax({
    				type: 'post',										// 요청 메서드
    				url : '/heart/send',								// 요청 uri
    				headers : {"content-type" : "application/json"},	// 요청 헤더
    				dataType : 'text',									// 전송받을 데이터 타입
    				data : JSON.stringify(person),						// 서버로 전송될 데이터. stringify()로 직렬화 필요
    				success: function(result){
    					person2 = JSON.parse(result)
    					alert("received = "+ result)
    					$("#data").html("name = " + person2.name + "age = " + person2.age)
    				},
    				error : function() { alert("error")}				// 에러가 발생했을 때, 호출될 함수
    			})
    			
    			alert("the request is sent")
    		})
    	})
    	
    	</script>
  </body>
</html>