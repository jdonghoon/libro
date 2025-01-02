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
                <li><a href="CancelChange.do" style="text-decoration: underline;">취소/변경</a></li>
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
            <h3>취소/변경 안내</h3>
            <div class="ShoppingGuideSection">
                배송 전 상품/배송지 변경/추가 주문 문의 시 1:1 문의로 요청을 남겨주세요.<br>
                (오전 10시 출고작업으로 발송된 경우에는 처리가 어렵습니다.)
            </div>
            
            <div class="ShoppingGuideSection">
                ‘상품 준비중’ 상태에서는 사이트 내 주문조회에서 직접 취소가 가능하며 ‘배송 준비중’ 상태에서는 발송되었을 수 있기 때문에 취소/변경이 불가할 수 있습니다.<br>
                오전 10시 이후 주문건을 변경원하는 경우 채팅상담 또는 고객센터(1234-1234)로 문의해주시기바랍니다.
            </div>
            
            <div class="ShoppingGuideSection">
                변경 요청을 하시는 경우 변경을 원하시는 상품의 정확한 이름을 기재해 주세요.<br>
            </div>
            
            <div class="ShoppingGuideSection">
                *정확하지 않은 요청사항은 재확인이 필요하여, 시간이 더 소요되는 점 참고해주세요.<br>
                *배송 전 상품을 변경한 경우 변경된 상품의 재고 사정에 따라 배송일정이 늦어질 수 있습니다.
            </div>
            
            <div class="ShoppingGuideSection">
                주문 상태가 배송준비중인 경우에도 배송작업이 시작되어 고객님의 상품을 이미 포장해 CJ대한통운으로 발송된상태일 수 있습니다.<br>
                이 경우 변경/취소를 원하시면 수령 후 배송비를 부담하여 교환/반품해야 하오니 양해 부탁드립니다.
            </div>               
    
        </div>
    
        </section>
    </main>
    
<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>	
