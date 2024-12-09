<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mypage.css">

    <main>
        <section>
            <div class="joinform-container">
                <h2>회원가입</h2>
                <form action="joinOk.do" method="post">
                    <!-- 기본 정보 -->
                    <div>
                        <p>*필수입력사항</p>
                    </div>

                    <div class="joinform-group">
                        <input type="text" id="userId" name="user_id" placeholder="아이디* (영문 소문자/숫자, 4~16자)">
                    </div>
                    <div class="joinform-group">
                        <input type="password" id="password" name="user_password" placeholder="비밀번호* (영문 대소문자/숫자/특수문자 조합, 8~16자)">
                    </div>
                    <div class="joinform-group">
                        <input type="password" id="passwordConfirm" name="user_name" placeholder="비밀번호 확인*">
                    </div>
                    <div class="joinform-group">
                        <input type="text" id="name" name="name" placeholder="이름*">
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
                    </div>
                    <div class="joinform-group">
                        <input type="email" id="email" name="user_email" placeholder="이메일*">
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
                        <button>회원가입</button>
                    </div>
                </form>
            </div>
        </section>
    </main>

    <script>
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
