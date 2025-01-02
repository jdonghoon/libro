<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mypage.css">

    <main>
        <section>
            <div class="post-container">
                <h2>내 게시글</h2>

                <div>
                    <div class="post-search">
                        <div class="date-btn">
	                    	<div class="as">
	                           	<a href="javascript:void(0);" onclick="setDates('today')">오늘</a>
	                            <a href="javascript:void(0);" onclick="setDates('1week')">1주일</a>
	                            <a href="javascript:void(0);" onclick="setDates('1month')">1개월</a>
	                            <a href="javascript:void(0);" onclick="setDates('3months')">3개월</a>
	                            <a href="javascript:void(0);" onclick="setDates('6months')">6개월</a>
	                    	</div>
	                    	<div class="dh">
	                            <input type="date" id="startDate">&nbsp;~&nbsp;<input type="date" id="endDate">
	                            <button onclick="filterTable(document.getElementById('startDate').value, document.getElementById('endDate').value)" class="dh-btn">조회</button>
	                    	</div> 
                        </div>
                    </div>

                    <div class="ask">
                        <h3>1:1 문의내역</h3>
                        <c:if test="${empty contactlist}">
                        	<span>등록된 문의글이 없습니다.</span>
                        </c:if>
                        <c:if test="${not empty contactlist}">
                        <table class="ask-list">
                            <thead>
                                <tr>
                                    <th style="width: 20px;">번호</th>
                                    <th style="width: 70px;">문의유형</th>
                                    <th style="width: 300px;">내용</th>
                                    <th style="width: 80px;">작성자</th>
                                    <th style="width: 70px;">작성일</th>
                                </tr>
                            </thead>
                            <tbody id="contactTableBody">
                                <c:forEach items="${contactlist}" var="vo">
                                <tr>
                                    <td>${vo.contact_seq}</td>
                                    <td>${vo.contact_type}</td>
                                    <td>
                                    	<a href="inquirydetail.do?contact_no=${vo.contact_no}">
                                        	<img src="https://img.icons8.com/?size=100&id=5hmx7LpaoQeJ&format=png&color=000000"> [${vo.contact_type}] <c:if test="${not empty vo.contact_comment}">답변 완료</c:if>
                                        </a>
                                    </td>
                                    <td>${vo.user_name}</td>
                                    <td>${vo.contact_create_at}</td>
                                </tr>
                                </c:forEach> 
                            </tbody>
                        </table>
                        </c:if>
                    </div>
                    
                    <div class="review">
                        <h3>리뷰내역</h3>
                        <div class="order-type">
                            <button class="review-type-button" id="review-possible" onclick="toggleActiveButton('review-possible')">작성 가능한 리뷰(<c:out value="${fn:length(reviewpossiblelist)}" />)</button>
                            <button class="review-type-button" id="review-list" onclick="toggleActiveButton('review-list')">내가 작성한 리뷰(<c:out value="${fn:length(reviewlist)}" />)</button>
