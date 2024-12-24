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
                        <input type="text" id="name" name="user_name" value="${vo.user_name}">
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
                        <input type="email" id="email" name="user_email" value="${vo.user_email}">
                    </div>
        
                    <!-- 버튼 -->
                    <div class="memberinfoform-footer">
                        <button type="submit">회원정보수정</button>
                        <button type="reset">취소</button>
                        <button type="button" onclick="confirmWithdrawal()">회원탈퇴</button>
                    </div>
                </form>
            </div>
        </section>
    </main>
	
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

	<script>
	    // vo.user_phone 값 (서버에서 전달되는 값)
	    const userPhone = "${vo.user_phone}";
	
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
		function confirmWithdrawal() {
			Swal.fire({
					title: '회원탈퇴를 진행하시겠습니까?',
					text: '다시 되돌릴 수 없습니다. 신중하세요.',
					icon: 'warning',

					showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
					confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
					cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
					confirmButtonText: '승인', // confirm 버튼 텍스트 지정
					cancelButtonText: '취소', // cancel 버튼 텍스트 지정

					reverseButtons: true, // 버튼 순서 거꾸로

				}).then(result => {
					// 만약 Promise리턴을 받으면,
					if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
		                Swal.fire({
		                    title: '회원탈퇴 완료',
		                    text: '화끈하시네요~!',
		                    icon: 'success',
		                    confirmButtonText: '확인'
		                }).then(() => {
		                    location.href = 'deleteAccount.do'; // 탈퇴 처리 URL로 이동
		                });
					}
				});
		}
	</script>

<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>	
