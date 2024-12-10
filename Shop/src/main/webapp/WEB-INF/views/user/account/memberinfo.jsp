<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mypage.css">

    <main>
        <section>
            <div class="memberinfoform-container">
                <h2>회원정보</h2>
                <form>
                    <!-- 기본 정보 -->
                    <div>
                        <p>*필수입력사항</p>
                    </div>

                    <div class="memberinfoform-group">
                        <input type="text" id="userId" name="userId" value="hong">
                    </div>
                    <div class="memberinfoform-group">
                        <input type="password" id="password" name="password" placeholder="비밀번호* (영문 대소문자/숫자/특수문자 조합, 8~16자)">
                    </div>
                    <div class="memberinfoform-group">
                        <input type="password" id="passwordConfirm" name="passwordConfirm" placeholder="비밀번호 확인*">
                    </div>
                    <div class="memberinfoform-group">
                        <input type="text" id="name" name="name" value="홍길동">
                    </div>

                     <div class="memberinfoform-group">
                        <div style="display: flex; justify-content: space-between; margin-bottom: 15px;">
                            <input type="text" id="userPostCode" name="addr" placeholder="주소" style="width: 50%;">
                            <button type="button" onclick="searchAddress();" class="addr_btn">우편번호</button>
                            <button type="button" onclick="cancelAddress();" class="addr_btn">취소</button>
                        </div>
                        <input type="text" id="userAddress" name="addr" placeholder="기본주소" style="margin-bottom: 15px;">
                        <input type="text" id="userDtlAddress" name="addr" placeholder="나머지주소(선택입력가능)">
                    </div>
						
                    <div class="memberinfoform-group">
                        <div style="display: flex; justify-content: space-between;">
                            <select id="phonePrefix" name="phonePrefix" style="width: 30%;">
                                <option value="010">010</option>
                                <option value="011">011</option>
                                <option value="016">016</option>
                                <option value="016">017</option>
                                <option value="016">018</option>
                                <option value="016">019</option>
                            </select>&nbsp;_&nbsp;
                            <input type="text" id="phoneMiddle" name="phoneMiddle" style="width: 35%;" value="1234">&nbsp;_&nbsp;
                            <input type="text" id="phoneLast" name="phoneLast" style="width: 35%;" value="5678">
                        </div>
                    </div>
                    <div class="memberinfoform-group">
                        <input type="email" id="email" name="email" value="hong@naver.com">
                    </div>
        
                    <!-- 버튼 -->
                    <div class="memberinfoform-footer">
                        <button type="submit">회원정보수정</button>
                        <button type="">취소</button>
                        <button type="">회원탈퇴</button>
                    </div>
                </form>
            </div>
        </section>
    </main>
    
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
	</script>

<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>	
