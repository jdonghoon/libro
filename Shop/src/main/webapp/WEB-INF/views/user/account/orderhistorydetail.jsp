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
                            <td>1234567</td>
                        </tr>
                        <tr>
                            <th>주문일자</th>
                            <td>2024.12.03</td>
                        </tr>
                        <tr>
                            <th>주문자</th>
                            <td>홍길동</td>
                        </tr>
                        <tr>
                            <th>주문처리상태</th>
                            <td>배송완료</td>
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
                        <tr>
                            <td>
                                <a href="orderhistorydetail.do">[소설]채식주의자</a>
                            </td>
                            <td>1</td>
                            <td>13,500</td>
                        </tr>
                        <tr>
                            <td>
                                <a href="orderhistorydetail.do">[소설]소년이 온다</a>
                            </td>
                            <td>1</td>
                            <td>13,500</td>
                        </tr>
                    </tbody>
                </table>

                결제 정보
                <table class="order-detail">
                    <tbody>
                        <tr>
                            <th>결제수단</th>
                            <td>카드</td>
                        </tr>
                        <tr>
                            <th>총 결제금액</th>
                            <td>29,500원</td>
                        </tr>
                        <tr>
                            <th>상품구매금액</th>
                            <td>27,500원</td>
                        </tr>
                        <tr>
                            <th>배송비</th>
                            <td>2,500원</td>
                        </tr>
                    </tbody>
                </table>

                배송지 정보
                <table class="order-detail">
                    <tbody>
                        <tr>
                            <th>이름</th>
                            <td>홍길동</td>
                        </tr>
                        <tr>
                            <th>주소</th>
                            <td>전라북도 전주시 덕진구 백제대로 572 5층</td>
                        </tr>
                        <tr>
                            <th>휴대폰 번호</th>
                            <td>010-1234-5678</td>
                        </tr>
                        <tr>
                            <th>배송지 메모</th>
                            <td>부재시 경비실에 맡겨주세요.</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
    </main>

<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>	
