<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
    <head>
		<meta charset="UTF-8">
        <title>Libro</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/styles.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/mypage.css">
    </head>
    <body style="padding-top: 0;">

    <main>
        <section>
            <div class="addr_form-container">
                <h2>배송지 변경</h2>
                <form action="addrmodify_modalOk.do" method="post">
                	<input type="hidden" name="ordered_no" value="${vo.ordered_no}">
                    <!-- 기본 정보 -->
                    <div class="addr_form-group">
                        <input type="text" name="ordered_name" placeholder="성명" value="${vo.ordered_name}">
                    </div>
                    <div class="addr_form-group">
                        <div style="display: flex; justify-content: space-between; margin-bottom: 15px;">
                            <input type="text" id="userPostCode" name="ordered_address_postcode" value="${vo.ordered_address_postcode}" style="width: 70%;">
                            <button type="button" class="addr_btn" onclick="searchAddress();" >우편번호</button>
                        </div>
                        <input type="text" id="userAddress" name="ordered_address_address" style="margin-bottom: 15px;" value="${vo.ordered_address_address}">
                        <input type="text" id="userDtlAddress" name="ordered_address_detailaddress" value="${vo.ordered_address_detailaddress}">
                    </div>
                    <div class="addr_form-group">
                        <div style="display: flex; justify-content: space-between;">
                            <select id="phonePrefix" name="ordered_phone" style="width: 30%;">
                                <option value="010" <c:if test="${vo.ordered_phone == '010'}">selected</c:if>>010</option>
                                <option value="011" <c:if test="${vo.ordered_phone == '011'}">selected</c:if>>011</option>
                                <option value="016" <c:if test="${vo.ordered_phone == '016'}">selected</c:if>>016</option>
                                <option value="017" <c:if test="${vo.ordered_phone == '017'}">selected</c:if>>017</option>
                                <option value="018" <c:if test="${vo.ordered_phone == '018'}">selected</c:if>>018</option>
                                <option value="019" <c:if test="${vo.ordered_phone == '019'}">selected</c:if>>019</option>
                            </select>&nbsp;_&nbsp;
                            <input type="text" id="phoneMiddle" name="ordered_phone" style="width: 35%;" value="${vo.ordered_phone}">&nbsp;_&nbsp;
                            <input type="text" id="phoneLast" name="ordered_phone" style="width: 35%;" value="${vo.ordered_phone}">
                        </div>
                    </div>
                    <div class="addr_form-group">
                        <textarea placeholder="배송메세지를 입력해 주세요." rows="10" cols="58" name="ordered_note">${vo.ordered_note}</textarea>
                    </div>

                    <!-- 버튼 -->
                    <div class="addr_form-footer">
                        <button type="button" onclick="location.href='orderhistory.do'">취소</button>
                        <button type="submit">변경하기</button>
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
		const userPhone = "${vo.ordered_phone}"; // 예: "010,1234,5678"
		
		if (userPhone) {
	        // 전화번호가 "-"로 구분된 경우
	        const phonePartsDash = userPhone.split("-");
	        
	        // 전화번호가 ","로 구분된 경우
	        const phonePartsComma = userPhone.split(",");
	        
	        let phoneParts = [];
	        
	        // "-" 형식일 경우 처리
	        if (phonePartsDash.length === 3) {
	            phoneParts = phonePartsDash;
	        }
	        // "," 형식일 경우 처리
	        else if (phonePartsComma.length === 3) {
	            phoneParts = phonePartsComma;
	        }
			if (phoneParts.length === 3) {
				// 각 필드에 값 설정
				document.getElementById("phonePrefix").value = phoneParts[0];
				document.getElementById("phoneMiddle").value = phoneParts[1];
				document.getElementById("phoneLast").value = phoneParts[2];
			}
		}
	</script>

    </body>
</html>





