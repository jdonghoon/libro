<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mypage.css">

    <main>
        <section>
            <div class="order-container">
                <h2>주문조회</h2>
                <div class="order-type">
                    <button class="order-type-button" id="order-list" onclick="toggleActiveButton('order-list')">주문내역조회</button>
                    <button class="order-type-button" id="order-cancel" onclick="toggleActiveButton('order-cancel')">취소/반품 내역</button>
<%--                     <button class="order-type-button" id="order-list" onclick="toggleActiveButton('order-list')">주문내역조회(<c:out value="${fn:length(list)}" />)</button>
                    <button class="order-type-button" id="order-cancel" onclick="toggleActiveButton('order-cancel')">취소/반품 내역(<c:out value="${fn:length(cancellist)}" />)</button> --%>
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
                        	<div class="as">
	                            <a href="javascript:void(0);" onclick="setDates('today')">오늘</a>
	                            <a href="javascript:void(0);" onclick="setDates('1week')">1주일</a>
	                            <a href="javascript:void(0);" onclick="setDates('1month')">1개월</a>
	                            <a href="javascript:void(0);" onclick="setDates('3months')">3개월</a>
	                            <a href="javascript:void(0);" onclick="setDates('6months')">6개월</a>
                        	</div>
                        	<div class="dh">
	                            <input type="date">&nbsp;~&nbsp;<input type="date">
	                            <button onclick="filterTable(document.getElementById('startDate').value, document.getElementById('endDate').value)" class="dh-btn">조회</button>
                        	</div>
                        </div>
                    </div>

                    <p>취소 신청은 배송완료일 기준 7일까지 가능합니다.</p>
					
					<!-- 회원 -->
					<sec:authorize access="isAuthenticated()">
					<c:forEach items="${list}" var="vo">
	                    <div class="order-history-form" >
	                        <div class="order-no">
	                            <span class="order-history">${vo.ordered_date} (${vo.ordered_no})</span>
	                            <span class="fp"><a href="orderhistorydetail.do?ordered_no=${vo.ordered_no}">상세보기</a></span>
	                        </div>
	                        <div class="order-product">
	                            <div style="display: flex;">
	                                <img src="<%=request.getContextPath()%>/upload/${vo.attachment_detail_new_name}">
	                                <div>
	                                    <p>[${vo.category_name}] ${vo.product_name}</p>
	                                    <p>${vo.product_author} 저 · ${vo.product_publisher}</p>
	                                    <p style="margin-bottom: 15px;">${vo.ordered_detail_unit_price}원</p>
	                                    <p>[${vo.ordered_detail_quantity}개]</p>
	                                </div>
	                            </div>
	                            <span class="lp">
	                            	<c:if test="${vo.ordered_status eq 'O' && vo.payment_type eq 'PC'}">상품 준비중</c:if>
	                            	<c:if test="${vo.ordered_status eq 'D' && vo.payment_type eq 'PC'}">배송중</c:if>
	                            	<c:if test="${vo.ordered_status eq 'CW' && vo.payment_type eq 'RW'}">취소 처리중</c:if>
	                            	<c:if test="${vo.ordered_status eq 'CC' && vo.payment_type eq 'RC'}">취소 완료</c:if>
	                            </span>
	                        </div>
	                        <c:if test="${vo.ordered_status eq 'O' && vo.payment_type eq 'PC'}">
		                        <div style="display: flex; margin-top: 5px; justify-content: flex-end;">
		                            <a href="#" class="order-modify" onclick="openWindow(${vo.ordered_no})">배송지 변경</a>
		                            <a href="#" class="order-modify" onclick="orderhistorycancel(${vo.ordered_no}, ${vo.payment_no})">주문취소</a>
		                        </div>
	                        </c:if>
	                    </div>
                    </c:forEach>
                    </sec:authorize>
                    <!-- 비회원 -->
					<sec:authorize access="isAnonymous()">
					<c:forEach items="${listguest}" var="vo">
	                    <div class="order-history-form" >
	                        <div class="order-no">
	                            <span class="order-history">${vo.ordered_date} (${vo.ordered_no})</span>
	                            <span class="fp"><a href="orderhistorydetail.do?ordered_no=${vo.ordered_no}">상세보기</a></span>
	                        </div>
	                        <div class="order-product">
	                            <div style="display: flex;">
	                                <img src="<%=request.getContextPath()%>/upload/${vo.attachment_detail_new_name}">
	                                <div>
	                                    <p>[${vo.category_name}] ${vo.product_name}</p>
	                                    <p>${vo.product_author} 저 · ${vo.product_publisher}</p>
	                                    <p style="margin-bottom: 15px;">${vo.ordered_detail_unit_price}원</p>
	                                    <p>[${vo.ordered_detail_quantity}개]</p>
	                                </div>
	                            </div>
	                            <span class="lp">
	                            	<c:if test="${vo.ordered_status eq 'O' && vo.payment_type eq 'PC'}">상품 준비중</c:if>
	                            	<c:if test="${vo.ordered_status eq 'D' && vo.payment_type eq 'PC'}">배송중</c:if>
	                            	<c:if test="${vo.ordered_status eq 'CW' && vo.payment_type eq 'RW'}">취소 처리중</c:if>
	                            	<c:if test="${vo.ordered_status eq 'CC' && vo.payment_type eq 'RC'}">취소 완료</c:if>
	                            </span>
	                        </div>
	                        <c:if test="${vo.ordered_status eq 'O' && vo.payment_type eq 'PC'}">
		                        <div style="display: flex; margin-top: 5px; justify-content: flex-end;">
		                            <a href="#" class="order-modify" onclick="openWindow(${vo.ordered_no})">배송지 변경</a>
		                            <a href="#" class="order-modify" onclick="orderhistorycancel(${vo.ordered_no}, ${vo.payment_no})">주문취소</a>
		                        </div>
	                        </c:if>
	                    </div>
                    </c:forEach>
                    </sec:authorize>

	                <div class="pagination">
						〈〈&nbsp;&nbsp;&nbsp;〈&nbsp;&nbsp;&nbsp;1&nbsp;&nbsp;&nbsp;〉&nbsp;&nbsp;&nbsp;〉〉
	                </div>
                </div>
 
                <div class="form-container" id="order-cancel-form">
                    <div class="order-search">
                        <div class="date-btn">
                        	<div class="as">
	                            <a href="javascript:void(0);" onclick="setDates('today')">오늘</a>
	                            <a href="javascript:void(0);" onclick="setDates('1week')">1주일</a>
	                            <a href="javascript:void(0);" onclick="setDates('1month')">1개월</a>
	                            <a href="javascript:void(0);" onclick="setDates('3months')">3개월</a>
	                            <a href="javascript:void(0);" onclick="setDates('6months')">6개월</a>
                        	</div>
                        	<div class="dh">
	                            <input type="date">&nbsp;~&nbsp;<input type="date">
	                            <button onclick="filterTable(document.getElementById('startDate').value, document.getElementById('endDate').value)" class="dh-btn">조회</button>
                        	</div>
                        </div>
                    </div>
                    
					<!-- 회원 -->
					<sec:authorize access="isAuthenticated()">
					<c:forEach items="${cancellist}" var="vo">
	                    <div class="order-history-form" >
	                        <div class="order-no">
	                            <span class="order-history">${vo.ordered_date} (${vo.ordered_no})</span>
	                            <span class="fp"><a href="orderhistorydetail.do?ordered_no=${vo.ordered_no}">상세보기</a></span>
	                        </div>
	                        <div class="order-product">
	                            <div style="display: flex;">
	                                <img src="<%=request.getContextPath()%>/upload/${vo.attachment_detail_new_name}">
	                                <div>
	                                    <p>[${vo.category_name}] ${vo.product_name}</p>
	                                    <p>${vo.product_author} 저 · ${vo.product_publisher}</p>
	                                    <p style="margin-bottom: 15px;">${vo.ordered_detail_unit_price}원</p>
	                                    <p>[${vo.ordered_detail_quantity}개]</p>
	                                </div>
	                            </div>
	                            <span class="lp">
	                            	<c:if test="${vo.ordered_status eq 'CW' && vo.payment_type eq 'RW'}">취소 처리중</c:if>
	                            	<c:if test="${vo.ordered_status eq 'CC' && vo.payment_type eq 'RC'}">취소 완료</c:if>
								</span>
	                        </div>
	                    </div>
                    </c:forEach>
                    </sec:authorize>
					<!-- 비회원 -->
					<sec:authorize access="isAnonymous()">
					<c:forEach items="${cancellistguest}" var="vo">
	                    <div class="order-history-form" >
	                        <div class="order-no">
	                            <span class="order-history">${vo.ordered_date} (${vo.ordered_no})</span>
	                            <span class="fp"><a href="orderhistorydetail.do?ordered_no=${vo.ordered_no}">상세보기</a></span>
	                        </div>
	                        <div class="order-product">
	                            <div style="display: flex;">
	                                <img src="<%=request.getContextPath()%>/upload/${vo.attachment_detail_new_name}">
	                                <div>
	                                    <p>[${vo.category_name}] ${vo.product_name}</p>
	                                    <p>${vo.product_author} 저 · ${vo.product_publisher}</p>
	                                    <p style="margin-bottom: 15px;">${vo.ordered_detail_unit_price}원</p>
	                                    <p>[${vo.ordered_detail_quantity}개]</p>
	                                </div>
	                            </div>
	                            <span class="lp">
	                            	<c:if test="${vo.ordered_status eq 'CW' && vo.payment_type eq 'RW'}">취소 처리중</c:if>
	                            	<c:if test="${vo.ordered_status eq 'CC' && vo.payment_type eq 'RC'}">취소 완료</c:if>
								</span>
	                        </div>
	                    </div>
                    </c:forEach>
                    </sec:authorize>
	                <div class="pagination">
						〈〈&nbsp;&nbsp;&nbsp;〈&nbsp;&nbsp;&nbsp;1&nbsp;&nbsp;&nbsp;〉&nbsp;&nbsp;&nbsp;〉〉
	                </div>
                </div>

            </div>
        </section>
    </main>

    <script>
        window.onload = function() {

/*             // 로컬 스토리지에서 저장된 활성화된 버튼을 불러와서 해당 버튼 활성화
            var activeButtonId = localStorage.getItem('activeButtonId');
            if (activeButtonId) {
                toggleActiveButton(activeButtonId);
            } else {
                toggleActiveButton('order-list');  // 기본 값으로 '주문 목록' 버튼 활성화
            } */
            
            setDates('3months');
            
            // 필터링 실행 (페이지 로드 시에만 실행)
            var startDate = document.querySelectorAll('input[type="date"]')[0].value;
            var endDate = document.querySelectorAll('input[type="date"]')[1].value;
            var startDate = document.querySelectorAll('input[type="date"]')[2].value;
            var endDate = document.querySelectorAll('input[type="date"]')[3].value;
            filterTable(startDate, endDate); // 날짜 범위에 맞게 필터링

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
            document.querySelectorAll('input[type="date"]')[2].value = threeMonthsAgoString; // 첫 번째 date input
            document.querySelectorAll('input[type="date"]')[3].value = todayString; // 두 번째 date input
        };

        function toggleActiveButton(buttonId) {

/*             // 로컬 스토리지에 클릭된 버튼 ID 저장
            localStorage.setItem('activeButtonId', buttonId); */

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
                
                // 필터링을 바로 실행하도록 수정
                var startDate = document.querySelectorAll('input[type="date"]')[2].value;
                var endDate = document.querySelectorAll('input[type="date"]')[3].value;
                filterTable(startDate, endDate);  // 날짜 범위에 맞게 필터링
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
        // 첫 번째 date input에 시작 날짜 설정
        document.querySelectorAll('input[type="date"]')[2].value = startDate;
        // 두 번째 date input에 종료 날짜 설정
        document.querySelectorAll('input[type="date"]')[3].value = endDate;
        
        // 필터링 실행
        filterTable(startDate, endDate);
    }

   	function filterTable(startDate, endDate) {
   		
   	    // 현재 활성화된 폼에 해당하는 테이블을 선택
   	    var activeForm = document.querySelector(".form-container.active");
   	    var rows = activeForm.getElementsByClassName("order-history-form");

   	    // 날짜 필터를 적용하여 표시할 항목을 결정합니다.
   	    for (let i = 0; i < rows.length; i++) {
   	        const row = rows[i];
   	        const orderDateText = row.querySelector(".order-history").textContent;
   	        const orderDate = orderDateText.split(' ')[0]; // 날짜만 추출

   	        if (orderDate >= startDate && orderDate <= endDate) {
   	            row.style.display = ""; // 날짜가 범위 내에 있으면 표시
   	        } else {
   	            row.style.display = "none"; // 범위 외의 항목은 숨김
   	        }
   	    }
   	}
    </script>

    <script>
    function openWindow(orderedNo) {
        // 전달된 orderedNo 값 출력
        console.log(orderedNo); 

        // 새 창 URL 설정
        const url = `addrmodify_modal.do?ordered_no=`+orderedNo;
        const windowOptions = "width=500,height=600,scrollbars=yes";
        
        // 새 창 열기
        window.open(url, "_blank", windowOptions);
    }

    </script>
    
    <script>
	function orderhistorycancel(orderedNo, paymentNo){			
	    $.ajax({
	        url: 'ajax/orderhistorycancel.do',  // 실제 취소 요청을 보낼 URL
	        method: 'POST',
	        data: { ordered_no: orderedNo,
	        		payment_no: paymentNo },  // 취소할 주문의 ID를 보냄
	        success: function(data) {
				if (data == "success") {
		            alert("주문이 성공적으로 취소되었습니다.");
				}else {
		            alert("주문 취소에 실패했습니다.");
				}
	        },
	        error: function(error) {
	            alert("주문 취소에 실패했습니다.");
	        }
	    });
	}
    </script>

<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>	