<%--                             <button class="review-type-button" id="review-possible" onclick="toggleActiveButton('review-possible')">작성 가능한 리뷰(<c:out value="${fn:length(reviewpossiblelist)}" />)</button>
                            <button class="review-type-button" id="review-list" onclick="toggleActiveButton('review-list')">내가 작성한 리뷰(<c:out value="${fn:length(reviewlist)}" />)</button> --%>
                        </div>

                        <div class="form-container" id="review-possible-form">
						<c:if test="${empty reviewpossiblelist}">
							<span>작성 가능한 리뷰가 없습니다.</span>
						</c:if>
						<c:if test="${not empty reviewpossiblelist}">
                            <c:forEach items="${reviewpossiblelist}" var="vo">
	                            <div class="review-possible-form" >
	                                <div style="display: flex;">
	                                    <img src="<%=request.getContextPath()%>/upload/${vo.attachment_detail_new_name}">
	                                    <div style="display: flex; flex-direction: column; justify-content: space-between;">
	                                    	<div>
		                                        <p><b>${vo.product_name}</b></p>
		                                        <p>${vo.product_author} 저  · ${vo.product_name}</p>
		                                        <p>${vo.product_price}</p>
	                                    	</div>
	                                    	<div>
		                                        <p style="font-size: 13px;">${vo.ordered_date}에 구매하신 상품입니다.</p>
	                                    	</div>
	                                    </div>
	                                </div>
	                                <div> 
	                                    <button onclick="location.href='reviewregister.do?product_no=${vo.product_no}'" class="review-register-btn">리뷰 작성하기</button>
	                                    <br>
	                                    <p class="register-date">작성기한 : 2024.12.10(D-7)</p>
	                                </div>
	                            </div>
                            </c:forEach>
                        </c:if>
                        </div>
                        
                        <table class="review-list-form form-container" id="review-list-form">
						<c:if test="${empty reviewlist}">
							<tr>
								<td style="border: none; width: 900px; padding: 0;">내가 작성한 리뷰가 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${not empty reviewlist}">
                            <thead>
                                <tr>
                                    <th style="width: 35.27px;">번호</th>
                                    <th style="width: 103.88px;">상품 이름</th>
                                    <th style="width: 419.52px;">내용</th>
                                    <th style="width: 127.59px;">평점</th>
                                    <th style="width: 107.75px;">작성일</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach items="${reviewlist}" var="vo">
	                                <tr>
	                                    <td>${vo.review_seq}</td>
	                                    <td><a href="productDetail.do?product_no=${vo.product_no}">${vo.product_name}</a></td>
	                                    <td>${vo.review_content}</td>
	                                    <td>
											<div id="rating" class="rating_box">
												<div class="rating">
													★★★★★
													<span class="rating_star">★★★★★</span>
													<input type="range" value="${vo.review_starrating}" step="1" min="0" max="5" name="review_starrating">
												</div>
											</div>
	                                    </td>
	                                    <td>${vo.review_create_at}</td>
	                                </tr>
                                </c:forEach>
                            </tbody>
						</c:if>
                        </table>
                    </div>
                </div>

            </div> 
        </section>
    </main>

<script>
  function updateRating(value) {
    document.getElementById('rating-display').textContent = value;
  }
