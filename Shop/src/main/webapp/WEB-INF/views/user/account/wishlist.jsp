<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mypage.css">

    <main>
        <section>
            <div class="wish-container">
                <h2>읽고 싶은 책</h2>
                <c:forEach items="${list}" var="vo">
                <div class="wish-list">
                    <div class="wish-item">
                        <div>
                            <img src="<%=request.getContextPath()%>/upload/${vo.attachment_detail_new_name}" style="width: 100px;">
                        </div>
                        <div class="book-info"> 
                            <div>
                                <span>${vo.product_name}</span><br>
                                <span>${vo.product_author} 저 · ${vo.product_publisher}</span><br>
                                <span>
                                    평균 <img src="https://img.icons8.com/?size=100&id=G4zH9X90bt1j&format=png&color=FFAA00" style="width: 20px;">${vo.review_starrating}(1398)
                                </span><br><br><br><br>
                                <span>${vo.product_price}</span>
                            </div>
                            <div class="imgs">
                                <a href="cartinsert.do?wishlist_no=${vo.wishlist_no}&product_no=${vo.product_no}">
	                                <img src="https://img.icons8.com/?size=100&id=TgHJI44zOCgU&format=png&color=000000">
                                </a>
                                <!-- 로그인 안됨 -->
                        		<sec:authorize access="isAnonymous()">
	                                <a href="wishlistdelete.do?wishlist_no=${vo.product_no}">
		                                <img src="https://img.icons8.com/?size=100&id=HjmbF5xvIBpl&format=png&color=000000">
	                                </a>
								</sec:authorize>
								<!-- 로그인 O -->
								<sec:authorize access="isAuthenticated()">
	                                <a href="wishlistdelete.do?wishlist_no=${vo.wishlist_no}">
		                                <img src="https://img.icons8.com/?size=100&id=HjmbF5xvIBpl&format=png&color=000000">
	                                </a>
								</sec:authorize>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>

            </div>
        </section>
    </main>

<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>	
