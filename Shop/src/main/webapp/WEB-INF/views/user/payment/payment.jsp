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
                <option>경비실에 맡겨주세요.</option>
                <option>택배 보관함에 넣어주세요.</option>
                <option>직접 전달 부탁드립니다.</option>
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
         <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<script>
			    function sample6_execDaumPostcode() {
			        new daum.Postcode({
			            oncomplete: function(data) {
			                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			
			                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
			                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			                var addr = ''; // 주소 변수
			                var extraAddr = ''; // 참고항목 변수
			
			                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
			                    addr = data.roadAddress;
			                } else { // 사용자가 지번 주소를 선택했을 경우(J)
			                    addr = data.jibunAddress;
			                }
			
			                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			                if(data.userSelectedType === 'R'){
			                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
			                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			                        extraAddr += data.bname;
			                    }
			                    // 건물명이 있고, 공동주택일 경우 추가한다.
			                    if(data.buildingName !== '' && data.apartment === 'Y'){
			                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                    }
			                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			                    if(extraAddr !== ''){
			                        extraAddr = ' (' + extraAddr + ')';
			                    }
			                    // 조합된 참고항목을 해당 필드에 넣는다.
			                    document.getElementById("sample6_extraAddress").value = extraAddr;
			                
			                } else {
			                    document.getElementById("sample6_extraAddress").value = '';
			                }
			
			                // 우편번호와 주소 정보를 해당 필드에 넣는다.
			                document.getElementById('sample6_postcode').value = data.zonecode;
			                document.getElementById("sample6_address").value = addr;
			                // 커서를 상세주소 필드로 이동한다.
			                document.getElementById("sample6_detailAddress").focus();
			            }
			        }).open();
			    }
			</script>
          
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
	     // 사용자 입력 정보 수집
            const customerInfo = {
                userName: $(".orderer-info-content div:nth-child(1)").text().trim(),
                userPhone: $(".orderer-info-content div:nth-child(2)").text().trim(),
                userEmail: $(".orderer-info-content div:nth-child(3)").text().trim(),
            };

            const addressInfo = {
                address: $("#sample6_address").val() || $(".address-book-info div:nth-child(3)").text().trim(),
                detailAddress: $("#sample6_detailAddress").val(),
                extraAddress: $("#sample6_extraAddress").val(),
                memo: $(".address-memo-select select").val(),
            };

            const paymentData = {
                itemName: $("#productName").text() || "상품 이름 없음",
                quantity: parseInt($("#totalQuantity").text()) || 0,
                amount: parseInt($("#totalPrice").text()) || 0,
                customerInfo,
                addressInfo,
            };
	
	        console.log("결제 요청 데이터:", paymentData);
		
	        // AJAX 요청
	        $.ajax({
	            type: 'POST',
	            url: "<%=request.getContextPath()%>/kakaoPay/ready",
	            data: JSON.stringify(paymentData),
	            contentType: 'application/json; charset=utf-8',
	            dataType: 'json',
	            success: function(response) {
	            	console.log("AJAX 요청 URL:", "<%=request.getContextPath()%>/kakaoPay/ready");
	            	console.log("AJAX 요청 데이터:", paymentData);
	            	
	                if (response.next_redirect_pc_url) {
	                    location.href = response.next_redirect_pc_url;
	                } else {
	                    alert("결제 페이지 URL을 받을 수 없습니다.");
	                }
	            },
	            error: function(xhr, status, error) {
	            	console.error("카카오페이 요청 실패:", xhr.responseText);
	                console.log("요청 URL:", "<%=request.getContextPath()%>/kakaoPay/ready");
	                console.log("전송 데이터:", paymentData);
	                console.log("에러 상태:", status);
	                console.log("에러 메시지:", error);
	                alert("결제 요청 중 오류가 발생했습니다.");
	            },
	        });
	    });
	});
	</script>
</main>

<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>	
