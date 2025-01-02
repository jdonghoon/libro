<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/menu.css">

<main class="main-container-cart">
  <!-- 상품 선택 -->
  <div class="first-container-cart">
    <div class="checkbox-container">
      <label class="checkbox-label">
        <input type="checkbox" id="selectAll" checked />
        <span>전체 선택</span>
      </label>
	      <c:if test="${empty cartList}">
	          <div class="book-info-container-cart-empty">
	              	<div>장바구니가 비어있습니다.</div>
	          </div>
	      </c:if>
	      <c:if test="${not empty cartList}">
	      <c:forEach items="${cartList}" var="vo">
	      <!-- 판매 -->
	      <c:if test="${vo.product_status == 'E'}">
	        <label class="checkbox-label">
	          <input type="checkbox" name="book" value="${vo.product_no}" class="product-checkbox" checked />
	          <div class="book-info-container-cart">
	            <div class="book-image">
	              <a href="product.do?product_no=${vo.product_no}">
	                <img src="<%=request.getContextPath()%>/upload/${vo.attachment_detail_new_name}" width="200px" height="300px">
	              </a>
	            </div>
	            <div class="book-detail">
	              <div class="category" name="category">${vo.category_name}</div>
	              <div class="title" name="title">${vo.product_name}</div>
	              <div class="writer" name="writer">${vo.product_author}</div>
	              <div class="price" name="price" id="price_${vo.product_no}">${vo.product_price}</div>
	            </div>
	            <div class="book-sales">
	              <div class="quantity" name="quantity">수량
	                <button class="cnt-down" data-product-no="${vo.product_no}">
	                  <img src="https://img.icons8.com/?size=100&id=79029&format=png&color=000000" width="10px">
	                </button>
	                <span class="count" id="count_${vo.product_no}">${vo.cart_product_quantity}</span>
	                <button class="cnt-up" data-product-no="${vo.product_no}">
	                  <img src="https://img.icons8.com/?size=100&id=3220&format=png&color=000000" width="10px">
	                </button>
	              </div>
	            </div>
	          </div>
	        </label>
        </c:if>
<%--         <!-- 판매 중단 -->
	    <c:if test="${vo.product_status == 'D'}">
	        <label class="checkbox-label">
	          <input type="checkbox" name="book" value="${vo.product_no}" class="product-checkbox" checked />
	          <div class="book-info-container-cart">
	            <div class="book-image">
	              <a href="product.do?product_no=${vo.product_no}">
	                <img src="<%=request.getContextPath()%>/upload/${vo.attachment_detail_new_name}" width="200px" height="300px">
	              </a>
	            </div>
	            <div class="book-detail">
                     <span style="display: flex; align-items: center; font-size: 24px;">
						<img src="https://img.icons8.com/?size=100&id=pHtKLuytfhLc&format=png&color=000000" style="width: 30px;">더 이상 판매하지 않는 상품입니다.
                     </span>
	            </div>
	          </div>
	        </label>
        </c:if>
        <!-- 품절 -->
	    <c:if test="${vo.product_status == 'S'}">
	        <label class="checkbox-label">
	          <input type="checkbox" name="book" value="${vo.product_no}" class="product-checkbox" checked />
	          <div class="book-info-container-cart">
	            <div class="book-image">
	              <a href="product.do?product_no=${vo.product_no}">
	                <img src="<%=request.getContextPath()%>/upload/${vo.attachment_detail_new_name}" width="200px" height="300px">
	              </a>
	            </div>
	            <div class="book-detail">
	              <div class="category" name="category">${vo.category_name}</div>
	              <div class="title" name="title">${vo.product_name}</div>
	              <div class="writer" name="writer">${vo.product_author}</div>
	              <div class="price" name="price" id="price_${vo.product_no}">${vo.product_price}</div>
	              <span style="display: flex; align-items: center; font-size: 25px; margin-top: 120px;">
					<img src="https://img.icons8.com/?size=100&id=byIfrXdxUcJc&format=png&color=FF0000" style="width: 30px;">품절
                  </span>
	            </div>
	          </div>
	        </label>
        </c:if> --%>
        <c:if test="${vo.product_status == 'D' || vo.product_status == 'S'}">
  <label class="checkbox-label">
    <!-- 체크박스가 기본적으로 선택되지 않음 -->
    <input type="checkbox" name="book" value="${vo.product_no}" class="product-checkbox" disabled />
    <div class="book-info-container-cart">
      <div class="book-image">
        <a href="product.do?product_no=${vo.product_no}">
          <img src="<%=request.getContextPath()%>/upload/${vo.attachment_detail_new_name}" width="200px" height="300px">
        </a>
      </div>
      <div class="book-detail">
        <!-- 상품 상태에 따른 메시지 표시 -->
        <c:choose>
          <c:when test="${vo.product_status == 'D'}">
            <span style="display: flex; align-items: center; font-size: 24px;">
              <img src="https://img.icons8.com/?size=100&id=pHtKLuytfhLc&format=png&color=000000" style="width: 30px;">더 이상 판매하지 않는 상품입니다.
            </span>
          </c:when>
          <c:when test="${vo.product_status == 'S'}">
            <span style="display: flex; align-items: center; font-size: 25px;">
              <img src="https://img.icons8.com/?size=100&id=byIfrXdxUcJc&format=png&color=FF0000" style="width: 30px;">품절
            </span>
          </c:when>
        </c:choose>
      </div>
    </div>
  </label>
