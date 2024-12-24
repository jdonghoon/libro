<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/menu.css">

<main class="main-container-cart">
  <!-- 상품 선택 -->
  <div class="first-container-cart">
    <div class="checkbox-container">
      <label class="checkbox-label">
        <input type="checkbox" id="selectAll" />
        <span>전체 선택</span>
      </label>
	  
	  <c:forEach items="${cartList}" var="vo">
	    <label class="checkbox-label">
	        <input type="checkbox" name="book" value="${vo.product_no}" class="product-checkbox" />
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
	                <div class="price" name="price">${vo.product_price}</div>
	            </div>
	            <div class="book-sales">
	                <div class="quantity" name="quantity">수량
	                    <button class="cnt-down" data-product-no="${vo.product_no}"><img src="https://img.icons8.com/?size=100&id=79029&format=png&color=000000" width="10px"></button>
	                    <span class="count" id="count_${vo.product_no}">${vo.cart_product_quantity}</span>
	                    <button class="cnt-up" data-product-no="${vo.product_no}"><img src="https://img.icons8.com/?size=100&id=3220&format=png&color=000000" width="10px"></button>
	                </div>
	            </div>
	        </div>
	    </label>
	  </c:forEach>
	
	  <script>
		  $(document).ready(function() {
		        $('.cnt-up, .cnt-down').click(function() {
		            let productNo = $(this).data('product-no');
		            let countElement = $(`#count_${productNo}`);
		            let count = parseInt(countElement.text());
	
		            if ($(this).hasClass('cnt-down') && count > 1) {
		                count--;
		            } else if ($(this).hasClass('cnt-up')) {
		                count++;
		            }
	
		            countElement.text(count);
	
		            // AJAX 요청
		            $.ajax({
		                url: 'updateCartQuantity.do',
		                type: 'POST',
		                data: { user_id: user_id, product_no: productNo, quantity: count },
		                success: function(response) {
		                    console.log('수량 업데이트 성공:', response);
		                },
		                error: function(xhr, status, error) {
		                    console.error('수량 업데이트 실패:', status, error);
		                }
		            });
		        });
		    });
	  </script>
    </div>

  <!-- 결제 내역 -->  
  <div class="payment-container">
    <form action="">
      <div class="payment-title">주문 합계</div>
      <div class="payment-display">
        <div>
          <div class="payment-info">
            <div>총 수량</div>
            <div class="payment-price" id="total-quantity">${cartPrice.cart_product_quantity}</div>
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
          <button>주문하기</button>
        </div> 
      </div>
  	</form>
  </div>
</main>

<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>	