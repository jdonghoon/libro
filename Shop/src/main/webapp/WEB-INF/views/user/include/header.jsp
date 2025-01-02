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
					<button onclick="toggleSideMenu('sub')" class="btn">SHOP</button>
				</div>
				
				<!-- 가운데 로고 -->
				<div class="logo">
					<a href="<%= request.getContextPath() %>"><h1>L i b r o</h1></a>
				</div>
				
				<!-- 오른쪽 검색, 로그인, 장바구니 -->
				<div class="header-right">
					<!-- 검색창 -->
					<div class="search-box">
						<button id="search-btn" onclick="toggleSearch()" class="btn">SEARCH</button>
						<div id="search-container" class="hidden">
							<form action="indexSearch.do?searchValue=${searchValue}" method="get">
								<input type="text" id="search-input" name="searchValue" placeholder="검색어 입력">
							</form>
						</div>
					</div>
					<%-- <button onclick="location.href='<%=request.getContextPath()%>/admin/index.do'" class="btn">관리자</button> --%>
					<button onclick="toggleSideMenu('login')" class="btn">ACCOUNT</button>
					<button onclick="toggleSideMenu('cart')" class="btn" id="cartBtn">BAG</button>
				</div>
			</div>
		</header>
		
		<!-- 서브 메뉴 (왼쪽에서 나오는 메뉴) -->
		<div id="sub-menu" class="side-menu-left">
			<button class="left-close-btn" onclick="closeMenu()">닫기</button>
			<a href="newList.do">신간 도서</a>
			<a href="bestsellerList.do">베스트셀러</a>
			<a href="totalList.do">전체 도서</a>
			<a href="Shipping.do">쇼핑가이드</a>
			<a href="inquiry.do">문의하기</a>
		</div>
		
		<!-- 로그인 메뉴 (오른쪽에서 나오는 메뉴) -->
		<div id="login-menu" class="side-menu-right-1">
			<button class="right-close-btn" onclick="closeMenu()">닫기</button>
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
		</div>
		
		<!-- 장바구니 메뉴 (오른쪽에서 나오는 메뉴) -->
		<div id="cart-menu" class="side-menu-right-2">
			<button class="right-close-btn" onclick="closeMenu()">닫기</button>
			<div class="cart-right"></div>
			<button onclick="window.location.href='cart.do';" class="cart-btnvv">장바구니로 이동</button>
		</div>
		<script>
		// 장바구니 데이터 조회
		const cartBnt = document.getElementById('cartBtn');
		cartBnt.addEventListener("click", selectCart);
		
		function selectCart() {
			$.ajax({
				url: "selectCart.do",
				type: "GET",
				success: function(response) {
					console.log(response);
					
					const cartMenu = document.getElementById('cart-menu');
					const cartList = cartMenu.querySelector('div');
					cartList.innerHTML = "";
					
					if (response.length > 0) {
		                let html = "";
		                response.forEach(item => {
		                	
		                	console.log(item);
		                	
		                    html += `
	                    	<div class="cart-menu-container">
		                    	<div class="cart-info-container">
			                    	<div>
				                    	<a href="product.do?product_no=\${item.product_no}">
			      	            			<img src="<%=request.getContextPath()%>/upload/\${item.attachment_detail_new_name}" width="100px" height="150px;">
		      	            			</a>
	      	            			</div>
		      	            		<div class="cart-info">
		      	            			<div class="cart-title">\${item.product_name}</div>
		      	                		<div class="cart-writer">\${item.product_author}</div>
		      	                		<div class="cart-price">\${item.product_price}</div>
			      	            	</div>
		      	            	</div>
		      	            	<div>
		      	            		/* 비회원 */
		      	            		<sec:authorize access="isAnonymous()">
		      	            		<a href="#" onclick="deleteCartList(\${item.product_no})">
		      	            			<img src="https://img.icons8.com/?size=100&id=82771&format=png&color=000000" width="20px;">
		      	            		</a>
									</sec:authorize>
									/* 회원 */
									<sec:authorize access="isAuthenticated()">
		      	            		<a href="#" onclick="deleteCartList(\${item.cart_no})">
		      	            			<img src="https://img.icons8.com/?size=100&id=82771&format=png&color=000000" width="20px;">
		      	            		</a>
									</sec:authorize>
		      	            	</div>
	      	            	</div>
		                    `;
		                });
		                cartList.innerHTML = html; // 생성한 HTML 삽입
		            } else {
		                cartList.innerHTML = "<p>장바구니에 상품이 없습니다.</p>";
		            }
				},
		        error: function (xhr, status, error) {
		            console.error("AJAX Error:", status, error);
		            alert("장바구니 데이터를 불러오지 못했습니다. 다시 시도해주세요.");
		        }
			});	
		}
		
		function deleteCartList(cart_no) {
			$.ajax({
				url: "deleteCart.do",
				type: "POST",
				data: {cart_no : cart_no},
				success: function(response) {
					console.log(response);
					
					if(response > 0) {
						alert("상품이 삭제 되었습니다.");
						selectCart();
					} else {
						alert("상품이 삭제되지 않았습니다.");
					}
				},
		        error: function (xhr, status, error) {
		            console.error("AJAX Error:", status, error);
		            alert("상품이 삭제되지 못했습니다. 다시 시도해주세요.");
		        }
			});
		}
			
		</script>