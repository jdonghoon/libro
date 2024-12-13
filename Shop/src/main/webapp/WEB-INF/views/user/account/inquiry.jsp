<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mypage.css">

    <main>
        <section>
            <div class="inquiryform-container">
                <h2>문의하기</h2>
                
                <span>문의하신 내용에 대한 답변은 이메일 혹은 ACCOUNT 페이지의 내 게시물에서 확인해주세요.<br>
쇼핑가이드를 확인하시면 좀 더 빠른 답변을 얻으실 수 있습니다.</span>
                
                <form action="inquiryOk.do" method="post" enctype ="multipart/form-data">
                    <div class="inquiryform-group">
						<select name="contact_type">
							<option value="주문문의">주문문의</option>
							<option value="기타문의">기타문의</option>
						</select>
                    </div>

                    <div class="inquiryform-group">
                        <textarea name="contact_content">▶ 비회원으로 문의주시는 경우 주문번호를 남겨주셔야 처리가능하며
이메일 주소로 답변이 안내되오니 수신 가능한 이메일 주소를 꼭 남겨주시기 바랍니다.

--------------------------------------------------------------------------------------<br><br></textarea>
                    </div>

                    <div class="inquiryform-group">
                        <input type="password" name="contact_password" placeholder="비밀번호">
                    </div>

                    <div class="inquiryform-group">
                        <input type="file" id="file-upload" class="custom-file-input" name="multiFile" multiple>
                        <input type="text" id="file-name" value="파일선택" readonly>
                    	<label for="file-upload" class="custom-file-label">+</label>
					</div>
					
                    <div class="inquiryform-footer">
                        <button>등록</button>
                    </div>
                </form>
            </div>
        </section>
    </main>
    
    <script>
	    // 파일 선택 시 텍스트 필드에 파일명 표시
	    document.getElementById('file-upload').addEventListener('change', function(event) {
	        var fileName = event.target.files[0] ? event.target.files[0].name : '파일선택';
	        document.getElementById('file-name').value = fileName;
	    });
	    
	    function updateContactTitle() {
	        // 문의 유형 select 요소와 hidden input 요소를 가져오기
	        const contactType = document.getElementById('contactType');
	        const contactTitle = document.getElementById('contactTitle');

	        // contact_type의 선택된 값을 contact_title에 동적으로 설정
	        contactTitle.value = contactType.value;
	    }
	</script>

<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>	
