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
--------------------------------------------------------------------------------------
</textarea>
                    </div>

					<sec:authorize access="isAnonymous()">
	                    <div class="inquiryform-group">
	                        <input type="password" name="contact_password" placeholder="주문번호">
	                    </div>
	
	                    <div class="inquiryform-group">
	                        <input type="password" name="contact_password" placeholder="비밀번호">
	                    </div>
					</sec:authorize>
					 
<!--                     <div class="inquiryform-group">
                        <input type="file" id="file-upload" class="custom-file-input" name="multiFile" multiple>
                        <input type="text" id="file-name" value="파일선택" readonly>
                    	<label for="file-upload" class="custom-file-label">+</label>
					</div> -->

					<div id="file-upload-container">
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
	    document.getElementById('file-upload').addEventListener('change', function(event) {
	        var container = document.getElementById('file-upload-container');
	        var files = event.target.files;
	        
	        // 기존의 항목들 삭제
	        container.innerHTML = "";
	
	        // 파일 개수만큼 새로운 inquiryform-group 생성
	        for (var i = 0; i < files.length; i++) {
	            var div = document.createElement('div');
	            div.classList.add('inquiryform-group');
	            
	            // 파일 이름 표시
	            var fileName = document.createElement('input');
	            fileName.type = 'text';
	            fileName.value = files[i].name;
	            fileName.readOnly = true;
	            div.appendChild(fileName);
	
	            // 파일 삭제 버튼 추가 (옵션)
	            var deleteButton = document.createElement('button');
	            deleteButton.textContent = '-';
	            deleteButton.addEventListener('click', function() {
	                this.parentElement.remove();
	            });
	            
	            // 삭제 버튼에 클래스 추가
	            deleteButton.classList.add('delete-button');
	            
	            div.appendChild(deleteButton);
	            container.appendChild(div);
	        }
	        // 선택한 파일들의 이름을 쉼표로 구분하여 'file-name' 텍스트 필드에 표시
	        updateFileNames();
	    });
	 // 파일들이 선택될 때마다 'file-name'에 파일 이름들을 표시
	    function updateFileNames() {
	        var files = document.getElementById('file-upload').files;
	        var fileNames = [];

	        for (var i = 0; i < files.length; i++) {
	            fileNames.push(files[i].name);
	        }

	        // 쉼표로 구분하여 표시
	        document.getElementById('file-name').value = fileNames.join(', ');
	    }
	</script>

<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>	
