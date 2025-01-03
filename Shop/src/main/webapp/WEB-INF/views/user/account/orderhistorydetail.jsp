<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mypage.css">

    <main>
        <section>
            <div class="order-container">

                <h2>주문상세내역</h2>

				<span class="qq">주문 정보</span>
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
                            <td>${vo.ordered_name}</td>
                        </tr>
                        <tr>
                            <th>주문처리상태</th>
                            <td>
                           		<c:if test="${vo.ordered_status eq 'O' && vo.payment_type eq 'PC'}">상품 준비중</c:if>
                           		<c:if test="${vo.ordered_status eq 'D' && vo.payment_type eq 'PC'}">배송중</c:if>
                            	<c:if test="${vo.ordered_status eq 'CW' && vo.payment_type eq 'RW'}">취소 처리중</c:if>
                            	<c:if test="${vo.ordered_status eq 'CC' && vo.payment_type eq 'RC'}">취소 완료</c:if>
                           	</td>
                        </tr>
                    </tbody>
                </table>
                
				<span class="qq">주문 상품</span>
				<div>
					<c:forEach items="${list}" var="vo">
                    <div class="order-history-form2">
                        <div class="order-product">
                            <div style="display: flex;">
                                <img src="<%=request.getContextPath()%>/upload/${vo.attachment_detail_new_name}">
                                <div>
                                    <p>[${vo.category_name}] ${vo.product_name}</p>
                                    <p>${vo.product_author} 저 · ${vo.product_publisher}</p>
                                    <p style="margin-bottom: 15px;">${vo.ordered_detail_unit_price}원</p>
                                    <p>[${vo.ordered_detail_quantity}개]</p>
                                </div>
                            </div>
                            <span class="lp">${vo.ordered_status}</span>
                        </div>
                    </div>
                    </c:forEach>
                </div>

				<span class="qq">결제 정보</span>
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
<%-- 							<c:if test="${vo.ordered_detail_total_price >= 50000}">
	                            <td>${vo.ordered_detail_total_price}원</td>
							</c:if>
							<c:if test="${vo.ordered_detail_total_price < 50000}">
	                            <td>${vo.ordered_detail_total_price - 3000}원</td>
							</c:if> --%>
	                        <td>${vo.ordered_detail_total_price - 3000}원</td>
                        </tr>
                        <tr>
                            <th>배송비</th>
                            <td>
<%-- 								<c:if test="${vo.ordered_detail_total_price >= 50000}">
									무료
								</c:if>
								<c:if test="${vo.ordered_detail_total_price < 50000}">
									3,000원
								</c:if> --%>
								3,000원
                            </td>
                        </tr>
                    </tbody>
                </table>
                
				<span class="qq">배송지  정보</span>
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
                            <td>${fn:replace(vo.ordered_phone, ",", "-")}</td>
                        </tr>
                        <tr>
                            <th>배송지 메모</th>
                            <td>${vo.ordered_note}</td>
                        </tr>
                    </tbody>
                </table>
                <button class="dh-btn" onclick="location.href='orderhistory.do'" style="margin: 20px 0;">목록</button>
            </div>
        </section>
    </main>

<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>	
