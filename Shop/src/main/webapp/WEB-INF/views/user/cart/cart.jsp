<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/menu.css">

<main class="main-container-cart">
  <!-- 상품 선택 -->
  <div class="first-container-cart">
    <input type="radio" id="total" value="0">
    <label class="total-rabel" for="total">전체 선택</label><br>

    <input type="radio" id="option1" value="1">
    <label for="option1">
      <div class="book-info-container-cart">
        <div class="book-image">
          <a href="#">
            <img src="https://cdn.ypbooks.co.kr/image/product/202411/520e42e1-40c5-4632-a3cf-71182e3a89d8_192.jpg" width="200px">
          </a>
        </div>
        <div class="book-detail">
          <div class="category" name="category">카테고리</div>
          <div class="title" name="title">무의식은 어떻게 나를 설계하는가</div>
          <div class="writer" name="writer">저자</div>
          <div class="price" name="price">가격</div>
        </div>
        <div class="book-sales">
          <div class="quantity" name="quantity">수량
            <button><img src="https://img.icons8.com/?size=100&id=79029&format=png&color=000000" width="10px"></button>
              <span>1</span>
            <button><img src="https://img.icons8.com/?size=100&id=3220&format=png&color=000000" width="10px"></button>
          </div>
          <div class="button-area-cart">
            <div class="payment"><button>바로구매</button></div>
            <div class="cart"><button>장바구니</button></div>
            <div class="wishlist"><button>위시리스트</button></div>
          </div>
        </div>
      </div>
      <script>
          	function cntUp() {
          		let count = $("#count").text();
          		let updateCount = count + 1;
          		
          		$.ajax({
          			url: "newlist.do",
          			method: "POST",
          			data: {count : updateCount},
          			success : function(data) {
          				$("#count").text(updateCount);
          			},
          			error : function(xhr) {
						console.log(xhr);
					}
          		});
          	}
          	
          	function cntDown() {
          		let count = $("#count").text();
          		if(count > 1) {
          			let updateCount = count - 1;
          			
	          		$.ajax({
	          			url: "newlist.do",
	          			method: "POST",
	          			data: {count : updateCount},
	          			success : function(data) {
	          				$("#count").text(updateCount);
	          			},
	          			error : function(xhr) {
							console.log(xhr);
						}
	          		});
       			}
          	}
          </script>
    </label>
    <input type="radio" id="option2" value="2">
    <label for="option2">
      <div class="book-info-container-cart">
          <div class="book-image">
            <a href="#">
              <img src="https://cdn.ypbooks.co.kr/image/product/202411/520e42e1-40c5-4632-a3cf-71182e3a89d8_192.jpg" width="200px">
            </a>
          </div>
          <div class="book-detail">
            <div class="category" name="category">카테고리</div>
            <div class="title" name="title">무의식은 어떻게 나를 설계하는가</div>
            <div class="writer" name="writer">저자</div>
            <div class="price" name="price">가격</div>
          </div>
          <div class="book-sales">
            <div class="quantity" name="quantity">수량
              <button><img src="https://img.icons8.com/?size=100&id=79029&format=png&color=000000" width="10px"></button>
                <span>1</span>
              <button><img src="https://img.icons8.com/?size=100&id=3220&format=png&color=000000" width="10px"></button>
            </div>
            <div class="button-area-cart">
              <div class="payment"><button>바로구매</button></div>
              <div class="cart"><button>장바구니</button></div>
              <div class="wishlist"><button>위시리스트</button></div>
            </div>
          </div>
        </div>
      </label>
      <input type="radio" id="option3" value="3">
      <label for="option3">
      <div class="book-info-container-cart">
          <div class="book-image">
            <a href="#">
              <img src="https://cdn.ypbooks.co.kr/image/product/202411/520e42e1-40c5-4632-a3cf-71182e3a89d8_192.jpg" width="200px">
            </a>
          </div>
          <div class="book-detail">
            <div class="category" name="category">카테고리</div>
            <div class="title" name="title">무의식은 어떻게 나를 설계하는가</div>
            <div class="writer" name="writer">저자</div>
            <div class="price" name="price">가격</div>
          </div>
          <div class="book-sales">
            <div class="quantity" name="quantity">수량
              <button><img src="https://img.icons8.com/?size=100&id=79029&format=png&color=000000" width="10px"></button>
                <span>1</span>
              <button><img src="https://img.icons8.com/?size=100&id=3220&format=png&color=000000" width="10px"></button>
            </div>
            <div class="button-area-cart">
              <div class="payment"><button>바로구매</button></div>
              <div class="cart"><button>장바구니</button></div>
              <div class="wishlist"><button>위시리스트</button></div>
            </div>
          </div>
        </div>
      </label>
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