<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Home</title>
	</head>
	<body>
		<h1>
			security 홈페이지
		</h1>
		<br>
		<sec:authorize access="isAnonymous()"><!-- 로그인 안됨 -->
			<a href="join.do">회원가입 페이지로 이동</a>
		</sec:authorize>
		<sec:authorize access="isAuthenticated()"><!-- 로그인 O -->
			
			<!-- 로그인 안된 상태에서 sec:authentication 태그 사용시 오류 발생  -->
			<sec:authentication property="principal.username" />
			<sec:authentication property="principal.authority" />
			
			<a href="logout.do">로그아웃</a>
		</sec:authorize>
		<sec:authorize access="hasAnyRole('U')">
			일반 유저
		</sec:authorize>
		<sec:authorize access="hasAnyRole('A')">
			관리자
		</sec:authorize>
	</body>
</html>
