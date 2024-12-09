<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/menu.css">

<main class="main-container-detail">
  <!-- 왼쪽 섹션: 상품 이미지 -->
    <div class="first-container-detail">
      <div class="left-container-detail">
        <div><img src="https://cdn.ypbooks.co.kr/image/product/202411/520e42e1-40c5-4632-a3cf-71182e3a89d8_192.jpg" width="300px;"></div>
      </div>
      <!-- 오른쪽 섹션: 상품 정보 및 구매 -->
      <div class="right-container-detail">
        <div class="book-info">
          <div class="title">책 제목</div>
          <div>저자</div>
          <div>평점</div>
          <div>가격</div>
        </div>
        <div class="shipping-info">
          <div class="shipping-title">배송정보</div>
          <div>배송비</div>
          <div>배송안내배송안내배송안내배송안내배송안내배송안내배송안내배송안내배송안내배송안내배송안내배송안내배송안내배송안내배송안내배송안내배송안내배송안내배송안내배송안내배송안내</div>
        </div>
        <form action="purchase.html" method="get">
          <div class="quantity-info">
            <div>
              <button type="button"><img src="https://img.icons8.com/?size=100&id=79029&format=png&color=000000" width="10px"></button>
                <span>1</span>
              <button type="button"><img src="https://img.icons8.com/?size=100&id=3220&format=png&color=000000" width="10px"></button>
            </div>
            <div class="total-price">총 가격</div>
          </div>
          <div class="button-area-detail">
            <div>
              <button type="button" class="wishlist" onclick="location.href='wishlist.html'">위시리스트</button>
              <button type="button" class="cart" onclick="location.href='cart.html'">장바구니</button>
              <button type="submit" class="purchase">바로 구매</button>
            </div>
          </div>
        </form>
      </div>
    </div>

    <!-- 상품 규격 정보 -->
    <div class="second-container">
      <div class="container-title">상품 규격 정보</div>
      <div class="specification-info-detail">
        <div class="specification-info-detail-item">
          <div class="ISBN">ISBN</div>
          <div class="specification-info-content">내용</div>
        </div>
        <div class="specification-info-detail-item">
          <div class="page">쪽수</div>
          <div class="specification-info-content">내용</div>
        </div>
        <div class="specification-info-detail-item">
          <div class="composition">제품구성</div>
          <div class="specification-info-content">내용</div>
        </div>
      </div>
    </div>

    <!-- 책 소개 -->
    <div class="third-container">
      <div class="container-title">책 소개</div>
      <div class="book-info-content">
        내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
        내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
        내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
      </div>
    </div>

    <!-- 카테고리 -->
    <div class="fourth-container">
      <div class="container-title">카테고리</div>
      <div class="category-content">
        - 시
      </div>
    </div>

    <!-- 저자 -->
    <div class="fifth-container">
      <div class="container-title">저자</div>
      <div class="writer-content">
        - 전동훈
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
                <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="20x">
                <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="20x">
                <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="20x">
                <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="20x">
                <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="20x">
                <div class="evaluation-score">4.1 / 5</div>
              </div>
            </div>
            <div class="display-container">
              <div class="evaluation-title">전체 리뷰 수</div>
              <div class="evaluation-count">20</div>
            </div>
            <div class="display-container">
              <div class="evaluation-title">평점 비율</div>
              <div class="evaluation-ratio">
                <div>
                  <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="10x">
                  <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="10x">
                  <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="10x">
                  <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="10x">
                  <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="10x">
                  <span class="star-score">85%</span>
                </div>
                <div>
                  <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="10x">
                  <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="10x">
                  <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="10x">
                  <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="10x">
                  <img src="https://img.icons8.com/?size=100&id=zjmyhXVAojeZ&format=png&color=000000" width="10x">
                  <span class="star-score">7%</span>
                </div>
                <div>
                  <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="10x">
                  <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="10x">
                  <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="10x">
                  <img src="https://img.icons8.com/?size=100&id=zjmyhXVAojeZ&format=png&color=000000" width="10x">
                  <img src="https://img.icons8.com/?size=100&id=zjmyhXVAojeZ&format=png&color=000000" width="10x">
                  <span class="star-score">3%</span>
                </div>
                <div>
                  <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="10x">
                  <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="10x">
                  <img src="https://img.icons8.com/?size=100&id=zjmyhXVAojeZ&format=png&color=000000" width="10x">
                  <img src="https://img.icons8.com/?size=100&id=zjmyhXVAojeZ&format=png&color=000000" width="10x">
                  <img src="https://img.icons8.com/?size=100&id=zjmyhXVAojeZ&format=png&color=000000" width="10x">
                  <span class="star-score">0%</span>
                </div>
                <div>
                  <img src="https://img.icons8.com/?size=100&id=zjmyhXVAojeZ&format=png&color=000000" width="10x">
                  <img src="https://img.icons8.com/?size=100&id=zjmyhXVAojeZ&format=png&color=000000" width="10x">
                  <img src="https://img.icons8.com/?size=100&id=zjmyhXVAojeZ&format=png&color=000000" width="10x">
                  <img src="https://img.icons8.com/?size=100&id=zjmyhXVAojeZ&format=png&color=000000" width="10x">
                  <img src="https://img.icons8.com/?size=100&id=zjmyhXVAojeZ&format=png&color=000000" width="10x">
                  <span class="star-score">5%</span>
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
          <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="10x">
          <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="10x">
          <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="10x">
          <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="10x">
          <img src="https://img.icons8.com/?size=100&id=87XmLcImcKSL&format=png&color=000000" width="10x">
          <span class="review-star-score">4.1</span>
        </div>
        <div class="write-info">
          <div>작성자 id</div>
          <span>|</span>
          <div>작성일</div>
        </div>
        <div class="review-content">
          내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
          내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
          내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
        </div>
      </div>
    </div>
  </main>

<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>	