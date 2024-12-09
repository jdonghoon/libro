<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mypage.css">

    <main>
        <section>
            <div class="review-container">
                <h1>리뷰 등록</h1>
                <form action="/submit-review" method="POST">
            
                    <div class="review-possible-form" >
                        <div style="display: flex;">
                            <img src="소년이 온다.jpg">
                            <div>
                                <p><b>소년이 온다</b></p>
                            </div>
                        </div>
                    </div>
                    
                    <label for="rating">평점 (1~5)</label>
                        <div class="rating">
                            <input type="radio" id="star1" name="rating" value="1"><label for="star1">★</label>
                            <input type="radio" id="star2" name="rating" value="2"><label for="star2">★</label>
                            <input type="radio" id="star3" name="rating" value="3"><label for="star3">★</label>
                            <input type="radio" id="star4" name="rating" value="4"><label for="star4">★</label>
                            <input type="radio" id="star5" name="rating" value="5"><label for="star5">★</label>
                        </div>
                    
                    <label for="review">리뷰</label>
                    <textarea id="review" name="review" rows="5" placeholder="책에 대한 리뷰를 작성하세요" required>0자</textarea>
                    
                    <button type="submit" class="dh-btn">리뷰 등록</button>
                </form>
            </div>
        </section>
    </main>

<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>	
