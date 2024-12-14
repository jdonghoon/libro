<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mypage.css">

    <main>
        <section>
            <div class="post-container">
                <h2>내 게시글</h2>

                <div>
                    <div class="post-search">
                        <div class="date-btn">
                            <a href="javascript:void(0);" onclick="setDates('today')">오늘</a>
                            <a href="javascript:void(0);" onclick="setDates('1week')">1주일</a>
                            <a href="javascript:void(0);" onclick="setDates('1month')">1개월</a>
                            <a href="javascript:void(0);" onclick="setDates('3months')">3개월</a>
                            <a href="javascript:void(0);" onclick="setDates('6months')">6개월</a>
                            <input type="date">~<input type="date">
                            <button onclick="location.href='addrmodify.do'" class="dh-btn">조회</button>
                        </div>
                    </div>

                    <div class="ask">
                        <h3>1:1 문의내역</h3>
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
                            <tbody>
<!--                                 <tr>
                                    <td>2</td>
                                    <td>상품문의</td>
                                    <td>
                                        <img src="http://img0001.echosting.cafe24.com/front/type_b/image/common/icon_re.gif" alt="답변" class="ec-common-rwd-image">
                                        <img src="http://img0001.echosting.cafe24.com/front/type_b/image/common/icon_lock.gif" alt="비밀글" class="ec-common-rwd-image">
                                        <img src="https://img.icons8.com/?size=100&id=5hmx7LpaoQeJ&format=png&color=000000"> 답변완료
                                    </td>
                                    <td>홍길동</td>
                                    <td>2024.12.03</td>
                                </tr> -->
                                <c:forEach items="${list}" var="vo">
                                <tr>
                                    <td>${vo.contact_no}</td>
                                    <td>${vo.contact_type}</td>
                                    <td>
                                    	<a href="inquirydetail.do?contact_no=${vo.contact_no}">
                                        	<img src="https://img.icons8.com/?size=100&id=5hmx7LpaoQeJ&format=png&color=000000"> [${vo.contact_type}]
                                        </a>
                                    </td>
                                    <td>${vo.user_name}</td>
                                    <td>${vo.contact_create_at}</td>
                                </tr>
                                </c:forEach> 
                            </tbody>
                        </table>
                    </div>
                    
                    <div class="review">
                        <h3>리뷰내역</h3>
                        <div class="order-type">
                            <button class="review-type-button" id="review-list" onclick="toggleActiveButton('review-list')">작성 가능한 리뷰(0)</button>
                            <button class="review-type-button" id="review-possible" onclick="toggleActiveButton('review-possible')">내가 작성한 리뷰(0)</button>
                        </div>
                        
                        <table class="review-list-form form-container" id="review-list-form">
                            <thead>
                                <tr>
                                    <th style="width: 36px;">번호</th>
                                    <th style="width: 100px;">상품 이름</th>
                                    <th style="width: 120px;">평점</th>
                                    <th style="width:470px;">내용</th>
                                    <th style="width: 70px;">작성일</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>채식주의자</td>
                                    <td>
                                        <img src="https://img.icons8.com/?size=100&id=G4zH9X90bt1j&format=png&color=FFAA00" style="width: 20px;">
                                        <img src="https://img.icons8.com/?size=100&id=G4zH9X90bt1j&format=png&color=FFAA00" style="width: 20px;">
                                        <img src="https://img.icons8.com/?size=100&id=G4zH9X90bt1j&format=png&color=FFAA00" style="width: 20px;">
                                        <img src="https://img.icons8.com/?size=100&id=G4zH9X90bt1j&format=png&color=FFAA00" style="width: 20px;">
                                        <img src="https://img.icons8.com/?size=100&id=G4zH9X90bt1j&format=png&color=FFAA00" style="width: 20px;">
                                    </td>
                                    <td>감동</td>
                                    <td>2024.12.03</td>
                                </tr>
                            </tbody>
                        </table>

                        <div class="form-container" id="review-possible-form">
                            <div class="review-possible-form" >
                                <div style="display: flex;">
                                    <img src="소년이 온다.jpg">
                                    <div>
                                        <p><b>소년이 온다</b></p><br><br><br><br>
                                        <p>2024.12.03에 구매하신 상품입니다.</p>
                                    </div>
                                </div>
                                <div>
                                    <button onclick="location.href='reviewregister.do'" class="review-register-btn">리뷰 작성하기</button>
                                    <br>
                                    <p class="register-date">작성기한 : 2024.12.10(D-7)</p>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </section>
    </main>

    <script>
        window.onload = function() {

            // 로컬 스토리지에서 저장된 활성화된 버튼을 불러와서 해당 버튼 활성화
            var activeButtonId = localStorage.getItem('activeButtonId');
            if (activeButtonId) {
                toggleActiveButton(activeButtonId);
            } else {
                toggleActiveButton('review-list');  // 기본 값으로 '주문 목록' 버튼 활성화
            }

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

            // 로컬 스토리지에 클릭된 버튼 ID 저장
            localStorage.setItem('activeButtonId', buttonId);

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
        document.getElementById('review-list').classList.add('pbutton-active');
        document.getElementById('review-list-form').classList.add('active');


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

        // 첫 번째 date input에 시작 날짜 설정
        document.querySelectorAll('input[type="date"]')[0].value = startDate;
        // 두 번째 date input에 종료 날짜 설정
        document.querySelectorAll('input[type="date"]')[1].value = endDate;
    }
    </script>

<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>	
