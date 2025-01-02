<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mypage.css">

    <main>
        <section style="display: flex;">

        <div class="ShoppingGuideMenu">
            <ul>
                <li><a href="Shipping.do" style="text-decoration: underline;">배송</a></li>
                <li><a href="CancelChange.do">취소/변경</a></li>
                <li><a href="ExchangesRefunds.do">교환 및 반품</a></li>
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
            
            <h3>배송 안내</h3>
            <div class="ShoppingGuideSection">
                주문 접수 후 상품 준비기간은 영업일 기준 3일 정도 소요됩니다. 거래처 사정에 따라 더 소요될 수 있으며 부득이하게 입고 지연되는 경우 알림톡으로 안내드리니 양해 부탁드립니다.
            </div>
            
            <div class="ShoppingGuideSection">
                오후 4시까지 결제 완료 및 재고가 있는 경우 당일 발송 가능하며, 오후 4시 이후 결제 완료 주문건은 다음날 접수됩니다.<br>
                입고, 발송 여부는 오후 4시 이후 연락 주시면 안내 받으실 수 있으며 당일 출고 어려운것으로 안내받으신 경우 익일 같은 시간에 문의 부탁드립니다.
            </div>
            
            <div class="ShoppingGuideSection">
                *오늘출발 2시 마감/ 오늘도착 오후 1시 마감<br>
                *금요일 오후 3시 마감
            </div>
            
            <div class="ShoppingGuideSection">
                5만원 이상 주문 시 무료배송되며 5만원 미만 주문 시 기본배송비 3,000원입니다.<br>
                (제주/도서산간 지역은 추가운임료 4,000원 발생)
            </div>
            
            <div class="ShoppingGuideSection">
                <b>부분 배송 안내</b>
                상품 준비기간 (주말, 공휴일 제외 영업일 기준 3일) 이후 준비된 상품은 부분배송일 기준에 따라 부분 발송됩니다.<br>
                준비 기간 내에 부분발송을 원하시는 경우 배송비 2,500원이 추가 부담됩니다.<br>
                *부분 배송을 원하지 않는 경우 배송 전 말씀해주셔야 합니다.<br>
                (주문번호가 달라도 수령자 정보가 같으면 묶음 배송 처리될 수 있으며 원치 않으시는 경우 1:1문의 또는 고객센터로 연락 부탁드립니다)
            </div>
                    
            <div class="ShoppingGuideSection">
                <b>[오늘출발] - 전 지역<br>
                [오늘도착]<br>
                - 서울, 고양, 성남, 부천, 안양, 인천시 부평구, 수원시 팔달구, 수원시 영통구, 의정부시, 구리시 전 지역<br>
                - 경기, 인천 일부 지역</b><br>
                배송비 : 일반 배송비 적용 / 7만원 이상 무료배송<br>
                * 이외의 오늘도착 서비스 가능 지역은 주문서에서 확인 가능합니다.<br>
                *기상악화 시 당일 수령이 어려울 수 있는 점 양해 부탁드립니다.<br>
            </div>

            <div class="ShoppingGuideSection">
                <b>배송조회</b><br>
                <a href="#" style="text-decoration: underline;">배송조회하기 (CJ대한통운 페이지로 이동)</a>
            </div>
                
    
        </div>
    
        </section>
    </main>
    
<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>	