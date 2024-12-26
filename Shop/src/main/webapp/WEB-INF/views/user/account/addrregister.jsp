<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mypage.css">

    <main>
        <section>
            <div class="addrform-container">
                <h2>주소록 등록</h2>
                <form action="addrregisterOk.do" method="post">
                    <!-- 기본 정보 -->
                    <div class="addrform-group">
                        <input type="text" name="address_book_addressname" placeholder="배송지명">
                    </div>
                    <div class="addrform-group">
                        <input type="text" name="address_book_name" placeholder="성명">
                    </div>
                    <div class="addrform-group">
                        <div style="display: flex; justify-content: space-between; margin-bottom: 15px;">
                            <input type="text" id="userPostCode" name="address_book_postcode" placeholder="주소" style="width: 50%;">
                            <button type="button" onclick="searchAddress();" class="addr_btn">우편번호</button>
                            <button type="button" onclick="cancelAddress();" class="addr_btn">취소</button>
                        </div>
                        <input type="text" id="userAddress" name="address_book_address" placeholder="기본주소" style="margin-bottom: 15px;">
                        <input type="text" id="userDtlAddress" name="address_book_detailaddress" placeholder="나머지주소(선택입력가능)">
                    </div>
                    <div class="addrform-group">
                        <div style="display: flex; justify-content: space-between;">
                            <select id="phonePrefix" name="address_book_phone" style="width: 30%;">
                                <option value="010">010</option>
                                <option value="011">011</option>
                                <option value="016">016</option>
                                <option value="017">017</option>
                                <option value="018">018</option>
                                <option value="019">019</option>
                            </select>&nbsp;_&nbsp;
                            <input type="text" id="phoneMiddle" name="address_book_phone" style="width: 35%;" placeholder="휴대전화">&nbsp;_&nbsp;
                            <input type="text" id="phoneLast" name="address_book_phone" style="width: 35%;">
                        </div>
                    </div>
					<div class="addr-save">
						<input type="hidden" id="hidden_addr_save" name="address_book_top" value="N">
						<input type="checkbox" id="addr_save" name="address_book_top_checkbox" value="Y">
						<label for="addr_save">기본 배송지로 설정</label>
					</div>
                    <!-- 버튼 -->
                    <div class="addrform-footer">
                        <button onclick="location.href='addr.do'">취소</button>
                        <button>등록</button>
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
		// 체크박스 상태에 따라 hidden 필드 값 업데이트
		document.getElementById('addr_save').addEventListener('change', function () {
			const hiddenInput = document.getElementById('hidden_addr_save');
			hiddenInput.value = this.checked ? 'Y' : 'N';
		});
	</script>

<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>	