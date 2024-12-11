<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mypage.css">

    <main>
        <section>
            <div class="memberinfoform-container">
                <h2>회원정보</h2>
                <form action="memberinfoOk.do" method="post">
                    <!-- 기본 정보 -->
                    <div>
                        <p>*필수입력사항</p>
                    </div>

                    <div class="memberinfoform-group">
                        <input type="text" id="user_id" name="user_id" value="${vo.user_id}">
                    </div>
                    <div class="memberinfoform-group">
                        <input type="password" id="user_password" name="user_password" placeholder="비밀번호* (영문 대소문자/숫자/특수문자 조합, 8~16자)">
                    </div>
                    <div class="memberinfoform-group">
                        <input type="password" id="password_Confirm" name="password_Confirm" placeholder="비밀번호 확인*">
                    </div>
                    <div class="memberinfoform-group">
                        <input type="text" id="name" name="${vo.user_name}" value="${vo.user_name}">
                    </div>

<%--                      <div class="memberinfoform-group">
                        <div style="display: flex; justify-content: space-between; margin-bottom: 15px;">
                            <input type="text" id="userPostCode" name="address_book_postcode" value="${vo.address_book_postcode}" placeholder="주소" style="width: 50%;">
                            <button type="button" onclick="searchAddress();" class="addr_btn">우편번호</button>
                            <button type="button" onclick="cancelAddress();" class="addr_btn">취소</button>
                        </div>
                        <input type="text" id="userAddress" name="address_book_address" value="${vo.address_book_address}" placeholder="기본주소" style="margin-bottom: 15px;">
                        <input type="text" id="userDtlAddress" name="address_book_detailaddress" value="${vo.address_book_detailaddress}" placeholder="나머지주소(선택입력가능)">
                    </div> --%>

                    <div class="addrform-group">
                        <div style="display: flex; justify-content: space-between;">
                            <select id="phonePrefix" name="user_phone" style="width: 30%;">
                                <option value="010" <c:if test="${vo.user_phone == '010'}">selected</c:if>>010</option>
                                <option value="011" <c:if test="${vo.user_phone == '011'}">selected</c:if>>011</option>
                                <option value="016" <c:if test="${vo.user_phone == '016'}">selected</c:if>>016</option>
                                <option value="017" <c:if test="${vo.user_phone == '017'}">selected</c:if>>017</option>
                                <option value="018" <c:if test="${vo.user_phone == '018'}">selected</c:if>>018</option>
                                <option value="019" <c:if test="${vo.user_phone == '019'}">selected</c:if>>019</option>
                            </select>&nbsp;_&nbsp;
                            <input type="text" id="phoneMiddle" name="user_phone" style="width: 35%;" placeholder="휴대전화" value="${vo.user_phone}">&nbsp;_&nbsp;
                            <input type="text" id="phoneLast" name="user_phone" style="width: 35%;" value="${vo.user_phone}">
                        </div>
                    </div>

                    <div class="memberinfoform-group">
                        <input type="email" id="email" name="email" value="hong@naver.com">
                    </div>
        
                    <!-- 버튼 -->
                    <div class="memberinfoform-footer">
                        <button type="submit">회원정보수정</button>
                        <button>취소</button>
                        <button>회원탈퇴</button>
                    </div>
                </form>
            </div>
        </section>
    </main>
    
<!-- 	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function searchAddress() {
			new daum.Postcode({
				oncomplete: function(data) { // 선택시 입력값 세팅
				document.getElementById("userAddress").value = data.address; // 주소 넣기
				document.getElementById("userPostCode").value = data.zonecode; // 우편번호 넣기
				var inputDtlAddr = document.getElementById("userDtlAddress"); // 주소란 읽기전용 설정
				inputDtlAddr.readOnly = false;
				}
			}).open();
		}
		
		function cancelAddress() {
			var inputPostCode = document.getElementById("userPostCode");
			inputPostCode.value = "" // 우편번호 초기화
			var inputAddr = document.getElementById("userAddress");
			inputAddr.value = "" // 주소란 초기화
			var inputDtlAddr = document.getElementById("userDtlAddress");
			inputDtlAddr.value = "" // 상세주소란 초기화
			inputDtlAddr.readOnly = true; // 상세주소란 읽기전용 해제
		}
	</script> -->

<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>	
