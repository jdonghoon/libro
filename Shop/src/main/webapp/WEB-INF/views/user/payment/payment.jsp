<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/menu.css">

<main class="main-container-payment">
  <!-- 상품 선택 -->
  <div class="first-container-payment">
    <div>
      <div class="orderer-info-title">주문 고객 정보</div>
      <div class="orderer-info-content">
        <div>주문자 id</div>
        <div>주문자 휴대폰 번호</div>
        <div>주문자 이메일</div>
      </div>
    </div>
    <div>
      <div class="address-info-title">배송지 정보</div>
      <div class="address-info-container">
        <div class="address-info-select">
          <input type="radio" name="selectaddress" id="option1" value="1">
          <label for="option1"> 배송지 목록
          
          <input type="radio" name="selectaddress" id="option2" value="2">
          <label for="option2"> 새로운 배송지
        </div>
        <!-- 배송지 목록 클릭 시 -->
        <div class="address-book-container">
          <div class="address-book-info">
            <div>
              <div>배송지명</div>
              <div>주문자 휴대폰 번호</div>
              <div>배송지 주소</div>
            </div>
            <div>
              <a href="#" onclick="">[수정]</a>
              <!-- 배송지 목록 -->
              <!--
              <div class="address-list-container">
                <div class="address-list">
                  <div>
                    <div>배송지명</div>
                    <div>주문자 휴대폰 번호</div>
                    <div>배송지 주소</div>
                  </div>
                  <div>
                    <button>선택</button>
                  </div>
                </div>
                <div class="address-list">
                  <div>
                    <div>배송지명</div>
                    <div>주문자 휴대폰 번호</div>
                    <div>배송지 주소</div>
                  </div>
                  <div>
                    <button>선택</button>
                  </div>
                </div>
              </div>
              --> 
            </div>
          </div>
          <!-- 새로운 배송지 -->
          <!-- 
          <div class="new-address-container">
            <div class="new-address-title">이름</div>
              <input type="text">
            <div class="new-address-title">휴대폰번호</div>
              <input type="text">
            <div class="new-address-title">주소</div>
              <input type="text" id="sample6_postcode" placeholder="우편번호">
              <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
              <input type="text" id="sample6_address" placeholder="주소"><br>
              <input type="text" id="sample6_detailAddress" placeholder="상세주소">
              <input type="text" id="sample6_extraAddress" placeholder="참고항목">
          </div>
          -->
          <div>
            <div class="address-memo-title">배송지 메모</div>
            <div class="address-memo-select">
              <select>
                <option>부재 시 문앞에 놓고 가주세요.</option>
                <option>멘트2</option>
                <option>멘트3</option>
                <option>멘트4</option>
              </select>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div>
      <div class="payment-method-title">결제 수단</div>
      <div class="payment-method-radio">
        <input type="radio" name="method" id="kakaopay" value="1">
        <label for="kakaopay"> kakaopay
        <br> 
        <input type="radio" name="method" id="banktransfer" value="1">
        <label for="banktransfer"> 무통장입금
      </div>
    </div>
  </div>

  <!-- 결제 내역 -->  
  <div class="payment-container">
    <form action="">
      <div class="payment-title">주문 합계</div>
      <div class="payment-display">
        <div>
          <div class="payment-info">
            <div>총 수량</div>
            <div class="payment-price">1</div>
          </div>
          <div class="payment-info">
            <div>상품금액</div>
            <div class="payment-price">100,000</div>
          </div>
          <div class="payment-info">
            <div>서비스 이용료</div>
            <div class="payment-price">10,000</div>
          </div>
          <div class="payment-total-info">
            <div>총 주문금액</div>
            <div class="payment-total-price">140,000</div>
          </div>
        </div>
        <div class="order-button">
          <button>주문하기</button>
        </div> 
      </div>
    </div>
  </form>
</main>

<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>	
