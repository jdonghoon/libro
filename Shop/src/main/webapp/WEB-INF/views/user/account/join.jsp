<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mypage.css">

    <main>
        <section>
            <div class="joinform-container">
                <h2>회원가입</h2>
                <form action="joinOk.do" method="post" onsubmit="return DojoinUp();">
                    <!-- 기본 정보 -->
                    <div>
                        <p>*필수입력사항</p>
                    </div>

                    <div class="joinform-group">
                        <input type="text" id="user_id" name="user_id" placeholder="아이디* (영문 소문자/숫자, 4~16자)" onkeyup="checkID()">
                        <div id="validationId"></div>
                    </div>
                    <div class="joinform-group">
                        <input type="password" id="user_password" name="user_password" placeholder="비밀번호* (영문 대소문자/숫자/특수문자 조합, 8~16자)">
                    </div>
                    <div class="joinform-group">
                        <input type="password" id="password_Confirm" name="password_Confirm" placeholder="비밀번호 확인*">
                        <div id="validationPw"></div>
                    </div>
                    <div class="joinform-group">
                        <input type="text" id="name" name="user_name" placeholder="이름*">
                        <div id="validationName"></div>
                    </div>
                    <div class="joinform-group">
                        <div style="display: flex; gap: 10px;">
                            <select id="phonePrefix" name="user_phone" style="width: 30%;">
                                <option value="010">010</option>
                                <option value="011">011</option>
                                <option value="016">016</option>
                                <option value="016">017</option>
                                <option value="016">018</option>
                                <option value="016">019</option>
                            </select>
                            <input type="text" id="phoneMiddle" name="user_phone" placeholder="휴대전화*" style="width: 35%;">
                            <input type="text" id="phoneLast" name="user_phone" style="width: 35%;">
                        </div>
                        <div id="validationPhone"></div>
                    </div>
                    <div class="joinform-group">
                        <input type="email" id="email" name="user_email" placeholder="이메일*">
                        <div id="validationEmail"></div>
                    </div>
        
                    <!-- 약관 동의 -->
                    <div class="joinform-group">
                        <div class="checkbox-group checkbox" style="border-bottom: none;">
                            <label class="checkboxAll">
                                <input type="checkbox" id="checkAll" />
                                <span class="checkmark"></span>
                                이용약관 및 개인정보 수집 이용, 쇼핑정보 수신(선택)에 모두 동의합니다.
                            </label>
                        </div>
                    
                        <div class="checkbox">
                            <div class="checkbox-group">
                                <label class="checkboxAll">
                                    <input type="checkbox" class="check-item" />
                                    <span class="checkmark"></span>
                                    [필수] 이용약관 동의
                                </label>
                            </div>
                            <div class="checkbox-group">
                                <label class="checkboxAll">
                                    <input type="checkbox" class="check-item" />
                                    <span class="checkmark"></span>
                                    [필수] 개인정보 수집 및 이용 동의
                                </label>
                            </div>
                            <div class="checkbox-group">
                                <label class="checkboxAll">
                                    <input type="checkbox" class="check-item" />
                                    <span class="checkmark"></span>
                                    [선택] 마케팅 및 광고 활용 동의
                                </label>
                            </div>
                            <div class="checkbox-group">
                                <label class="checkboxAll">
                                    <input type="checkbox" class="check-item" />
                                    <span class="checkmark"></span>
                                    [선택] SMS 수신 동의
                                </label>
                            </div>
                            <div class="checkbox-group">
                                <label class="checkboxAll">
                                    <input type="checkbox" class="check-item" />
                                    <span class="checkmark"></span>
                                    [선택] 이메일 수신 동의
                                </label>
                            </div>
                        </div>
                    </div>
                    
        
                    <!-- 버튼 -->
                    <div class="joinform-footer">
                        <button style="width: 100%;">회원가입</button>
                    </div>
                </form>
            </div>
        </section>
    </main>

    <script>
		 
    function DojoinUp() {
        const id = document.querySelector("#user_id").value.trim();
        const password = document.querySelector("#user_password").value.trim();
        const passwordConfirm = document.querySelector("#password_Confirm").value.trim();
        const name = document.querySelector("#name").value.trim();
        const phoneMiddle = document.querySelector("#phoneMiddle").value.trim();
        const phoneLast = document.querySelector("#phoneLast").value.trim();
        const email = document.querySelector("#email").value.trim();
        
        const requiredCheckboxes = document.querySelectorAll('.check-item');
        const isFirstChecked = requiredCheckboxes[0].checked; // 첫 번째 [필수]
        const isSecondChecked = requiredCheckboxes[1].checked; // 두 번째 [필수]

        const idPattern = /^[a-z0-9]{4,16}$/;
        if (!id) {
            showError("#validationId", "아이디를 입력해 주세요.");
            return false;
        }
        if (!idPattern.test(id)) {
            showError("#validationId", "아이디는 영문 소문자/숫자 4~16자로 입력해 주세요.");
            return false;
        }

        const passwordPattern = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()])[a-zA-Z\d!@#$%^&*()]{4,8}$/;
        if (!password) {
            showError("#validationPw", "비밀번호를 입력해 주세요.");
            return false;
        }
        if (!passwordPattern.test(password)) {
            showError("#validationPw", "4~8자 영문 대소문자/숫자/특수문자를 조합하여 입력해 주세요.");
            return false;
        }
        if (!passwordConfirm) {
            showError("#validationPw", "비밀번호 확인을 입력해 주세요.");
            return false;
        }
        if (password !== passwordConfirm) {
            showError("#validationPw", "비밀번호가 일치하지 않습니다.");
            return false;
        }
        if (!name) {
            showError("#validationName", "이름을 입력해 주세요.");
            return false;
        }
        if (!phoneMiddle || !phoneLast) {
            showError("#validationPhone", "휴대전화 번호를 입력해 주세요.");
            return false;
        }
        if (!email) {
            showError("#validationEmail", "이메일을 입력해 주세요.");
            return false;
        }
        
        if (!isFirstChecked || !isSecondChecked) {
            alert("필수 약관 동의 항목에 모두 동의하셔야 회원가입이 가능합니다.");
            return false;
        }

        return true; 
    }

    function showError(selector, message) {
        const element = document.querySelector(selector);
        element.textContent = message;
        element.style.color = "red";
    }

    function addKeyupValidation() {
        document.querySelector("#user_id").addEventListener("keyup", function () {
            const id = this.value.trim();
            const idPattern = /^[a-z0-9]{4,16}$/;

            if (!idPattern.test(id)) {
                showError("#validationId", "아이디는 영문 소문자/숫자 4~16자로 입력해 주세요.");
            } else {
                showError("#validationId", "");
            }
        });

        document.querySelector("#user_password").addEventListener("keyup", function () {
            const password = this.value.trim();
            const passwordPattern = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()])[a-zA-Z\d!@#$%^&*()]{4,8}$/;

            if (!passwordPattern.test(password)) {
                showError("#validationPw", "4~8자 영문 대소문자/숫자/특수문자를 조합하여 입력해 주세요.");
            } else {
                showError("#validationPw", "");
            }
        });

        document.querySelector("#password_Confirm").addEventListener("keyup", function () {
            const password = document.querySelector("#user_password").value.trim();
            const passwordConfirm = this.value.trim();

            if (password !== passwordConfirm) {
                showError("#validationPw", "비밀번호가 일치하지 않습니다.");
            } else {
                showError("#validationPw", "");
            }
        });
    }

    // DOMContentLoaded 이벤트로 keyup 이벤트 리스너 등록
    document.addEventListener("DOMContentLoaded", addKeyupValidation);
	
/* 	    function showError(selector, message) {
	        const element = document.querySelector(selector);
	        element.textContent = message;
	        element.style.color = "red";
	        element.focus();
	    } */

		function checkID(){			
			let id = $("#user_id").val();
			
			$.ajax({
				url : "ajax/checkID.do",
				type : "get",
				data : { user_id : id },
				success : function(data) {
					if (data == "fail") {
						$("#validationId").text(id + "는 이미 사용중인 아이디입니다.");
						$("#validationId").css("color", "red");
					} else {
						$("#validationId").text(id + "는 사용 가능한 아이디입니다.");
						$("#validationId").css("color", "#999999");
					}
				},
				error : function(xhr){
					console.log(xhr);
				}	
			});
		}
		
		// 체크박스 모두선택
		document.getElementById('checkAll').addEventListener('change', function () {
			const checkItems = document.querySelectorAll('.check-item');
			checkItems.forEach(item => item.checked = this.checked);
		});
		
		document.querySelectorAll('.check-item').forEach(item => {
			item.addEventListener('change', function () {
				const allChecked = document.querySelectorAll('.check-item:checked').length === document.querySelectorAll('.check-item').length;
				document.getElementById('checkAll').checked = allChecked;
			});
		});
    </script>

<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>	