</c:if>
        
	      </c:forEach>
        </c:if>

      <script>
        $(document).ready(function() {
          // 전체 선택 기능
          $('#selectAll').click(function() {
            $('.product-checkbox').prop('checked', this.checked);
            updateOrderSummary();
          });

       	  // 개별 선택 기능
          $('.product-checkbox').change(function() {
            updateOrderSummary();
          });
       
          // 개별 수량 조정
          $('.cnt-up, .cnt-down').click(function() {
            let productNo = $(this).data('product-no');
            let countElement = $(`#count_\${productNo}`);
            
            // 기본 수량 설정
            let count = parseInt(countElement.text()) || 1; 

            if ($(this).hasClass('cnt-down') && count > 1) {
              count--;
              updateOrderSummary();
            } else if ($(this).hasClass('cnt-up')) {
              count++;
              updateOrderSummary();
            }

            countElement.text(count);

            // AJAX 요청
            $.ajax({
              url: 'updateCartQuantity.do',
              type: 'POST',
              data: { product_no: productNo, quantity: count },
              success: function(response) {
                console.log('수량 업데이트 성공:', response);
                updateOrderSummary();
              },
              error: function(xhr, status, error) {
                console.error('수량 업데이트 실패:', status, error);
              }
            });
          });

          // 주문합계 업데이트
          function updateOrderSummary() {
			    let totalQuantity = 0;
			    let totalPrice = 0;
			    let selectedProductNames = [];
			
			    $('.product-checkbox:checked').each(function() {
			        let productNo = $(this).val();
			
			        // 수량 가져오기 및 기본값 설정
			        let countElement = $(`#count_\${productNo}`);
			        
			        let count = parseInt(countElement.text()) || 0; // 기본값 0 설정
			
			        // 가격 가져오기 및 쉼표 제거
			        let priceElement = $(`#price_\${productNo}`);
			        
			        let price = parseFloat(priceElement.text().replace(/,/g, '')) || 0; // 기본값 0 설정
			
			        let productName = priceElement.closest('.book-detail').find('.title').text().trim();
			
			        totalQuantity += count;
			        totalPrice += count * price;
			
			        // 상품명 저장
			        selectedProductNames.push(productName);
			    });
			
			    // 상품명 처리 (첫 번째 상품명 + 외 n권)
			    let displayProductName = selectedProductNames.length > 1
			        ? `\${selectedProductNames[0]} 외 \${selectedProductNames.length - 1}권`
			        : selectedProductNames[0] || "선택된 상품 없음";
			
			    // 주문 합계 UI 업데이트
			    $('#total-quantity').text(totalQuantity);
			    $('#product-price').text(totalPrice.toLocaleString());
			    $('#total-price').text((totalPrice + 3000).toLocaleString());
			
			    // AJAX 요청으로 데이터 전송
			    $.ajax({
			        url: 'updateCartSummary.do',
			        type: 'POST',
			        data: {
			            totalQuantity,
			            totalPrice,
			            shippingFee: 3000,
			            displayProductName
			        },
			        success: function(response) {
			            console.log(response);
			            console.log('Session updated successfully:', response);
			        },
			        error: function(xhr, status, error) {
			            console.error('Failed to update session:', error);
			        }
			    });
			}
        });
      </script>
    </div>

    <!-- 결제 내역 -->
    <!-- 회원 -->
    <sec:authorize access="isAuthenticated()">
    <div class="payment-container">
      <form action="payment.do">
        <div class="payment-title">주문 합계</div>
        <div class="payment-display">
          <div>
            <div class="payment-info">
              <div>총 수량</div>
              <div class="payment-price" id="total-quantity" >${cartPrice.cart_product_quantity}</div>
            </div>
            <div class="payment-info">	
              <div>상품금액</div>
              <div class="payment-price" id="product-price">${cartPrice.product_price}</div>
            </div>
            <div class="payment-info">
              <div>배송비</div>
              <div class="payment-price" id="shipping-price">3,000</div>
            </div>
            <div class="payment-total-info">
              <div>총 주문금액</div>
              <div class="payment-total-price" id="total-price">${totalPrice}</div>
            </div>
          </div>
          <div class="order-button">
            <button type="submit">주문하기</button>
          </div> 
        </div>
      </form>
    </div>
    </sec:authorize>
	<!-- 비회원 -->
	    <sec:authorize access="isAnonymous()">
    <div class="payment-container">
      <form action="payment.do">
        <div class="payment-title">주문 합계</div>
        <div class="payment-display">
          <div>
    		<c:forEach items="${cartPrice}" var="vo">
            <div class="payment-info">
              <div>총 수량</div>
              <div class="payment-price" id="total-quantity" >${vo.totalProductQuantity}</div>
            </div>
            <div class="payment-info">	
              <div>상품금액</div>
              <div class="payment-price" id="product-price">${vo.totalProductPrice}</div>
            </div>
    		</c:forEach>
            <div class="payment-info">
              <div>배송비</div>
              <div class="payment-price" id="shipping-price">3,000</div>
            </div>
            <div class="payment-total-info">
              <div>총 주문금액</div>
              <div class="payment-total-price" id="total-price">${cartPrice[0].totalProductPrice + 3000}</div>
            </div>
          </div>
          <div class="order-button">
            <button type="submit">주문하기</button>
          </div> 
        </div>
      </form>
    </div>
    </sec:authorize>
  </div>
</main>


<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>	