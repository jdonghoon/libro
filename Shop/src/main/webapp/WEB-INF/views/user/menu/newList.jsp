<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/menu.css">

<main class="main-container-list">
  <!-- 카테고리 선택 -->
  <div class="category-title">Category</div>
  <div class="category-container">
    <div>
      <a name="categoryType" href="#" data-category="시">시</a>
      <a name="categoryType" href="#" data-category="소설">소설</a>
      <a name="categoryType" href="#" data-category="자기계발서">자기계발서</a>
    </div>
    <div>
      <a name="categoryType" href="#" data-category="외국어">외국어</a>
      <a name="categoryType" href="#" data-category="예술">예술</a>
      <a name="categoryType" href="#" data-category="자연/과학">자연/과학</a>
    </div>
    <div>
      <a name="categoryType" href="#" data-category="컴퓨터/IT">컴퓨터/IT</a>
      <a name="categoryType" href="#" data-category="기술/공학">기술/공학</a>
      <a name="categoryType" href="#" data-category="수험서">수험서</a>
    </div>
  </div>
  <script src="<%= request.getContextPath() %>/javascript/jquery-3.7.1.min.js"></script>
  <script>	
	  $(document).ready(function() {
		  $('a[name="categoryType"]').on('click', function(e) {
		        e.preventDefault(); // 링크 기본 동작 방지

		        let categoryType = $(this).data('category'); // 선택된 카테고리 값 가져오기
		        CategoryData(categoryType, 1);
		        
		  });	
	    });
	  
	  function CategoryData(categoryType, nowPage) {
		    $.ajax({
		        url: "category.do",
		        type: "GET",
		        data: { categoryType: categoryType, nowPage: nowPage },
		        dataType: "json",
		        success: function (response) {
		        	
		            console.log(response);

		         	// 기존 컨텐츠 초기화
	                $('#category-content').empty();
		         
		            // 데이터 렌더링
		            let productHtml = "";
		            response.categoryData.forEach(function (product) {
		            	console.log(product); // product 객체 전체 출력
			            console.log(product.product_name); // product_name 확인
			            console.log(product.attachment_detail_new_name);
			            
		                productHtml += `
		                    <div class="book-info-container-list">
		                        <div class="book-image">
		                            <a href="product.do?product_no=\${product.product_no}">
		                                <img src="<%=request.getContextPath()%>/upload/\${product.attachment_detail_new_name}" width="200px" height="300px;">
		                            </a>
		                        </div>
		                        <div class="book-detail">
		                            <div class="category">\${product.category_name}</div>
		                            <div class="title">\${product.product_name}</div>
		                            <div class="writer">\${product.product_author}</div>
		                            <div class="price">\${product.product_price}</div>
		                        </div>
		                        <div class="book-sales">
			        	            <div class="quantity" name="quantity"></div>
			        	            <div class="button-area-list">
			        	                <div class="payment"><button onclick="location.href='payment.do'">바로구매</button></div>
			        	                <div class="cart"><button onclick="addToCart(${vo.product_no})">장바구니</button></div>
			        	                <div class="wishlist"><button onclick="addToWishlist(${vo.product_no})">위시리스트</button></div>
			        	            </div>
			        	        </div>
		                    </div>`;
		            });
		            $('#category-content').html(productHtml);

		            // 페이징 처리
		            const paging = response.paging;
		            let pagingHtml = "";

		            if (paging.startPage > 1) {
		                pagingHtml += `<a href="#" data-page="${paging.startPage - 1}">&lt;</a>`;
		            }

		            for (let i = paging.startPage; i <= paging.endPage; i++) {
		                if (i === paging.nowPage) {
		                    pagingHtml += `<b>${i}</b>`;
		                } else {
		                    pagingHtml += `<a href="#" data-page="${i}">${i}</a>`;
		                }
		            }

		            if (paging.endPage < paging.lastPage) {
		                pagingHtml += `<a href="#" data-page="${paging.endPage + 1}">&gt;</a>`;
		            }

		            $("#pagination").html(pagingHtml);

		            // 페이징 클릭 이벤트 바인딩
		            $("#pagination a").on("click", function (e) {
		                e.preventDefault();
		                
		                const page = $(this).data("page");
		                CategoryData(categoryType, page);
		            });
		        },
		        error: function (xhr, status, error) {
		            console.error("AJAX Error:", error);
		            alert("데이터를 불러오는 중 오류가 발생했습니다.");
		        }
		    });
		}
  </script>
  
  <div class="search-result-container">
    <div class="result-container">
      <div class="menu-area"></div>
      
      <!-- 도서 리스트 -->
      <div id="category-content">
      	<c:forEach items="${newList}" var="vo">
	      <div class="book-info-container-list" id="book-info-container-list">
	      	<div class="book-image">
	            <a href="product.do?product_no=${vo.product_no}">
	                <img src="<%=request.getContextPath()%>/upload/${vo.attachment_detail_new_name}" width="200px" height="300px;">
	            </a>
	        </div>
	        <div class="book-detail">
	            <div class="category" name="category">${vo.category_name}</div>
	            <div class="title" name="title">${vo.product_name}</div>
	            <div class="writer" name="writer">${vo.product_author}</div>
	            <div class="price" name="price">${vo.product_price}</div>
	        </div>
	        <div class="book-sales">
	            <div class="quantity" name="quantity"></div>
	            <div class="button-area-list">
	            <script>
	            function buyNow(productNo, productName, productPrice) {
	                console.log("buyNow 함수 실행됨");
	                console.log("상품번호:", productNo, "상품명:", productName, "상품가격:", productPrice);
	                const data = {
	                    productNo: productNo,
	                    productName: productName,
	                    productPrice: productPrice,
	                    quantity: 1 // 수량 고정
	                };

	                $.ajax({
	                    type: "POST",
	                    url: "directPurchase.do",
	                    data: JSON.stringify(data),
	                    contentType: "application/json; charset=utf-8",
	                    success: function(response) {
	                        console.log("AJAX 요청 성공:", response);
	                        if (response.success) {
	                            alert("결제 페이지로 이동합니다.");
	                            window.location.href = "<%=request.getContextPath()%>/payment.do";
	                        } else {
	                            alert("구매 요청 실패: " + response.message);
	                        }
	                    },
	                    error: function(error) {
	                        console.error("AJAX 요청 실패:", error);
	                        alert("에러 발생: " + error.responseText);
	                    }
	                });
	            }

				</script>
	                <div class="payment"><button onclick="buyNow(`\${product.product_no}`, '\${product.product_name}', `\${product.product_price}`)">바로구매</button></div>
	                <div class="cart"><button onclick="addToCart(${vo.product_no})">장바구니</button></div>
	                <div class="wishlist"><button onclick="addToWishlist(${vo.product_no})">위시리스트</button></div>
	            </div>
	        </div>
	      </div>
      	</c:forEach>
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
      	</script>
      	
	      <div id="pagination">
			<c:if test="${paging.startPage > 1}">
			  <a href="newList.do?nowPage=${paging.startPage - 1}">&lt;</a>
			</c:if>	
			
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="cnt">
				<c:if test="${paging.nowPage eq cnt}">
					<b>${cnt}</b>
				</c:if>
				<c:if test="${paging.nowPage ne cnt}">
					<a href="newList.do?nowPage=${cnt}">${cnt}</a>
				</c:if>
			</c:forEach>
				
			<c:if test="${paging.endPage < paging.lastPage}">
			  <a href="newList.do?nowPage=${paging.endPage + 1}">&gt;</a>
			</c:if>
		  </div>
      </div>
    </div>
    
    <!-- 추천 도서 배너 -->
    <div class="recommend-container">
      <div class="banner-container">
        <div class="banner-title">추천 도서</div>
        <c:forEach items="${recommend}" var="vo">
	        <div class="recommend-books">
	          <div>
	            <a href="product.do?product_no=${vo.product_no}">
	              <img src="<%=request.getContextPath()%>/upload/${vo.attachment_detail_new_name}" width="100px" height="150px;"></div>
	              <div class="recommend-info">
	                <div class="recommend-title">${vo.product_name}</div>
	                <div class="recommend-writer">${vo.product_author}</div>
	              </div>
	            </a>
	        </div>        
        </c:forEach>
      </div>
    </div>
  </div>
</main>

<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>	