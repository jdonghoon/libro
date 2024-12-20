<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mypage.css">

    <main>
        <section>
            <div class="review-container">
                <h1>리뷰 등록</h1>

                <div class="review-possible-form" >
                    <div style="display: flex;">
                        <img src="<%=request.getContextPath()%>/upload/${vo.attachment_detail_new_name}">
                        <div>
                            <p><b>${vo.product_name}</b></p>
                            <p>${vo.product_author} 저  · ${vo.product_name}</p>
                      <p>${vo.product_price}</p> 
                        </div>
                    </div>
                </div> 

                <form action="reviewupdateOk.do" method="POST">
            		<input type="hidden" name="review_no" value="${rvo.review_no}">
                    <label for="rating">평점 (1~5)</label>
					<div id="rating" class="rating_box">
						<div class="rating">
							★★★★★
							<span class="rating_star">★★★★★</span>
							<input type="range" value="${rvo.review_starrating}" step="1" min="0" max="5" name="review_starrating">
						</div>
					</div>
 
                    <label for="review">리뷰</label>
                    <textarea id="review" name="review_content" rows="5" placeholder="책에 대한 리뷰를 작성하세요" required>${rvo.review_content}</textarea>
                    
                    <button class="dh-btn">리뷰 수정</button>
                </form>
            </div>
        </section>
    </main>

	<script>
		const rating_input = document.querySelector('.rating input');
		const rating_star = document.querySelector('.rating_star');

		// 초기값 설정 (rvo.review_starrating에 따라 별점 너비 계산)
		const initialRating = parseInt(rating_input.value, 20);
		rating_star.style.width = (initialRating * 20) + '%';  // 초기 별점 너비 설정

		// 별점 드래그 할 때
		rating_input.addEventListener('input', function() {
			const width = rating_input.value * 20;  // 계산된 너비
			rating_star.style.width = width + '%'; // 너비 적용
		});
	</script>
	
<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>	
