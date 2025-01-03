<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mypage.css">

    <main>
        <section>
            <div class="memberinfoform-container">
                <h2>회원정보</h2>
                <div id="passwordForm" method="post">
                    <div>
                        <p>고객님의 소중한 회원정보를 확인/변경 하기 위해 비밀번호 재확인이 필요합니다.</p>
                    </div>
                    
                    <div class="memberinfoform-group">
                        <input type="text" value="${vo.user_name}" readonly>
                    </div>
                    <div class="memberinfoform-group">
                        <input type="text" value="${vo.user_id}" readonly>
                    </div>
                    <div class="memberinfoform-group">
                        <input type="password" id="first_user_password" name="user_password" placeholder="비밀번호  입력">
                    </div>
                    <div class="memberinfoform-footer">
                        <button style="width:500px;" onclick="checkPassword()">확인</button>
                    </div>
                </div>
                
                <form id="memberInfoForm" action="memberinfoOk.do" method="post" style="display:none;">

                    <div>
                        <p>*필수입력사항</p>
                    </div>

                    <div class="memberinfoform-group">
                        <input type="text" id="user_id" name="user_id" value="${vo.user_id}" readonly>
                    </div>
                    <div class="memberinfoform-group">
                        <input type="password" id="user_password" name="user_password" placeholder="현재비밀번호* (영문 대소문자/숫자/특수문자 조합, 4~8자)">
                    </div>
                    <div class="memberinfoform-group">
                        <input type="password" id="new_password" name="new_password" placeholder="새비밀번호 (영문 대소문자/숫자/특수문자 조합, 4~8자)">
                    </div>
                    <div class="memberinfoform-group">
                        <input type="password" id="password_Confirm" name="password_Confirm" placeholder="새비밀번호 확인">
                    </div>
                    <div class="memberinfoform-group">
                        <input type="text" id="name" name="user_name" value="${vo.user_name}">
                    </div>

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
		// 비밀번호 확인을 체크하는 함수
		function checkPassword() {
			const password = document.getElementById("first_user_password").value;
	
			$.ajax({
				url : "ajax/checkPassword.do",
				type : "POST",
				data : { password : encodeURIComponent(password) },
				success : function(data) {
					if (data == "isMatch") {
						document.getElementById("passwordForm").style.display = "none";  // 비밀번호 폼 숨기기
						document.getElementById("memberInfoForm").style.display = "block";  // 회원정보 수정 폼 보이기
					} else {
						alert("비밀번호가 일치하지 않습니다.");
					}
				},
				error : function(xhr){
					console.log(xhr);
				}	
			});
		}
	</script>
	
	<script>
		document.getElementById("memberInfoForm").addEventListener("submit", function (event) {
		    // 첫 번째, 두 번째, 세 번째 입력 값을 가져오기
		    const userPasswordField = document.getElementById("user_password");
		    const newPasswordField = document.getElementById("new_password");
		    const passwordConfirmField = document.getElementById("password_Confirm");
		
		    const userPassword = userPasswordField.value.trim();
		    const newPassword = newPasswordField.value.trim();
		    const passwordConfirm = passwordConfirmField.value.trim();
		
		    // 1. 현재 비밀번호가 비어있는지 확인
		    if (!userPassword) {
		        event.preventDefault();  // 폼 제출을 막음
		        alert("현재 비밀번호를 입력해주세요.");
		        return;  // 현재 비밀번호가 비어있으면 중단
		    }
		    
		    // 2. 기존 비밀번호와 새 비밀번호가 동일한지 확인
		    if (userPassword === newPassword) {
		        event.preventDefault();  // 폼 제출을 막음
		        alert("기존 비밀번호와 새 비밀번호는 동일할 수 없습니다.");
		        return;  // 기존 비밀번호와 새 비밀번호가 같으면 중단
		    }
		
		    // 3. 새 비밀번호와 비밀번호 확인이 일치하는지 확인
		    if (newPassword && passwordConfirm) {
		        if (newPassword !== passwordConfirm) {
		            event.preventDefault();  // 폼 제출을 막음
		            alert("새 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		            return;  // 일치하지 않으면 추가 작업을 중단
		        }
		        userPasswordField.value = newPassword;  // 새 비밀번호를 user_password로 설정
		    } else if (newPassword || passwordConfirm) {
		        // 두 번째와 세 번째 비밀번호가 일부만 입력된 경우
		        event.preventDefault();  // 폼 제출을 막음
		        alert("새 비밀번호와 새 비밀번호 확인을 모두 입력해주세요.");
		        return;  // 양쪽 모두 입력되었는지 체크
		    }
		
		    // 각 입력 필드의 입력을 감지하는 함수
		    function updateFieldNames() {
		        // 두 번째와 세 번째 값이 비어있지 않으면 첫 번째 필드의 name을 무효화하고 두 번째 필드의 name을 활성화
		        if (newPassword && passwordConfirm) {
		            userPasswordField.name = "";  // 첫 번째 필드의 name 속성 비우기
		            newPasswordField.name = "user_password";  // 두 번째 필드의 name을 user_password로 설정
		        } else {
		            // 두 번째나 세 번째 값이 비어 있으면 두 번째 필드의 name을 비워주고 첫 번째 필드의 name을 활성화
		            userPasswordField.name = "user_password";
		            newPasswordField.name = "new_password";
		        }
		    }
		
		    // 이벤트 리스너 추가하여 각 필드의 값이 변경될 때마다 updateFieldNames 호출
		    newPasswordField.addEventListener("input", updateFieldNames);
		    passwordConfirmField.addEventListener("input", updateFieldNames);
		});
	</script>


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
