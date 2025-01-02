<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/menu.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
		
		<!-- carousel (슬라이드) -->
		<main class="main-container">
			<section class="carousel-section">
				<div class="background-area"></div>
				<div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="https://cdn.ypbooks.co.kr/image/banner/202411/62a376a7-fb6a-43cd-b675-c9522c619e47.png" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="https://cdn.ypbooks.co.kr/image/banner/202411/5d84df24-6a2d-4cce-bd80-f4e934069332.png" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="https://cdn.ypbooks.co.kr/image/banner/202411/8799bb20-6ad4-4be9-a709-1a847ebadf88.png" class="d-block w-100" alt="...">
						</div>
					</div>
				</div>
			</section>

			<section class="content-section">
				
				<!-- 베스트 셀러 -->
				<div class="content-container">
					<div class="content-section-title">
						<div class="content-section-1st-title">
							<div>베스트 셀러</div>
						</div>
						<div>
							<a href="bestsellerList.do">
								<img src="https://img.icons8.com/?size=100&id=3220&format=png&color=000000" width="12px;">
							</a>
						</div>
					</div>
					<div class="content-list">
					
						<c:forEach items="${bestseller}" var="vo">
							<div class="content-item">
							<a href="product.do?product_no=${vo.product_no}">
								<img src="<%=request.getContextPath()%>/upload/${vo.attachment_detail_new_name}" width="250px;" height="350px;">
								<div class="title" name="title">${vo.product_name}</div>
								<div class="writer" name="writer">${vo.product_author}</div>
							</a>
						</div>
						</c:forEach>
					</div>
				</div>
			
				<!-- 화제의 신간 -->
				<div class="content-container">
					<div class="content-section-title">
						<div class="content-section-1st-title">
							<div>화제의 신간</div>
						</div>
						<div>
							<a href="newList.do">
								<img src="https://img.icons8.com/?size=100&id=3220&format=png&color=000000" width="12px;">
							</a>
						</div>
					</div>
					<div class="content-list">
					
					<c:forEach items="${hot}" var="vo">
						<div class="content-item">
							<a href="product.do?product_no=${vo.product_no}">
								<img src="<%=request.getContextPath()%>/upload/${vo.attachment_detail_new_name}" width="250px;" height="350px;">
								<div class="title" name="title">${vo.product_name}</div>
								<div class="writer" name="writer">${vo.product_author}</div>
							</a>
						</div>
					</c:forEach>
					</div>
				</div>
				
				<!-- 오늘의 책 -->
				<div class="content-container">
					<div class="content-section-title">
						<div class="content-section-1st-title">
							<div>오늘의 책</div>
							<div class="content-date">오늘 날짜</div>
						</div>
					</div>
					<div class="content-list">
						
						<c:forEach items="${today}" var="vo">
							<div class="content-item">
								<a href="product.do?product_no=${vo.product_no}">
									<c:if test="${not empty vo.attachment_detail_new_name}">
										<img src="<%=request.getContextPath()%>/upload/${vo.attachment_detail_new_name}" width="250px;" height="350px;">
									</c:if>
									<div class="title" name="title" style="width: 200px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${vo.product_name}</div>
									<div class="writer" name="writer">${vo.product_author}</div>
								</a>
							</div>	 
						</c:forEach> 
					</div>
				</div>
			</section>
		</main>

<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>		

