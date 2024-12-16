<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/menu.css">

<main class="main-container-list">
  <!-- 카테고리 선택 -->
  <div class="category-title">Category</div>
  <div class="category-container">
    <div>
      <a name="categoryType" href="#" data-category="시">시</a>
      <a name="categoryType" href="#" data-category="소설">소설</a>
      <a name="categoryType" href="#" data-category="자기개발서">자기개발서</a>
    </div>
    <div>
      <a name="categoryType" href="#" data-category="만화">만화</a>
      <a name="categoryType" href="#" data-category="예술">예술</a>
      <a name="categoryType" href="#" data-category="자연/과학">자연/과학</a>
    </div>
    <div>
      <a name="categoryType" href="#" data-category="학습">학습</a>
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
			            
		                productHtml += `
		                    <div class="book-info-container-list">
		                        <div class="book-image">
		                            <a href="product_detail.html">
		                                <img src="https://cdn.ypbooks.co.kr/image/product/202411/520e42e1-40c5-4632-a3cf-71182e3a89d8_192.jpg" width="200px">
		                            </a>
		                        </div>
		                        <div class="book-detail">
		                            <div class="category">\${product.category_name}</div>
		                            <div class="title">\${product.product_name}</div>
		                            <div class="writer">\${product.product_author}</div>
		                            <div class="price">\${product.product_price}</div>
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