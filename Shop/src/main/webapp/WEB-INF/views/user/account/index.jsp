<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/styles.css">body>

    <header>
        <div class="header-container">
            <!-- 왼쪽 메뉴 -->
            <div class="menu">
                <button onclick="toggleSideMenu('sub')" class="btn">메뉴</button>
            </div>
            
            <!-- 가운데 로고 -->
            <div class="logo">
                <a href="index.do"><h1>꿈꾸는 책방</h1></a>
            </div>
            
            <!-- 오른쪽 검색, 로그인, 장바구니 -->
            <div class="header-right">
                <!-- 검색창 -->
                <div class="search-box">
                    <button id="search-btn" onclick="toggleSearch()" class="btn">검색</button>
                    <div id="search-container" class="hidden">
                        <input type="text" id="search-input" placeholder="검색어 입력">
                    </div>
                </div>
                <button onclick="toggleSideMenu('login')" class="btn">로그인</button>
                <button onclick="toggleSideMenu('cart')" class="btn">장바구니</button>
            </div>
        </div>
    </header>

    <!-- 서브 메뉴 (왼쪽에서 나오는 메뉴) -->
    <div id="sub-menu" class="side-menu-left">
        <button class="left-close-btn" onclick="closeMenu()">닫기</button>
        <a href="#">신간 도서</a>
        <a href="#">베스트셀러</a>
        <a href="#">전체 도서</a>
        <a href="#">구매 가이드</a>
        <a href="#">문의하기</a>
    </div>

    <!-- 로그인 메뉴 (오른쪽에서 나오는 메뉴) -->
    <div id="login-menu" class="side-menu-right">
        <button class="right-close-btn" onclick="closeMenu()">닫기</button>
        <!-- 비회원 -->
        <a href="login.do">로그인</a>
        <a href="orderhistory.do">주문조회</a>
        <a href="wishlist.do">읽고 싶은 책</a>
        <a href="recentlyproducts.do">최근 본 도서</a>
        <a href="memberinfo.do">회원정보</a>
        <a href="mypost.do">내 게시물</a>
        <a href="addr.do">배송주소록</a>
        <!-- 회원 -->
        <a href="#">로그아웃</a>
    </div>

    <!-- 장바구니 메뉴 (오른쪽에서 나오는 메뉴) -->
    <div id="cart-menu" class="side-menu-right">
        <button class="right-close-btn" onclick="closeMenu()">닫기</button>
        <a href="#">장바구니 항목 1</a>
        <a href="#">장바구니 항목 2</a>
    </div>

    <footer>
        <p>Footer Content</p>
    </footer>

    <script src="script.js"></script>
    </body>
</html>
