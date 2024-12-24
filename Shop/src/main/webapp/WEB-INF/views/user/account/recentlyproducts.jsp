<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mypage.css">

    <main>
        <section>
            <div class="recentlyproducts-container">
                <h2>최근 본 상품</h2>
                <c:forEach items="${list}" var="vo">
                <div class="recentlyproducts-list">
                    <div class="recentlyproducts-item">
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
                                <!-- 로그인 X -->
                        		<sec:authorize access="isAnonymous()">
	                                <a href="wishlistinsert.do?product_no=${vo.product_no}">
	                                	<img src="https://img.icons8.com/?size=100&id=XjcL8Du609Vi&format=png&color=000000">
	                                </a>
	                                <a href="#">
	                                	<img src="https://img.icons8.com/?size=100&id=TgHJI44zOCgU&format=png&color=000000">
	                                </a>
	                                <a href="recentlyproductdelete.do?recentlyproduct_no=${vo.product_no}">
		                                <img src="https://img.icons8.com/?size=100&id=HjmbF5xvIBpl&format=png&color=000000">
	                                </a>
								</sec:authorize>
								<!-- 로그인 O -->
								<sec:authorize access="isAuthenticated()">
	                                <a href="wishlistinsert.do?product_no=${vo.product_no}">
		                                <img src="https://img.icons8.com/?size=100&id=XjcL8Du609Vi&format=png&color=000000">
	                                </a>
	                                <a href="#">
		                                <img src="https://img.icons8.com/?size=100&id=TgHJI44zOCgU&format=png&color=000000">
	                                </a>
	                                <a href="recentlyproductdelete.do?recentlyproduct_no=${vo.recentlyproduct_no}">
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
