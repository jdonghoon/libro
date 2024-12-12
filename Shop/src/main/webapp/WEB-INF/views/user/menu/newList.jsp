<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/menu.css">

<main class="main-container-list">
  <!-- 카테고리 선택 -->
  <div class="category-title">Category</div>
  <div class="category-container">
    <div>
      <a name="categoryType" href="#" data-category="poem">시</a>
      <a name="categoryType" href="#" data-category="novel">소설</a>
      <a name="categoryType" href="#" data-category="self-help">자기개발서</a>
    </div>
    <div>
      <a name="categoryType" href="#" data-category="comic">만화</a>
      <a name="categoryType" href="#" data-category="art">예술</a>
      <a name="categoryType" href="#" data-category="science">자연/과학</a>
    </div>
    <div>
      <a name="categoryType" href="#" data-category="learning">학습</a>
      <a name="categoryType" href="#" data-category="tech">기술/공학</a>
      <a name="categoryType" href="#" data-category="exam">수험서</a>
    </div>
  </div>
  <script src="<%= request.getContextPath() %>/javascript/jquery-3.7.1.min.js"></script>
  <!-- <script>	
	  $(document).ready(function() {
		  $('a[name="categoryType"]').on('click', function(e) {
		        e.preventDefault(); // 링크 기본 동작 방지

		        let categoryType = $(this).data('category'); // 선택된 카테고리 값 가져오기
				console.log(categoryType);
		        
		        // ajax 요청
				$.ajax({
		            url: "/category", // 서버 API 엔드포인트
		            type: "GET",
		            data: { categoryType: categoryType }, // 카테고리를 데이터로 전송
		            dataType: "json",
		            success: function(response) {
		                console.log(response);

		                // 기존 컨텐츠 초기화
		                $('#content').empty();

		                if (response.length === 0) {
		                    $('#content').append('<p>해당 카테고리에 데이터가 없습니다.</p>');
		                }

		                if (!Array.isArray(response)) {
		                    console.error('응답 데이터가 배열이 아닙니다:', response);
		                    alert('잘못된 데이터 형식입니다.');
		                    return;
		                }

		                response.forEach(function (product) {
		                    let productHtml = `
		                        <div class="book-image">
		                            <a href="product_detail.html">
		                                <img src="https://cdn.ypbooks.co.kr/image/product/202411/520e42e1-40c5-4632-a3cf-71182e3a89d8_192.jpg" width="200px">
		                            </a>
		                        </div>
		                        <div class="book-detail">
		                            <div class="category" name="category">${product.category_name}</div>
		                            <div class="title" name="title">${product.product_name}</div>
		                            <div class="writer" name="writer">${product.product_author}</div>
		                            <div class="price" name="price">${product.product_price}</div>
		                        </div>
		                        <div class="book-sales">
		                            <div class="quantity" name="quantity"></div>
		                            <div class="button-area-list">
		                                <div class="payment"><button>바로구매</button></div>
		                                <div class="cart"><button>장바구니</button></div>
		                                <div class="wishlist"><button>위시리스트</button></div>
		                            </div>
		                        </div>`;
		                            
		                    $('#content').append(productHtml);		
		                });
		            },
		            error: function(xhr, status, error) {
		                console.error('AJAX Error: ', xhr.status, error);
		                alert('데이터를 불러오는 중 오류가 발생했습니다.');
		            }
		        });	
		    }); 
		});
  </script> -->
  
  <div class="search-result-container">
    <div class="result-container">
      <div class="menu-area"></div>
      
      <!-- 도서 리스트 -->
      <div id="content">
      	<c:forEach items="${newList}" var="vo">
	      <div class="book-info-container-list" id="book-info-container-list">
	      	<div class="book-image">
	            <a href="product_detail.html">
	                <img src="https://cdn.ypbooks.co.kr/image/product/202411/520e42e1-40c5-4632-a3cf-71182e3a89d8_192.jpg" width="200px">
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
	                <div class="payment"><button>바로구매</button></div>
	                <div class="cart"><button>장바구니</button></div>
	                <div class="wishlist"><button>위시리스트</button></div>
	            </div>
	        </div>
	      </div>
      	</c:forEach>
      </div>
      <div class="pagination">
		<c:if test="${paging.startPage > 1}">
		  <a href="newList.do?nowPage=${paging.startPage - 1}">&lt;</a>
		</c:if>	
		
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="cnt">
			<c:if test="${paging.nowPage eq cnt}">
				<b>${paging.nowPage}</b>
			</c:if>
			<c:if test="${paging.nowPage ne cnt}">
				<a href="newList.do?nowpage=${cnt}">${cnt}</a>
			</c:if>
		</c:forEach>
			
		<c:if test="${paging.endPage < paging.lastPage}">
		  <a href="newList.do?nowPage=${paging.endPage + 1}">&gt;</a>
		</c:if>
	  </div>
    </div>
    
    <!-- 추천 도서 배너 -->
    <div class="recommend-container">
      <div class="banner-container">
        <div class="banner-title">추천 도서</div>
        <c:forEach items="${recommend}" var="vo">
	        <div class="recommend-books">
	          <div>
	            <a href="#">
	              <img src="https://cdn.ypbooks.co.kr/image/product/202411/520e42e1-40c5-4632-a3cf-71182e3a89d8_192.jpg" width="100px"></div>
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