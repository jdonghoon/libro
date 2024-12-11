<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Libro</title>
		<script src="<%= request.getContextPath() %>/javascript/jquery-3.7.1.min.js"></script>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/styles.css">
	</head>
	<body>
		<header>
			<div class="header-container">
				<!-- 왼쪽 메뉴 -->
				<div class="menu">
					<button onclick="toggleSideMenu('sub')" class="btn">메뉴</button>
				</div>
				
				<!-- 가운데 로고 -->
				<div class="logo">
					<a href="<%= request.getContextPath() %>"><h1>L i b r o</h1></a>
				</div>
				
				<!-- 오른쪽 검색, 로그인, 장바구니 -->
				<div class="header-right">
					<!-- 검색창 -->
					<div class="search-box">
						<button id="search-btn" onclick="toggleSearch()" class="btn">검색</button>
						<div id="search-container" class="hidden">
							<form action="index_search.do" method="get">
								<input type="text" id="search-input" name="searchValue" placeholder="검색어 입력">
							</form>
						</div>
					</div>
					<%-- <button onclick="location.href='<%=request.getContextPath()%>/admin/index.do'" class="btn">관리자</button> --%>
					<button onclick="toggleSideMenu('login')" class="btn">로그인</button>
					<button onclick="toggleSideMenu('cart')" class="btn">장바구니</button>
				</div>
			</div>
		</header>
		
		<!-- 서브 메뉴 (왼쪽에서 나오는 메뉴) -->
		<div id="sub-menu" class="side-menu-left">
			<button class="left-close-btn" onclick="closeMenu()">닫기</button>
			<a href="new_list.do">신간 도서</a>
			<a href="bestseller_list.do">베스트셀러</a>
			<a href="total_list.do">전체 도서</a>
			<a href="notice.do">공지사항</a>
			<a href="inquiry.do">문의하기</a>
		</div>
		
		<!-- 로그인 메뉴 (오른쪽에서 나오는 메뉴) -->
		<div id="login-menu" class="side-menu-right">
			<button class="right-close-btn" onclick="closeMenu()">닫기</button>
			<!-- 비회원 -->
			<sec:authorize access="isAnonymous()"><!-- 로그인 안됨 -->
				<a href="login.do">로그인</a>
				<a href="orderhistory.do">주문조회</a>
				<a href="wishlist.do">읽고 싶은 책</a>
				<a href="recentlyproducts.do">최근 본 도서</a>
				<a href="memberinfo.do">회원정보</a>
				<a href="mypost.do">내 게시물</a>
				<a href="addr.do">배송주소록</a>
			</sec:authorize>
			<!-- 회원 -->
			<sec:authorize access="isAuthenticated()"><!-- 로그인 O -->
				<a href="#"><sec:authentication property="principal.username" />님 환영합니다!</a>
				<a href="orderhistory.do">주문조회</a>
				<a href="wishlist.do">읽고 싶은 책</a>
				<a href="recentlyproducts.do">최근 본 도서</a>
				<a href="memberinfo.do">회원정보</a>
				<a href="mypost.do">내 게시물</a>
				<a href="addr.do">배송주소록</a>
				<a href="logout.do">로그아웃</a>
			</sec:authorize>
		</div>
		
		<!-- 장바구니 메뉴 (오른쪽에서 나오는 메뉴) -->
		<div id="cart-menu" class="side-menu-right">
			<button class="right-close-btn" onclick="closeMenu()">닫기</button>
			<a href="#">장바구니 항목 1</a>
			<a href="#">장바구니 항목 2</a>
		</div>