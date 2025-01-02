<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/menu.css">
<main class="main-container-payment">
  <div class="first-container-payment">
    <div class="payment-success-container">
      <h2 class="payment-success-title">결제가 성공적으로 완료되었습니다!</h2>
      <%-- <p class="payment-success-message">주문 번호: <strong>${orderNumber}</strong></p>
      <p class="payment-success-message">결제 금액: <strong>${orderAmount.toLocaleString()}원</strong></p>
      <p class="payment-success-message">결제 일시: <strong>${paymentDate}</strong></p>

      <h3 class="order-info-title">주문 정보</h3>
      <div class="order-info-container">
        <p><strong>주문자 이름:</strong> ${userInfo.user_name}</p>
        <p><strong>전화번호:</strong> ${userInfo.user_phone}</p>
        <p><strong>이메일:</strong> ${userInfo.user_email}</p>
      </div>

      <h3 class="delivery-info-title">배송 정보</h3>
      <div class="delivery-info-container">
        <p><strong>배송지:</strong> ${deliveryInfo.ordered_address}</p>
        <p><strong>메모:</strong> ${deliveryInfo.ordered_note}</p>
      </div> --%>

      <div class="payment-actions">
        <a href="<%=request.getContextPath()%>/orderhistory.do" class="btn btn-primary">주문 내역 보기</a>
        <a href="<%=request.getContextPath()%>/" class="btn btn-secondary">메인으로 이동</a>
      </div>
    </div>
  </div>
</main>

<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>