</script>
	
	
    <script>
        window.onload = function() {

            // 로컬 스토리지에서 저장된 활성화된 버튼을 불러와서 해당 버튼 활성화
/*             var activeButtonId = localStorage.getItem('activeButtonId');
            if (activeButtonId) {
                toggleActiveButton(activeButtonId);
            } else {
                toggleActiveButton('review-possible');  // 기본 값으로 '주문 목록' 버튼 활성화
            } */
            
            setDates('3months');

            // 오늘 날짜를 구하기
            var today = new Date();
            var todayString = today.toISOString().split('T')[0]; // 'YYYY-MM-DD' 형식으로 변환
    
            // 3개월 전 날짜 구하기
            var threeMonthsAgo = new Date(today);
            threeMonthsAgo.setMonth(today.getMonth() - 3);
            var threeMonthsAgoString = threeMonthsAgo.toISOString().split('T')[0]; // 'YYYY-MM-DD' 형식으로 변환
    
            // 날짜 값을 input 요소에 설정
            document.querySelectorAll('input[type="date"]')[0].value = threeMonthsAgoString; // 첫 번째 date input
            document.querySelectorAll('input[type="date"]')[1].value = todayString; // 두 번째 date input
        };

        function toggleActiveButton(buttonId) {

/*             // 로컬 스토리지에 클릭된 버튼 ID 저장
            localStorage.setItem('activeButtonId', buttonId); */

            // 모든 버튼에서 button-active 클래스 제거
            document.querySelectorAll(".review-type-button").forEach(button => {
                button.classList.remove("pbutton-active");
            });
        
            // 선택한 버튼에 button-active 클래스 추가
            document.getElementById(buttonId).classList.add("pbutton-active");
        
            // 모든 폼을 숨김
            document.querySelectorAll(".form-container").forEach(form => {
                form.classList.remove("active");
            });
        
            // 선택된 버튼에 따라 폼을 표시
            if (buttonId === 'review-list') {
                document.getElementById('review-list-form').classList.add('active');
            } else if (buttonId === 'review-possible') {
                document.getElementById('review-possible-form').classList.add('active');
            }
        }
    
        // 초기 상태에서 기존 회원 폼을 표시
        document.getElementById('review-possible').classList.add('pbutton-active');
        document.getElementById('review-possible-form').classList.add('active');


        function setDates(range) {
        
        var today = new Date();
        var todayString = today.toISOString().split('T')[0]; // 'YYYY-MM-DD' 형식으로 변환
        var startDate, endDate;

        // 날짜 범위에 맞게 설정
        if (range === 'today') {
            // 오늘 날짜로 설정
            startDate = todayString;
            endDate = todayString;
        } else if (range === '1week') {
            // 1주일 전 날짜로 설정
            var oneWeekAgo = new Date(today);
            oneWeekAgo.setDate(today.getDate() - 7);
            startDate = oneWeekAgo.toISOString().split('T')[0];
            endDate = todayString;
        } else if (range === '1month') {
            // 1개월 전 날짜로 설정
            var oneMonthAgo = new Date(today);
            oneMonthAgo.setMonth(today.getMonth() - 1);
            startDate = oneMonthAgo.toISOString().split('T')[0];
            endDate = todayString;
        } else if (range === '3months') {
            // 3개월 전 날짜로 설정
            var threeMonthsAgo = new Date(today);
            threeMonthsAgo.setMonth(today.getMonth() - 3);
            startDate = threeMonthsAgo.toISOString().split('T')[0];
            endDate = todayString;
        } else if (range === '6months') {
            // 3개월 전 날짜로 설정
            var threeMonthsAgo = new Date(today);
            threeMonthsAgo.setMonth(today.getMonth() - 6);
            startDate = threeMonthsAgo.toISOString().split('T')[0];
            endDate = todayString;
        }

        // 시작 날짜와 종료 날짜를 input 필드에 설정
        document.querySelectorAll('input[type="date"]')[0].value = startDate;
        document.querySelectorAll('input[type="date"]')[1].value = endDate;

        // 필터링 실행
        filterTable(startDate, endDate);
    }
        
	function filterTable(startDate, endDate) {
	    // 테이블의 행 가져오기
	    const tableRows = document.querySelectorAll("#contactTableBody tr");
	
	    // 각 행 검사
	    tableRows.forEach(row => {
	        const dateCell = row.cells[4].innerText; // 작성일 열 (0부터 시작, 4번째 열)
	        const rowDate = new Date(dateCell);
	
	        // 시간 정보를 제거한 날짜로 변환
	        const start = new Date(startDate);
	        start.setHours(0, 0, 0, 0); // 시간 초기화
	        const end = new Date(endDate);
	        end.setHours(23, 59, 59, 999); // 하루의 마지막 시간으로 설정
	        rowDate.setHours(0, 0, 0, 0); // 시간 초기화

	        // 행 표시/숨김 결정
	        if (rowDate >= start && rowDate <= end) {
	            row.style.display = ""; // 조건에 맞으면 표시
	        } else {
	            row.style.display = "none"; // 조건에 맞지 않으면 숨김
	        }
	    });
	}
        
	const rating_input = document.querySelector('.rating input');
	const rating_star = document.querySelector('.rating_star');

	// 초기값 설정 (rvo.review_starrating에 따라 별점 너비 계산)
	const initialRating = parseInt(rating_input.value, 20);
	rating_star.style.width = (initialRating * 20) + '%';  // 초기 별점 너비 설정
    </script>

<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>	
