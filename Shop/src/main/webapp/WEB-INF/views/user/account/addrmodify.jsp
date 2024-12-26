<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mypage.css">

    <main>
        <section>
            <div class="addrform-container">
                <h2>주소록 수정</h2>
                <form action="addrmodifyOk.do" method="post">
                	<input type="hidden" name="address_book_no" value="${vo.address_book_no}">
                    <!-- 기본 정보 -->
                    <div class="addrform-group">
                        <input type="text" name="address_book_addressname" placeholder="배송지명" value="${vo.address_book_addressname}">
                    </div>
                    <div class="addrform-group">
                        <input type="text" name="address_book_name" placeholder="성명" value="${vo.address_book_name}">
                    </div>
                    <div class="addrform-group">
                        <div style="display: flex; justify-content: space-between; margin-bottom: 15px;">
                            <input type="text" id="userPostCode" name="address_book_postcode" placeholder="주소" value="${vo.address_book_postcode}" style="width: 50%;">
                            <button type="button" onclick="searchAddress();" class="addr_btn">우편번호</button>
                            <button type="button" onclick="cancelAddress();" class="addr_btn">취소</button>
                        </div>
                        <input type="text" id="userAddress" name="address_book_address" placeholder="기본주소" value="${vo.address_book_address}" style="margin-bottom: 15px;">
                        <input type="text" id="userDtlAddress" name="address_book_detailaddress" placeholder="나머지주소(선택입력가능)" value="${vo.address_book_detailaddress}">
                    </div>
                    <div class="addrform-group">
                        <div style="display: flex; justify-content: space-between;">
                            <select id="phonePrefix" name="address_book_phone" style="width: 30%;">
                                <option value="010" <c:if test="${vo.address_book_phone == '010'}">selected</c:if>>010</option>
                                <option value="011" <c:if test="${vo.address_book_phone == '011'}">selected</c:if>>011</option>
                                <option value="016" <c:if test="${vo.address_book_phone == '016'}">selected</c:if>>016</option>
                                <option value="017" <c:if test="${vo.address_book_phone == '017'}">selected</c:if>>017</option>
                                <option value="018" <c:if test="${vo.address_book_phone == '018'}">selected</c:if>>018</option>
                                <option value="019" <c:if test="${vo.address_book_phone == '019'}">selected</c:if>>019</option>
                            </select>&nbsp;_&nbsp;
                            <input type="text" id="phoneMiddle" name="address_book_phone" style="width: 35%;" placeholder="휴대전화" value="${vo.address_book_phone}">&nbsp;_&nbsp;
                            <input type="text" id="phoneLast" name="address_book_phone" style="width: 35%;" value="${vo.address_book_phone}">
                        </div>
                    </div>
					<c:if test="${vo.address_book_top == 'Y'}">
						<input type="hidden" id="hidden_addr_save" name="address_book_top" value="Y">
					</c:if>
                    <c:if test="${vo.address_book_top != 'Y'}">
						<div class="addr-save">
							<input type="hidden" id="hidden_addr_save" name="address_book_top" value="N">
							<input type="checkbox" id="addr_save" name="address_book_top_checkbox" value="Y">
							<label for="addr_save">기본 배송지로 설정</label>
						</div>
					</c:if>
                    <!-- 버튼 -->
                    <div class="addrform-footer">
                        <button onclick="location.href='addr.do'">취소</button>
                        <button onclick="location.href='addrmodifyOk.do'">수정</button>
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
	
	<script>
		// vo.user_phone 값 (서버에서 전달되는 값)
		const userPhone = "${vo.address_book_phone}"; // 예: "010,1234,5678"
		
		if (userPhone) {
			const phoneParts = userPhone.split(",");
			if (phoneParts.length === 3) {
				// 각 필드에 값 설정
				document.getElementById("phonePrefix").value = phoneParts[0];
				document.getElementById("phoneMiddle").value = phoneParts[1];
				document.getElementById("phoneLast").value = phoneParts[2];
			}
		}
	</script>
	
	<script>
		// 체크박스 상태에 따라 hidden 필드 값 업데이트
		document.getElementById('addr_save').addEventListener('change', function () {
			const hiddenInput = document.getElementById('hidden_addr_save');
			hiddenInput.value = this.checked ? 'Y' : 'N';
		});
	</script>

<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>	
