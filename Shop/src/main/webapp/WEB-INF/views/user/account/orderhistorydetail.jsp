<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mypage.css">

    <main>
        <section>
            <div class="order-container">

                <h2>주문상세내역</h2>

                주문 정보
                <table class="order-detail">
                    <tbody>
                        <tr>
                            <th>주문번호</th>
                            <td>${vo.ordered_no}</td>
                        </tr>
                        <tr>
                            <th>주문일자</th>
                            <td>${vo.ordered_date}</td>
                        </tr>
                        <tr>
                            <th>주문자</th>
                            <td>${vo.user_name}</td>
                        </tr>
                        <tr>
                            <th>주문처리상태</th>
                            <td>${vo.ordered_status}</td>
                        </tr>
                    </tbody>
                </table>

                주문상품
                <table class="order-detail">
                    <thead>
                        <tr>
                            <th>상품명</th>
                            <th>수량</th>
                            <th>주문금액</th>
                        </tr>
                    </thead>
                    <tbody>
						<c:forEach items="${list}" var="vo">
	                        <tr>
	                            <td>
	                                <a href="#">[${vo.category_name}]${vo.product_name}</a><!-- 상품 상세 링크 달기 -->
	                            </td>
	                            <td>${vo.ordered_detail_quantity}</td>
	                            <td>${vo.ordered_detail_unit_price}</td>
	                        </tr>
                        </c:forEach>
                    </tbody>
                </table>

                결제 정보
                <table class="order-detail">
                    <tbody>
                        <tr>
                            <th>결제수단</th>
                            <td>${vo.payment_method}</td>
                        </tr>
                        <tr>
                            <th>총 결제금액</th>
                            <td>${vo.ordered_detail_total_price}원</td>
                        </tr>
                        <tr>
                            <th>상품구매금액</th>
                            <td>${vo.ordered_detail_total_price}원</td>
                        </tr>
                        <tr>
                            <th>배송비</th>
                            <td>
								<c:if test="${vo.ordered_detail_total_price >= 50000}">
									무료
								</c:if>
								<c:if test="${vo.ordered_detail_total_price < 50000}">
									2,500원
								</c:if>
                            </td>
                        </tr>
                    </tbody>
                </table>

                배송지 정보
                <table class="order-detail">
                    <tbody>
                        <tr>
                            <th>이름</th>
                            <td>${vo.ordered_name}</td>
                        </tr>
                        <tr>
                            <th>주소</th>
                            <td>${vo.ordered_address}</td>
                        </tr>
                        <tr>
                            <th>휴대폰 번호</th>
                            <td>${vo.ordered_phone}</td>
                        </tr>
                        <tr>
                            <th>배송지 메모</th>
                            <td>${vo.ordered_note}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
    </main>

<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>	
