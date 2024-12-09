<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mypage.css">

    <main>
        <section>
            <div class="order-container">
                <h2>주문조회</h2>
                <div class="order-type">
                    <button class="order-type-button" id="order-list" onclick="toggleActiveButton('order-list')">주문내역조회(3)</button>
                    <button class="order-type-button" id="order-cancel" onclick="toggleActiveButton('order-cancel')">취소/반품 내역(1)</button>
                </div>

                <div class="form-container" id="order-list-form">
                    <div class="order-search">
                        <select>
                            <option>전체 주문처리상태</option>
                            <option>배송준비중</option>
                            <option>배송중</option>
                            <option>배송완료</option>
                            <option>취소</option>
                            <option>반품</option>
                        </select>
                        <div class="date-btn">
                            <a href="javascript:void(0);" onclick="setDates('today')">오늘</a>
                            <a href="javascript:void(0);" onclick="setDates('1week')">1주일</a>
                            <a href="javascript:void(0);" onclick="setDates('1month')">1개월</a>
                            <a href="javascript:void(0);" onclick="setDates('3months')">3개월</a>
                            <a href="javascript:void(0);" onclick="setDates('6months')">6개월</a>
                            <input type="date"> ~ <input type="date">
                            <button onclick="location.href='addrmodify.do'" class="dh-btn">조회</button>
                        </div>
                    </div>
                    
                    <p>취소 신청은 배송완료일 기준 7일까지 가능합니다.</p>
                    
                    <table class="order-list">
                        <thead>
                            <tr>
                                <th>주문번호</th>
                                <th>주문일자</th>
                                <th>주문내역</th>
                                <th>주문금액/수량</th>
                                <th>주문상태</th>
                                <th>배송조회</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <a href="orderhistorydetail.do">1234567</a>
                                </td>
                                <td>2024.12.03</td>
                                <td>[소설]채식주의자</td>
                                <td>13,500 / 1</td>
                                <td>배송완료</td>
                                <td><a href="#">조회</a></td>
                            </tr>
                            <tr>
                                <td>1234566</td>
                                <td>2024.12.02</td>
                                <td>[소설]소년이 온다</td>
                                <td>13,500 / 1</td>
                                <td class="red">배송완료</td>
                                <td><a href="#">조회</a></td>
                            </tr>
                        </tbody>
                    </table>
                    〈〈&nbsp;&nbsp;&nbsp;〈&nbsp;&nbsp;&nbsp;1&nbsp;&nbsp;&nbsp;〉&nbsp;&nbsp;&nbsp;〉〉
                </div>

                <div class="form-container" id="order-cancel-form">
                    <div class="order-search">
                        <div class="date-btn">
                            <a href="javascript:void(0);" onclick="setDates('today')">오늘</a>
                            <a href="javascript:void(0);" onclick="setDates('1week')">1주일</a>
                            <a href="javascript:void(0);" onclick="setDates('1month')">1개월</a>
                            <a href="javascript:void(0);" onclick="setDates('3months')">3개월</a>
                            <a href="javascript:void(0);" onclick="setDates('6months')">6개월</a>
                            <input type="date"> ~ <input type="date">
                            <button onclick="location.href='addrmodify.do'" class="dh-btn">조회</button>
                        </div>
                    </div>
                    
                    <table class="order-list">
                        <thead>
                            <tr>
                                <th>주문번호</th>
                                <th>주문일자</th>
                                <th>주문내역</th>
                                <th>주문금액/수량</th>
                                <th>주문상태</th>
                                <th>배송조회</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <a href="orderhistorydetail.do">1234567</a>
                                </td>
                                <td>2024.12.03</td>
                                <td>[소설]채식주의자</td>
                                <td>13,500 / 1</td>
                                <td>취소</td>
                                <td><a href="#">조회</a></td>
                            </tr>
                        </tbody>
                    </table>
                    〈〈&nbsp;&nbsp;&nbsp;〈&nbsp;&nbsp;&nbsp;1&nbsp;&nbsp;&nbsp;〉&nbsp;&nbsp;&nbsp;〉〉
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
                toggleActiveButton('order-list');  // 기본 값으로 '주문 목록' 버튼 활성화
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
            document.querySelectorAll(".order-type-button").forEach(button => {
                button.classList.remove("obutton-active");
            });

            // 선택한 버튼에 button-active 클래스 추가
            document.getElementById(buttonId).classList.add("obutton-active");

            // 모든 폼을 숨김
            document.querySelectorAll(".form-container").forEach(form => {
                form.classList.remove("active");
            });

            // 선택된 버튼에 따라 폼을 표시
            if (buttonId === 'order-list') {
                document.getElementById('order-list-form').classList.add('active');
            } else if (buttonId === 'order-cancel') {
                document.getElementById('order-cancel-form').classList.add('active');
            }
        }
    
        // 초기 상태에서 기존 회원 폼을 표시
        document.getElementById('order-list').classList.add('obutton-active');
        document.getElementById('order-list-form').classList.add('active');


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
