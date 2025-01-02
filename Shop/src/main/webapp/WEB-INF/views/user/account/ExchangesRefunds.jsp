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
                <li><a href="ExchangesRefunds.do" style="text-decoration: underline;">교환 및 반품</a></li>
                <li><a href="FaultMisdelivery.do">불량/오배송 안내</a></li>
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
            <h3> 교환/반품 안내</h3>
            <div class="ShoppingGuideSection">
                <b>교환/반품 안내</b><br>
                - [추가 옵션] 상품은 옵션 부분 반품은 불가하며, 반품 시 2가지 옵션을 모두 동봉해 주셔야 합니다.<br>
                &nbsp;&nbsp;단품으로 보내주실 경우 반품 처리 불가하며, 미동봉 상품 추가 회수 시 배송비는 추가로 부담되실 수 있습니다.<br>
                - [배송 후 교환/반품] 게시판 또는 고객센터로 수령 후 영업일기준 7일이내에 접수해주시면, 기사님께서 영업일기준 1~3일안에 방문합니다.<br>
                - [타 택배사]을 이용하실 경우 선불로 보내주셔야 하며, '편의점 CJ택배' 또한 계약된 택배사가 아니므로 선불로 보내주셔야 합니다.<br>
                - [교환]은 동일 상품의 옵션 교환만 가능하며, 다른 상품으로 교환 불가하기 때문에 반품 후 새로 주문하셔야 합니다.<br>
                - [부분 출고]로 받아보신 상품은 교환/반품 시 각각 포장하실 경우 배송비가 여러 번 부담될 수 있어,<br>
                &nbsp;&nbsp;한 포장지에 모든 상품을 포장해 주셔야 배송비가 한 번만 부담됩니다.<br>
                - 조립식 박스의 경우 테이핑하지 않은 경우 내품 분실 우려가 있어, 테이핑하여 꼼꼼히 포장해 주셔야 하며, 분실 시 처리가 어렵습니다.<br>
            </div>
            
            <div class="ShoppingGuideSection">
                <b>반품주소</b><br>
                전북 전주시 덕진구 백제대로 572 5층 Libro<br>
            </div>
            
            <div class="ShoppingGuideSection">
                <b>교환, 반품 배송비 안내</b><br>
                [반품 배송비]<br>
                무료배송 상품으로 받으신 상품<br>
                -왕복 배송비 6,000원 고객님 부담입니다.<br>
                -제주/산간 지역은 14,000원 고객님 부담입니다.<br>
            </div>
            
            <div class="ShoppingGuideSection">
                일반 배송 상품으로 받으신 상품<br>
                -편도 배송비 3,000원 고객님 부담입니다.<br>
                -제주/산간 지역은 7,000원 고객님 부담입니다.<br>
            </div>
            
            <div class="ShoppingGuideSection">
                [교환 배송비]<br>
                -왕복 배송비 6,000원 고객님 부담입니다.</b><br>
                -제주/산간 지역은 14,000원 고객님 부담입니다.<br>
            </div>
                    
            <div class="ShoppingGuideSection">
                <b>[불량/오배송 배송비]</b><br>
                -교환/반품 배송비는 Libro에서 부담하며, 교환하실 경우 동일 상품으로만 교환 가능합니다.<br>
            </div>

            <div class="ShoppingGuideSection">
                <b>교환, 반품 처리 기간 안내</b><br>
                상품 보내주신 날로부터 영업일 기준 3~4일 이내에 처리됩니다<br>
            </div>

            <div class="ShoppingGuideSection">
                <b>환불 처리 안내</b><br>
                -무통장입금: 환불 접수 후 영업일 기준 1-2일 내에 확인 가능<br>
                -카드 결제: 취소 승인일로부터 3-5일 소요<br>
                -실시간계 좌이체: 취소 승인일로부터 3-5일 내에 결제하신 은행으로 자동 입금<br>
                -휴대폰결제(당월만 전체 취소 가능): 전체 취소시 승인일로부터 3-5일 소요<br>
                (휴대폰 결제시 부분 취소 불가하여, 환불받으시는 금액이 실구매금액의 50% 이하 : 현금 환불 또는 예치금 환불 환불받으시는 금액이 실구매금액의 50% 초과 : 무통장입금으로 재결제 후 전체 취소 또는 예치금 환불)<br>
            </div>

            <!-- <div class="ShoppingGuideSection">
                회원이신 경우 예치금 환불도 가능합니다. 예치금으로 환불받으시는 경우에는 결제하신 금액 그대로 환불됩니다.<br>
                예치금으로 환불받으신 후 다시 현금으로 환불이나 예치금을 부분적으로 사용하신 후 나머지 금액만 현금 환불은 불가한 점 양해 부탁드립니다.<br>
            </div> -->

            <div class="ShoppingGuideSection">
                <b>교환/반품이 불가능한 경우</b><br>
                - 상품 수령 후 영업일 기준 7일이 경과한 경우<br>
                - 공정거래 표준 약관 제15조 2항에 의한 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우 (착용 흔적, 오염, 냄새, 세탁한 상품, 택(바코드)이 제거된 상품 포함)<br>
                - 사용 후에 발견된 불량과 오배송 상품은 반품/교환 불가합니다. 제품의 초기 불량과 소비자 과실과의 책임 소지가 불분명해 불가피하게 마련된 규정이오니 양해 부탁드립니다.
            </div>

        </div>
    
        </section>
    </main>
    
<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>	