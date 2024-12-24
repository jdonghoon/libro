<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/menu.css">

<!-- carousel (슬라이드) -->
<main class="main-container-search">
  <div class="search-result-container">
    <div class="result-container">
      <c:if test="${paging.nowPage eq 1}">
      	<div class="result-ment-area"><b>(${searchVo.searchValue})</b>에 대한 검색 결과입니다.</div>
      </c:if>
      <div class="menu-area">
        <!-- <ul>
          <li><a href="#" onclick="bestSeller()">판매순</a></li>
          	<span>|</span>
          <li><a href="#" onclick="newList()">신상품순</a></li>
          	<span>|</span>
          <li><a href="#" onclick="priceHigh()">높은 가격순</a></li>
          	<span>|</span>
          <li><a href="#" onclick="low()">낮은 가격순</a></li>
        </ul> -->
      </div>
      
      <!-- 도서 리스트 -->
      
      <c:forEach items="${search}" var="vo">
      
      <!-- 점검 필요 -->
      	<c:if test="${empty vo.product_name}">
      	  <div class="book-info-container-search">
      		<div>검색된 상품이 없습니다.</div>
      	  </div>
      	</c:if>
      	
      	<c:if test="${not empty vo.product_name}">
      	  <div class="book-info-container-search">
			<div class="book-image">
	    	  <a href="product.do?product_no=${vo.product_no}">
            	<img src="<%=request.getContextPath()%>/upload/${vo.attachment_detail_new_name}" width="200px">
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
	          <div class="button-area-search">
	            <div class="payment"><button onclick="location.href='payment.do'">바로구매</button></div>
	                <div class="cart"><button onclick="addToCart(${vo.product_no})">장바구니</button></div>
	                <div class="wishlist"><button onclick="addToWishlist(${vo.product_no})">위시리스트</button></div>
	            </div>
	        </div>
	      </div>
        </c:if>
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
		  <a href="indexSearch.do?nowPage=${paging.startPage - 1}">&lt;</a>
		</c:if>	
		
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="cnt">
			<c:if test="${paging.nowPage eq cnt}">
				<b>${paging.nowPage}</b>
			</c:if>
			<c:if test="${paging.nowPage ne cnt}">
				<a href="indexSearch.do?nowPage=${cnt}">${cnt}</a>
			</c:if>
		</c:forEach>
			
		<c:if test="${paging.endPage < paging.lastPage}">
		  <a href="indexSearch.do?nowPage=${paging.endPage + 1}">&gt;</a>
		</c:if>
	  </div>
   	</div>

    
    <!-- 추천도서 배너 -->
    <div class="recommend-container-search">
      <div class="banner-container">
        <div class="banner-title">추천 도서</div>
        <c:forEach items="${recommend}" var="vo">
	        <div class="recommend-books">
	          <div>
	            <a href="product.do?product_no=${vo.product_no}">
	              <img src="<%=request.getContextPath()%>/upload/${vo.attachment_detail_new_name}" width="100px"></div>
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
