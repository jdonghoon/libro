<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mypage.css">

    <main>
        <section>
            <div class="recentlyproducts-container">
                <h2>최근 본 상품</h2>
                <c:forEach items="${list}" var="vo">
                	<!-- 판매 -->
                	<c:if test="${vo.product_status == 'E'}">
	                <div class="recentlyproducts-list">
	                    <div class="recentlyproducts-item">
	                        <div>
	                            <img src="<%=request.getContextPath()%>/upload/${vo.attachment_detail_new_name}" style="width: 100px;">
	                        </div>
	                        <div class="book-info">
	                            <div>
	                                <span>${vo.product_name}</span><br>
	                                <span>${vo.product_author} 저 · ${vo.product_publisher}</span><br>
	                                <span style="display: flex; align-items: center;">
	                                    평균 <img src="https://img.icons8.com/?size=100&id=G4zH9X90bt1j&format=png&color=FFAA00" style="width: 20px;">
	                                    <c:if test="${empty vo.review_starrating_avg}">
	                                    	0
	                                    </c:if>
	                                    <c:if test="${not empty vo.review_starrating_avg}">
		                                    ${vo.review_starrating_avg}
	                                    </c:if>
	                                    (${vo.review_cnt})
	                                </span><br><br>
	                                <span>${vo.product_price}원</span>
	                            </div>
	                            <div class="imgs"> 
	                                <a href="wishlistinsert.do?product_no=${vo.product_no}">
	                                	<img src="https://img.icons8.com/?size=100&id=XjcL8Du609Vi&format=png&color=000000">
	                                </a>
	                                <a href="retocartinsert.do?product_no=${vo.product_no}">
	                                	<img src="https://img.icons8.com/?size=100&id=TgHJI44zOCgU&format=png&color=000000">
	                                </a>
	                                <!-- 로그인 X -->
	                        		<sec:authorize access="isAnonymous()">
		                                <a href="recentlyproductdelete.do?recentlyproduct_no=${vo.product_no}">
			                                <img src="https://img.icons8.com/?size=100&id=HjmbF5xvIBpl&format=png&color=000000">
		                                </a>
									</sec:authorize>
									<!-- 로그인 O -->
									<sec:authorize access="isAuthenticated()">
		                                <a href="recentlyproductdelete.do?recentlyproduct_no=${vo.recentlyproduct_no}">
			                                <img src="https://img.icons8.com/?size=100&id=HjmbF5xvIBpl&format=png&color=000000">
		                                </a>
									</sec:authorize>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                </c:if>
	                <!-- 품절 -->
	                <c:if test="${vo.product_status == 'S'}">
	                <div class="recentlyproducts-list">
	                    <div class="recentlyproducts-item">
	                        <div>
	                            <img src="<%=request.getContextPath()%>/upload/${vo.attachment_detail_new_name}" style="width: 100px;">
	                        </div>
	                        <div class="book-info" style="color: gray;">
	                            <div>
	                                <span>${vo.product_name}</span><br>
	                                <span>${vo.product_author} 저 · ${vo.product_publisher}</span><br>
	                                <span style="display: flex; align-items: center;">
	                                    평균 <img src="https://img.icons8.com/?size=100&id=G4zH9X90bt1j&format=png&color=FFAA00" style="width: 20px;">
	                                    <c:if test="${empty vo.review_starrating_avg}">
	                                    	0
	                                    </c:if>
	                                    <c:if test="${not empty vo.review_starrating_avg}">
		                                    ${vo.review_starrating_avg}
	                                    </c:if>
	                                    (${vo.review_cnt})
	                                </span><br>	                                
	                                <span style="display: flex; align-items: center;">
										<img src="https://img.icons8.com/?size=100&id=pHtKLuytfhLc&format=png&color=FF0000" style="width: 20px;">품절
	                                </span>
	                                <span>${vo.product_price}원</span>
	                            </div>
	                            <div class="imgs"> 
	                                <a href="cartinsert.do?wishlist_no=${vo.wishlist_no}&product_no=${vo.product_no}">
										<img src="https://img.icons8.com/?size=100&id=iq9wxdOffqy7&format=png&color=000000">
	                                </a>
	                                <!-- 로그인 X -->
	                        		<sec:authorize access="isAnonymous()">
		                                <a href="recentlyproductdelete.do?recentlyproduct_no=${vo.product_no}">
			                                <img src="https://img.icons8.com/?size=100&id=HjmbF5xvIBpl&format=png&color=000000">
		                                </a>
									</sec:authorize>
									<!-- 로그인 O -->
									<sec:authorize access="isAuthenticated()">
		                                <a href="recentlyproductdelete.do?recentlyproduct_no=${vo.recentlyproduct_no}">
			                                <img src="https://img.icons8.com/?size=100&id=HjmbF5xvIBpl&format=png&color=000000">
		                                </a>
									</sec:authorize>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                </c:if>
	                <!-- 판매 중단 -->
	                <c:if test="${vo.product_status == 'D'}">
	                <div class="recentlyproducts-list">
	                    <div class="recentlyproducts-item">
	                        <div>
	                            <img src="<%=request.getContextPath()%>/upload/${vo.attachment_detail_new_name}" style="width: 100px;">
	                        </div>
	                        <div class="book-info" style="color: gray;">
	                            <div>
	                                <span style="display: flex; align-items: center;">
										<img src="https://img.icons8.com/?size=100&id=pHtKLuytfhLc&format=png&color=000000" style="width: 20px;">더 이상 판매하지 않는 상품입니다.
	                                </span>
	                            </div>
	                            <div class="imgs"> 
	                                <!-- 로그인 X -->
	                        		<sec:authorize access="isAnonymous()">
		                                <a href="recentlyproductdelete.do?recentlyproduct_no=${vo.product_no}">
			                                <img src="https://img.icons8.com/?size=100&id=HjmbF5xvIBpl&format=png&color=000000">
		                                </a>
									</sec:authorize>
									<!-- 로그인 O -->
									<sec:authorize access="isAuthenticated()">
		                                <a href="recentlyproductdelete.do?recentlyproduct_no=${vo.recentlyproduct_no}">
			                                <img src="https://img.icons8.com/?size=100&id=HjmbF5xvIBpl&format=png&color=000000">
		                                </a>
									</sec:authorize>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                </c:if>
                </c:forEach>
            </div>
        </section>
    </main>

<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>	
