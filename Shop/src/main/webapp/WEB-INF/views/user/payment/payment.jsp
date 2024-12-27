<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/menu.css">

<main class="main-container-payment">
  <!-- 상품 선택 -->
  <div class="first-container-payment">
  
  <!-- 회원 일 때 -->
  	<c:if test="${not empty userInfo.user_name}">
    <div>
      <div class="orderer-info-title">주문 고객 정보</div>
      <div class="orderer-info-content">
        <div>${userInfo.user_name}</div>
        <div>${userInfo.user_phone}</div>
        <div>${userInfo.user_email}</div>
      </div>
    </div>
    
    <div>
      <div class="address-info-title">배송지 정보</div>
      <div class="address-info-container">
        <div class="address-info-select">
          <input type="radio" name="selectaddress" id="option1" value="1" checked >
          <label for="option1"> 기본 배송지
          
          <input type="radio" name="selectaddress" id="option2" value="2">
          <label for="option2"> 새로운 배송지
        </div>
        
        <!-- 기본 배송지 클릭 시 -->
        <div class="address-book-container">
          <div class="address-book-info">
            <div>
              <div>${userInfo.address_book_addressname}</div>
              <div>${userInfo.address_book_phone}</div>
              <div>${userInfo.address_book_address}, ${userInfo.address_book_detailaddress}</div>
            </div>
            <div>
              <a href="#" onclick="">[수정]</a>
              <!-- 배송지 목록 -->
	            <div class="address-list-container">
	              <c:forEach items="${addressInfo}" var="vo">
	                <div class="address-list">
	                  <div>
	                    <div>${vo.address_book_addressname}</div>
	                    <div>${vo.address_book_phone}</div>
	                    <div>${vo.address_book_address}, ${vo.address_book_detailaddress}</div>
	                  </div>
	                  <div>
	                    <button class="select-address-btn" 
	                    data-name="${vo.address_book_addressname}" 
	                    data-phone="${vo.address_book_phone}" 
	                    data-address="${vo.address_book_address}, ${vo.address_book_detailaddress}">선택</button>
	                  </div>
	                </div>
              	  </c:forEach>
	            </div>
            </div>
          </div>
         </div>
          <!-- 새로운 배송지 -->
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
    </c:if>
    
    <!-- 비회원일 때 -->
    <c:if test="${empty userInfo.user_name}">
    
    <div>
      <div class="address-info-title">배송지 정보</div>
      <div class="address-info-container">
        <div class="address-info-select">          
          <input type="radio" name="selectaddress" id="option2" value="2" checked>
          <label for="option2"> 새로운 배송지
        </div>
        
          <!-- 새로운 배송지 -->
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
    </c:if>
    <script>
	 // 초기값 설정: 기본 배송지 선택 시 보여주기
	    document.addEventListener('DOMContentLoaded', function() {
	      document.getElementById('option1').checked = true; // 기본 배송지 선택
	      document.querySelector('.address-book-container').style.display = 'block'; // 기본 배송지 보여주기
	      document.querySelector('.new-address-container').style.display = 'none';   // 새로운 배송지 숨기기
	    });
	
	    document.getElementById('option1').addEventListener('change', function() {
	      if (this.checked) {
	        document.querySelector('.address-book-container').style.display = 'block'; // 기본 배송지 보기
	        document.querySelector('.new-address-container').style.display = 'none';   // 새로운 배송지 숨기기
	      }
	    });
	
	    document.getElementById('option2').addEventListener('change', function() {
	      if (this.checked) {
	        document.querySelector('.new-address-container').style.display = 'block';   // 새로운 배송지 보이기
	        document.querySelector('.address-book-container').style.display = 'none'; // 기본 배송지 보기
	      }
	    });
	
	    let isListVisible = false; // 상태 변수 설정

	    document.querySelector('.address-book-info a').addEventListener('click', function(event) {
	      event.preventDefault();
	      
	      isListVisible = !isListVisible; // 상태 토글
	      
	      const addressListContainer = document.querySelector('.address-list-container');
	      if (isListVisible) {
	        addressListContainer.style.display = 'block'; // 목록 보이기
	      } else {
	        addressListContainer.style.display = 'none'; // 목록 숨기기
	      }
	    });
	    
	 	// 주소록에서 "선택" 버튼 클릭 시 기본 배송지 정보 변경
	    document.querySelectorAll('.select-address-btn').forEach(button => {
	      button.addEventListener('click', function () {
	        const name = this.dataset.name; // 버튼의 데이터 속성에서 이름 가져오기
	        const phone = this.dataset.phone; // 버튼의 데이터 속성에서 전화번호 가져오기
	        const address = this.dataset.address; // 버튼의 데이터 속성에서 주소 가져오기

	        // 기본 배송지 정보 업데이트
	        const addressInfoContainer = document.querySelector('.address-book-info > div');
	        addressInfoContainer.innerHTML = `
	          <div>\${name}</div>
	          <div>\${phone}</div>
	          <div>\${address}</div>
	        `;

	        // 주소 목록 숨기기
	        document.querySelector('.address-list-container').style.display = 'none';
	      });
	    });
	</script>

    <div>
      <div class="payment-method-title">결제 수단</div>
      <div class="payment-method-radio">
        <input type="radio" name="method" id="kakaopay" value="1" checked>
        <label for="kakaopay"> kakaopay
      </div>
    </div>
  </div>

  <!-- 결제 내역 -->  
  <div class="payment-container">
    <form action="">
      <div class="payment-title">주문 합계</div>
      <div class="payment-display">
        <div>
          <c:set var="cartSummary" value="${sessionScope.cartSummary}"/>
          <div class="payment-info">
		    <div>총 수량</div>
		    <div class="payment-price">
		        <c:choose>
		            <c:when test="${cartSummary.totalQuantity != null}">
		                ${cartSummary.totalQuantity}
		            </c:when>
		            <c:otherwise>
		                0
		            </c:otherwise>
		        </c:choose>
		    </div>
		  </div>
		  
          <div class="payment-info">
            <div>상품금액</div>
            <div class="payment-price">
		        <c:choose>
		            <c:when test="${cartSummary.totalPrice != null}">
		                ${cartSummary.totalPrice}
		            </c:when>
		            <c:otherwise>
		                0
		            </c:otherwise>
		        </c:choose>
		    </div>
          </div>
          
          <div class="payment-info">
            <div>배송비</div>
            <div class="payment-price">3,000</div>
          </div>
          <div class="payment-total-info">
            <div>총 주문금액</div>
            <div class="payment-total-price">
		        <c:choose>
		            <c:when test="${cartSummary.totalPrice != null && cartSummary.shippingFee != null}">
		                ${cartSummary.totalPrice + cartSummary.shippingFee}
		            </c:when>
		            <c:otherwise>
		                0
		            </c:otherwise>
		        </c:choose>
		    </div>
          </div>
        </div>
        <div class="order-button">
          <button id="btn-pay-ready" type="button">결제하기</button>
          	<div id="productName" style="display:none;">${cartSummary.displayProductName}</div>
			<div id="totalQuantity" style="display:none;">${cartSummary.totalQuantity}</div>
			<div id="totalPrice" style="display:none;">${cartSummary.totalPrice + cartSummary.shippingFee}</div>
        </div> 
      </div>
  	</form>	
  </div>	
  <script>
  $(function() {
	    $("#btn-pay-ready").click(function(e) {
	        e.preventDefault();

	        let data = {
	        	    name: $("#productName").text() || '상품 이름 없음',
	        	    totalQuantity: $("#totalQuantity").text() || 0,
	        	    totalPrice: $("#totalPrice").text() || 0
	        	};
	        
	        
	        
	        $.ajax({
	            type: 'POST',
	            url: "<%=request.getContextPath()%>/kakaoPay/ready",
	            /* data: JSON.stringify(data), */
	            data: JSON.stringify({
			        itemName: "테스트 상품",
			        quantity: 1,
			        amount: 1000
			    }),
	            contentType: 'application/json; charset=utf-8',
	            dataType: 'json',
	            success: function(response) {
	                if (response.next_redirect_pc_url) {
	                    location.href = response.next_redirect_pc_url;
	                } else {
	                    alert("결제 페이지 URL을 받을 수 없습니다.");
	                }
	            },
	            error: function(xhr, status, error) {
	                console.error("카카오페이 요청 실패:", xhr.responseText);
	                alert("결제 요청 중 오류가 발생했습니다.");
	            }
	        });
	    });
	});
  </script>
</main>

<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>	
