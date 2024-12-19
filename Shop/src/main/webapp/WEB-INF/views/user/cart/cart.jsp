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

      <label class="checkbox-label">
        <input type="checkbox" name="book" value="1" />
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
            </div>
          </div>
        </div>
      </label>

      <label class="checkbox-label">
        <input type="checkbox" name="book" value="2" />
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
            </div>
          </div>
        </div>
      </label>

      <label class="checkbox-label">
        <input type="checkbox" name="book" value="3" />
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
            </div>
          </div>
        </div>
      </label>
      <script>
        const selectAllCheckbox = document.getElementById("selectAll");
        const checkboxes = document.querySelectorAll('input[name="book"]');
      
        // "전체 선택" 체크박스 클릭 시 모든 체크박스 상태 변경
        selectAllCheckbox.addEventListener("change", () => {
          checkboxes.forEach((checkbox) => {
            checkbox.checked = selectAllCheckbox.checked;
          });
        });
      
        // 개별 체크박스 클릭 시 "전체 선택" 상태 업데이트
        checkboxes.forEach((checkbox) => {
          checkbox.addEventListener("change", () => {
            const allChecked = Array.from(checkboxes).every((cb) => cb.checked);
            selectAllCheckbox.checked = allChecked;
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