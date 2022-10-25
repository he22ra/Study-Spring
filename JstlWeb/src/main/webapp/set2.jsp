<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.co.ezenac.Person"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <h4>List 컬렉션 이용</h4>
    <%
    	ArrayList<Person> pList = new ArrayList<>();
    	pList.add(new Person("신사임당", 20));
    	pList.add(new Person("이방원", 10));
    %>
    <%
    	Map<String, Person> pMap = new HashMap<>();
    	pMap.put("person1", new Person("이성계", 65));
    	pMap.put("person2", new Person("최영", 62));
    %>
    <c:set var="personList" value="<%= pList %>" scope="request" />
    <ul>
    	<li>이름 : ${requestScope.personList[0].name }</li>
    	<li>나이 : ${personList[0].age }</li>
    </ul>
    
    <h4>Map 컬렉션 이용</h4>
    <c:set var="personMap" value="<%= pMap %>" scope="request"></c:set>
    <ul>
    	<li>이름 : ${requestScope.personMap.person1.name }</li>
    	<li>나이 : ${personMap.person1.age }</li>
    </ul>
  </body>
</html>