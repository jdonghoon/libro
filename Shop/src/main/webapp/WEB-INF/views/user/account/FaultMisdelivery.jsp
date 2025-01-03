<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mypage.css">

    <main>
        <section style="display: flex;">

        <div class="ShoppingGuideMenu">
            <ul>
                <li><a href="Shipping.do">배송</a></li>
                <li><a href="CancelChange.do">취소/변경</a></li>
                <li><a href="ExchangesRefunds.do">교환 및 반품</a></li>
                <li><a href="FaultMisdelivery.do" style="text-decoration: underline;">불량/오배송 안내</a></li>
                <!-- <li><a href="#">멤버십 혜택 안내</a></li>
                <li><a href="#">리뷰 적립금 안내</a></li>
                <li><a href="#">쿠폰</a></li>
                <li><a href="#">적립금</a></li>
                <li><a href="#">예치금</a></li>
                <li><a href="#">공지사항</a></li> 
                <li><a href="#">내 게시물</a></li>
                <li><a href="#">문의하기</a></li> -->
            </ul>
        </div>
        <div class="ShoppingGuideContent">

            <h3>상품 불량 / 오배송 안내</h3>
            <div class="ShoppingGuideSection">
                <b>불량 상품을 받으신 경우</b><br>
                불량이 잘 보이도록 찍으신 사진과 함께 불량에 관하여 설명을 같이 적어주시면 빠른 처리 가능합니다.
            </div>
            
            <div class="ShoppingGuideSection">
                <b>오배송 상품을 받으신 경우</b><br>
                전체적으로 상품이 보이도록 찍으신 사진을 올려주셔야 빠른 처리 가능합니다. 또한, 상품을 저희에게 보내주실 때 받아보신 그대로 포장해서 보내주셔야 합니다.<br>
                불량/오배송 상품을 받은 경우 1:1 문의 남겨주시면 빠른 답변 안내 드리겠습니다.<br>
                기사님 방문 접수도 자동으로 해드리고 있으니 혹시 원치 않으시거나 수령하신 주소가 아닌 다른 주소로 기사님이 방문하셔야 한다면 꼭 미리 말씀 부탁드립니다.
            </div>
            
            <div class="ShoppingGuideSection">
                <b>불량/오배송이어도 교환/반품 불가한 경우</b><br>
                사용 후에 발견된 불량/오배송은 반품/교환 불가합니다.<br>
                제품의 초기 불량과 소비자 과실과의 책임 소지가 불분명해 불가피하게 마련된 규정이오니 양해 부탁드리며, 사용 전 꼭 상품 확인 부탁드립니다.<br>
                비회원으로 문의하실 경우엔 동명이인으로 인해 주문정보와 함께 남겨주셔야 바로 처리 가능합니다.<br>
                불량/오배송으로 불편 드리는 일이 없도록 최선을 다해 개선하려 노력하겠습니다.
            </div>              
    
        </div>
    
        </section>
    </main>
    
<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>	
