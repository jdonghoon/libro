<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/menu.css">

<main class="main-container-list">
  <!-- 카테고리 선택 -->
  <div class="category-title">Category</div>
  <div class="category-container">
    <div>
      <a class="category-item" href="#">시</a>
      <a class="category-item" href="#">소설</a>
      <a  class="category-item" href="#">자기개발서</a>
    </div>
    <div>
      <a class="category-item" href="#">만화</a>
      <a class="category-item" href="#">예술</a>
      <a class="category-item" href="#">자연/과학</a>
    </div>
    <div>
      <a class="category-item" href="#">학습</a>
      <a class="category-item" href="#">기술/공학</a>
      <a class="category-item" href="#">수험서</a>
    </div>
    <script>
    	let item = $(".category-item").val();
    	console.log(item);
    </script>
  </div>
  <div class="search-result-container">
    <div class="result-container">
      <div class="menu-area">
        <ul>
          <li><a href="">판매순</a></li>
          <span>|</span>
          <li><a href="">신상품순</a></li>
          <span>|</span>
          <li><a href="">높은 가격순</a></li>
          <span>|</span>
          <li><a href="">낮은 가격순</a></li>
        </ul>
      </div>
      <!-- 도서 리스트 -->
      <div class="book-info-container-list">
        <div class="book-image">
          <a href="product_detail.html">
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
            <button onclick="cntUp()"><img src="https://img.icons8.com/?size=100&id=79029&format=png&color=000000" width="10px"></button>
              <span id="count">1</span>
            <button onclick="cntDown()"><img src="https://img.icons8.com/?size=100&id=3220&format=png&color=000000" width="10px"></button>
          </div>
          <script>
          	function cntUp() {
          		let count = $("#count").text();
          		let updateCount = count + 1;
          		
          		$.ajax({
          			url: "list.do",
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
	          			url: "list.do",
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
          <div class="button-area-list">
            <div class="payment"><button>바로구매</button></div>
            <div class="cart"><button>장바구니</button></div>
            <div class="wishlist"><button>위시리스트</button></div>
          </div>
        </div>
      </div>
      <div class="book-info-container-list">
        <div class="book-image">
          <a href="product_detail.html">
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
          <div class="button-area-list">
            <div class="payment"><button>바로구매</button></div>
            <div class="cart"><button>장바구니</button></div>
            <div class="wishlist"><button>위시리스트</button></div>
          </div>
        </div>
      </div>
      <div class="book-info-container-list">
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
          <div class="button-area-list">
            <div class="payment"><button>바로구매</button></div>
            <div class="cart"><button>장바구니</button></div>
            <div class="wishlist"><button>위시리스트</button></div>
          </div>
        </div>
      </div>
      <div class="book-info-container-list">
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
          <div class="button-area-list">
            <div class="payment"><button>바로구매</button></div>
            <div class="cart"><button>장바구니</button></div>
            <div class="wishlist"><button>위시리스트</button></div>
          </div>
        </div>
      </div>
    </div>
    <div class="recommend-container">
      <div class="banner-container">
        <div class="banner-title">추천 도서</div>
        <div class="recommend-books">
          <div>
            <a href="#">
              <img src="https://cdn.ypbooks.co.kr/image/product/202411/520e42e1-40c5-4632-a3cf-71182e3a89d8_192.jpg" width="100px"></div>
              <div class="recommend-info">
                <div class="recommend-title">제목</div>
                <div class="recommend-writer">저자</div>
              </div>
            </a>
        </div>
        <div class="recommend-books">
          <div>
            <a href="#">
              <img src="https://cdn.ypbooks.co.kr/image/product/202411/520e42e1-40c5-4632-a3cf-71182e3a89d8_192.jpg" width="100px"></div>
              <div class="recommend-info">
                <div class="recommend-title">제목</div>
                <div class="recommend-writer">저자</div>
              </div>
            </a>
        </div>
        <div class="recommend-books">
          <div>
            <a href="#">
              <img src="https://cdn.ypbooks.co.kr/image/product/202411/520e42e1-40c5-4632-a3cf-71182e3a89d8_192.jpg" width="100px"></div>
              <div class="recommend-info">
                <div class="recommend-title">제목</div>
                <div class="recommend-writer">저자</div>
              </div>
            </a>
        </div>
        <div class="recommend-books">
          <div>
            <a href="#">
              <img src="https://cdn.ypbooks.co.kr/image/product/202411/520e42e1-40c5-4632-a3cf-71182e3a89d8_192.jpg" width="100px"></div>
              <div class="recommend-info">
                <div class="recommend-title">제목</div>
                <div class="recommend-writer">저자</div>
              </div>
            </a>
        </div>
      </div>
    </div>
  </div>
</main>

<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>	