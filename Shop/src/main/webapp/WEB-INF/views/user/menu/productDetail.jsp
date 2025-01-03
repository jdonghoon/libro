<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/menu.css">

<main class="main-container-detail">
  <!-- 왼쪽 섹션: 상품 이미지 -->
    <div class="first-container-detail">
      <div class="left-container-detail">
        <div><img src="<%=request.getContextPath()%>/upload/${productDetail.attachment_detail_new_name}" width="300px;"></div>
      </div>
      <!-- 오른쪽 섹션: 상품 정보 및 구매 -->
      <div class="right-container-detail">
        <div class="book-info">
          <div class="title">${productDetail.product_name}</div>
          <div>${productDetail.product_author}</div>
          <div>
            <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="10px">
            <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="10px">
            <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="10px">
            <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="10px">
            <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="10px">
            <span>${productDetail.review_starrating_avg}</span>
          </div>
          <div>${productDetail.product_price}</div>
        </div>
        <div class="shipping-info">
          <div class="shipping-title">배송정보</div>
          	<div class="shipping-item">
	          <div>배송비</div>
	          <div>3,000원</div>
	        </div>
	        <div class="shipping-item">
	          <div>배송지</div>
	          <div>전북 전주시 덕진구 백제대로 572 4층(이젠)</div>
	        </div>
          </div>
        <form action="purchase.html" method="get">
		  <div class="quantity-info">
		    <div>
		      <button type="button" onclick="cntDown()">
		        <img src="https://img.icons8.com/?size=100&id=79029&format=png&color=000000" width="10px">
		      </button>
		      <span id="count">1</span>
		      <button type="button" onclick="cntUp()">
		        <img src="https://img.icons8.com/?size=100&id=3220&format=png&color=000000" width="10px">
		      </button>
		    </div>
		    <div class="total-price" id="total-price">${productDetail.product_price}</div>
		  </div>
		
		  <div class="button-area-detail">
		    <div>
		      <button type="button" class="wishlist" onclick="addToWishlist(${productDetail.product_no})">위시리스트</button>
		      <button type="button" class="cart" onclick="addToCart(${productDetail.product_no})">장바구니</button>
			  <button type="submit" class="purchase">바로 구매</button>
		    </div>
		  </div>
		</form>
		<script>
			
	    
			function addToCart(product_no) {
	      	    $.ajax({
	      	        url: "addToCart.do",
	      	        type: "POST",
	      	        data: { product_no: product_no },
	      	        success: function (response) {
	      	            console.log(response);
	
	      	            if (response.success) {
	      	                alert("장바구니에 상품이 추가되었습니다.");
	      	                selectCart(); // 장바구니 목록 갱신
	      	            } else {
	      	                alert(response.message); // 서버에서 전달된 메시지 표시
	      	            }
	      	        },
	      	        error: function (xhr, status, error) {
	      	            console.log("AJAX Error: ", error);
	      	            alert("장바구니 추가 중 오류가 발생했습니다.");
	      	        }
	      	    });
	      	}
	  		
	  		function addToWishlist(product_no){
	  			$.ajax({
	  				url : "addToWishlist.do",
	  				type : "POST",
	  				data : {product_no : product_no},
	  				success : function (response) {
	  					
	  					console.log(response);
	  					
	  					if(response.success) {
	  						alert("읽고 싶은 책에 상품이 추가되었습니다.");
	  					} else {
	  						alert(response.message); // 서버에서 전달된 메시지 표시
	  					}
	  				},
	  				error : function (xhr, status, error) {
	  					console.log("AJAX Error : ", error);
	  					alert("읽고 싶은 책 추가 중 오류가 발생했습니다.");
	  				}
	  			});
	  		}

		  const pricePerUnit = ${productDetail.product_price}; // 제품 단가
		
		  function updateTotalPrice(count) {
		    const totalPrice = count * pricePerUnit;
		    document.getElementById("total-price").innerText = totalPrice.toLocaleString(); // 가격 표시
		  }
		
		  function cntUp() {
		    const countElement = document.getElementById("count");
		    let count = parseInt(countElement.innerText); // 현재 수량을 숫자로 변환
		    count += 1; // 수량 증가
		    countElement.innerText = count; // 화면에 반영
		    updateTotalPrice(count); // 총 가격 갱신
		  }
		
		  function cntDown() {
		    const countElement = document.getElementById("count");
		    let count = parseInt(countElement.innerText); // 현재 수량을 숫자로 변환
		    if (count > 1) { // 최소 수량 1 제한
		      count -= 1; // 수량 감소
		      countElement.innerText = count; // 화면에 반영
		      updateTotalPrice(count); // 총 가격 갱신
		    }
		  }
		  
		  const pricePerUnit = ${productDetail.product_price}; // 단가
		    document.querySelector(".cnt-up").addEventListener("click", function () {
		        const quantityElement = document.getElementById("quantity");
		        const count = parseInt(quantityElement.value) + 1;
		        quantityElement.value = count;
		    });
	
		    document.querySelector(".cnt-down").addEventListener("click", function () {
		        const quantityElement = document.getElementById("quantity");
		        const count = parseInt(quantityElement.value);
		        if (count > 1) {
		            quantityElement.value = count - 1;
		        }
		    });
		    
		</script>

      </div>
    </div>

    <!-- 상품 규격 정보 -->
    <div class="second-container">
      <div class="container-title">상품 규격 정보</div>
      <div class="specification-info-detail">
        <div class="specification-info-detail-item">
          <div class="ISBN">ISBN</div>
          <div class="specification-info-content">${productDetail.product_isbn}</div>
        </div>
        <div class="specification-info-detail-item">
          <div class="page">쪽수</div>
          <div class="specification-info-content">${productDetail.product_page}</div>
        </div>
        <div class="specification-info-detail-item">
          <div class="composition">제품구성</div>
          <div class="specification-info-content">1권</div>
        </div>
      </div>
    </div>

    <!-- 책 소개 -->
    <div class="third-container">
      <div class="container-title">상품소개</div>
      <div class="book-info-content">
        ${productDetail.product_description}
      </div>
    </div>

    <!-- 카테고리 -->
    <div class="fourth-container">
      <div class="container-title">카테고리</div>
      <div class="category-content">
        - ${productDetail.category_name}
      </div>
    </div>

    <!-- 저자 -->
    <div class="fifth-container">
      <div class="container-title">저자</div>
      <div class="writer-content">
        - ${productDetail.product_author}
      </div>
    </div>

    <!-- 저자 -->
    <div class="sixth-container">
      <div class="evaluation-background">
        <div class="container-title">이 책의 리뷰</div>
          <div class="evaluation-area">
            <div class="display-container">
              <div class="evaluation-title">사용자 총 별점</div>
              <div>
                <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="20px">
                <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="20px">
                <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="20px">
                <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="20px">
                <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="20px">
                <div class="evaluation-score">
                	<c:if test="${empty productDetail.review_starrating_avg}">
                		0 / 5
                	</c:if>
                	<c:if test="${not empty productDetail.review_starrating_avg}">
                		${productDetail.review_starrating_avg} / 5
                	</c:if>
                </div>
              </div>
            </div>
            <div class="display-container">
              <div class="evaluation-title">전체 리뷰 수</div>
              <div class="evaluation-count">${productDetail.review_cnt}</div>
            </div>
            <div class="display-container">
              <div class="evaluation-title">평점 비율</div>
              <div class="evaluation-ratio">
                <div>
                  <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="10px">
                  <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="10px">
                  <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="10px">
                  <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="10px">
                  <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="10px">
                  <span class="star-score">${reviewDetail.review_five_score}%</span>
                <div>
                  <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="10px">
                  <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="10px">
                  <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="10px">
                  <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="10px">
                  <img src="https://img.icons8.com/?size=100&id=zjmyhXVAojeZ&format=png&color=000000" width="10px">
                  <span class="star-score">${reviewDetail.review_four_score}%</span>
                </div>
                <div>
                  <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="10px">
                  <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="10px">
                  <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="10px">
                  <img src="https://img.icons8.com/?size=100&id=zjmyhXVAojeZ&format=png&color=000000" width="10px">
                  <img src="https://img.icons8.com/?size=100&id=zjmyhXVAojeZ&format=png&color=000000" width="10px">
                  <span class="star-score">${reviewDetail.review_three_score}%</span>
                </div>
                <div>
                  <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="10px">
                  <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="10px">
                  <img src="https://img.icons8.com/?size=100&id=zjmyhXVAojeZ&format=png&color=000000" width="10px">
                  <img src="https://img.icons8.com/?size=100&id=zjmyhXVAojeZ&format=png&color=000000" width="10px">
                  <img src="https://img.icons8.com/?size=100&id=zjmyhXVAojeZ&format=png&color=000000" width="10px">
                  <span class="star-score">${reviewDetail.review_two_score}%</span>
                </div>
                <div>
                  <img src="https://img.icons8.com/?size=100&id=zjmyhXVAojeZ&format=png&color=000000" width="10px">
                  <img src="https://img.icons8.com/?size=100&id=zjmyhXVAojeZ&format=png&color=000000" width="10px">
                  <img src="https://img.icons8.com/?size=100&id=zjmyhXVAojeZ&format=png&color=000000" width="10px">
                  <img src="https://img.icons8.com/?size=100&id=zjmyhXVAojeZ&format=png&color=000000" width="10px">
                  <img src="https://img.icons8.com/?size=100&id=zjmyhXVAojeZ&format=png&color=000000" width="10px">
                  <span class="star-score">${reviewDetail.review_one_score}%</span>
                </div>
              </div>
            </div>
          </div>
      </div>
    </div>

    <!-- 리뷰 -->
    <div class="seventh-container">
      <div class="review-title">리뷰</div>
      <div class="review-container">
        <div>
          <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="10px">
          <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="10px">
          <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="10px">
          <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="10px">
          <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="10px">
          <span class="review-star-score">4.1</span>
        </div>
        <div class="write-info">
          <div>${reviewDetail.user_id}</div>
          <span>|</span>
          <div>${reviewDetail.review_create_at}</div>
        </div>
        <div class="review-content">
          ${reviewDetail.review_content}
        </div>
      </div>
    </div>
  </main>

<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>	