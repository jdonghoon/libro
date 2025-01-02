<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <main class="app-main">
            <!--begin::App Content Header-->
            <div class="app-content-header">
                <!--begin::Container-->
                <div class="container-fluid">
                    <!--begin::Row-->
                    <div class="row">
                        <div class="col-sm-6">
                            <h3 class="mb-0">문의관리</h3>
                        </div>
                    </div>
                    <!--end::Row-->
                </div>
                <!--end::Container-->
            </div>
            <!--end::App Content Header-->
            <!--begin::App Content-->
            <div class="app-content">
                <!--begin::Container-->
                <div class="container-fluid">
                    <!--begin::Row-->
                    <div class="row g-4">
                        <!--begin::Col-->
                        <div class="col-12">
                            <!--begin::Quick Example-->
                            <div class="card card-primary card-outline mb-4">
                                <!--begin::Header-->
                                <div class="card-header">
                                    <div class="card-title">문의 목록</div>
                                </div>
                                <!--end::Header-->
                                <!--begin::Form-->
                                <form>
                                    <!--begin::Body-->
                                    <div class="card-body">
                                        <div class="row g-3">
                                            
                                            <div class="row g-2">
                                                <label for="inputDate" class="col-sm-2 col-form-label">조회기간</label>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <select class="form-select" id="validationCustom04">
                                                            <option value="전체">전체</option>
                                                            <option value="결제일">등록일</option>
                                                            <option value="취소접수일">답변완료일</option>
                                                        </select>
                                                    </div>
                                                    
                                                    <div class="col-md-3">
                                                   		<input type="date" class="form-control" id="startDate" name="startDate">
                                                	</div>
                                                	
                                                   	<div class="col-md-3">
                                                   		<input type="date" class="form-control" id="endDate" name="endDate">
                                                	</div>
                                                    
                                                </div>
                                            </div>

                                            <div class="row g-2">
                                                <label for="validationCustom04">상세검색</label>
                                                <div class="col-md-4">
                                                    <select class="form-select" id="validationCustom04">
                                                        <option value="전체" selected>전체</option>
                                                        <option value="상품번호">이름</option>
                                                        <option value="상품명">이메일</option>
                                                        <option value="국제표준도서번호">문의제목</option>
                                                        <option value="재고">문의내용</option>
                                                        <option value="재고">문의답변내용</option>
                                                        <option value="재고">주문번호</option>
                                                    </select>
                                                </div>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" id="inputCity">
                                                </div>
                                            </div>

                                            <div class="row g-2">
                                                <label for="validationCustom04">문의유형</label>
                                                <div class="col-md-4">
                                                    <select class="form-select" id="validationCustom04">
                                                        <option value="전체" selected>전체</option>
                                                        <option value="주문문의">주문문의</option>
                                                        <option value="상품문의">상품문의</option>
                                                        <option value="기타문의">기타문의</option>
                                                    </select>
                                                </div>
                                            </div>
                                            
                                            <div class="row g-2">
                                                <label>진열상태</label>
                                                <div class="col">
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1" checked>
                                                        <label class="form-check-label" for="inlineRadio1">전체</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                                                        <label class="form-check-label" for="inlineRadio2">미답변</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3">
                                                        <label class="form-check-label" for="inlineRadio3">답변완료</label>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                        </div>
                                    </div>
                                    <!--end::Body-->
                                    <!--begin::Footer-->
                                    <div class="card-footer">
                                        <button type="button" class="btn btn-primary">검색</button>
                                        <button type="reset" class="btn float-end">취소</button>
                                    </div> <!--end::Footer-->
                                </form>
                                <!--end::Form-->
                            </div>
                            <!--end::Quick Example-->
                        </div>
                    </div> <!--end::Row-->
                </div> <!--end::Container-->
            </div> <!--end::App Content-->

            <div class="app-content"> <!--begin::Container-->
                <div class="container-fluid"> <!-- Timelime example  -->
                    <div class="row">
                        <div class="col-12"> <!-- The icons -->
                            <div class="col-12">
                                <div class="card card-primary card-outline mb-4">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>답변여부</th>
                                                <th>등록일</th>
                                                <th>작성자</th>
                                                <th>이메일</th>
                                                <th>문의유형</th>
                                                <th>문의제목</th>
                                                <th>문의내용</th>
                                                <th>첨부파일</th>
                                                <th>문의답변내용</th>
                                                <th>답변완료일</th>
                                                <th>주문번호</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach items="${contactList}" var="vo">
	                                            <tr class="contact-row" data-contact-no="${vo.contact_no}" data-contact-title="${vo.contact_title}" 
	                                            data-contact-content="${vo.contact_content}" data-contact-comment="${vo.contact_comment}" data-contact-type="${vo.contact_type}"
	                                            data-contact-date="${vo.contact_create_at}" data-ordered-no="${vo.ordered_no}" data-contact-writer="${vo.ordered_name}" data-contact-email="${vo.email}">
	                                                <td onclick="openModal('${vo.contact_no}', '${vo.contact_type}', '${vo.contact_create_at}', '${vo.contact_title}', '${vo.contact_content}')" style="cursor: pointer;">
	                                                	<c:if test="${not empty vo.contact_comment}"><span style="color:blue;">답변완료</span></c:if>
	                                                	<c:if test="${empty vo.contact_comment}"><span style="color:red;">미답변</span></c:if>
	                                                </td>
	                                                <td>${vo.contact_create_at}</td>
	                                                <td>${vo.user_name}</td>
	                                                <td>${vo.email}</td>
	                                                <td>${vo.contact_type}</td>
	                                                <td onclick="window.open('${pageContext.request.contextPath}/inquirydetail.do?contact_no=${vo.contact_no}', '_blank')">
                                                		<span style="color:green; cursor: pointer;">${vo.contact_type}</span>
                                                	</td>
	                                                <td>${vo.contact_content}</td>
	                                                <td>
	                                                	<c:if test="${not empty vo.attachment_detail_new_name}">
	                                                		<img src="<%=request.getContextPath()%>/upload/${vo.attachment_detail_new_name}" width="100" height="130">
	                                                	</c:if>
	                                                </td>
	                                                <td>${vo.contact_comment}</td>
	                                                <td>${vo.contact_comment_date}</td>
	                                                <td>${vo.ordered_no}</td>
	                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    
                                    <!-- 문의 정보 Modal -->
                                    <div class="modal fade" id="orderDetailModal" tabindex="-1" aria-labelledby="orderDetailModalLabel" aria-hidden="true">
									    <div class="modal-dialog">
									        <div class="modal-content">
									            <div class="modal-header">
									                <h5 class="modal-title" id="orderDetailModalLabel">문의 답변</h5>
									                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									            </div>
									            <div class="modal-body">
									                <input type="hidden" id="contactNo"> <!-- 문의 번호 -->
									                	<div>문의 유형 : <span id="contactType"></span></div>
									                	<div>문의 제목 : <span id="contactTitle"></span></div>
									                	<div>문의 내용 : <span id="contactContent"></span></div>
									                	<div>문의 등록일 : <span id="contactDate"></span></div>
									                	<div>주문 번호 : <span id="orderedNo"></span></div>
									                	<div>작성자 : <span id="contactWriter"></span></div>
									                	<div>이메일 : <span id="contactEmail"></span></div>
									                	<hr>
									                <h5>답변 작성</h5>
									                <textarea id="comment" class="form-control" rows="5" placeholder="답변 내용을 입력하세요."></textarea>
									            </div>
									            <div class="modal-footer">
									                <button type="button" class="btn btn-primary" id="saveReplyBtn">저장</button>
									                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
									            </div>
									        </div>
									    </div>
									</div>
									
                                    <!--begin::Pagination-->
                                    <div aria-label="Page navigation example">
                                        <ul class="pagination">
                                            <li class="page-item">
                                             	<c:if test="${paging.startPage > 1 }">
	                                            	<a class="page-link" href="contact.do?nowPage=${paging.startPage-1}" aria-label="Previous">
	                                            		<span aria-hidden="true">&laquo;</span>
	                                            	</a>
                                            	</c:if>
                                           	</li>
                                            <li class="page-item">
                                            	<c:forEach begin="${paging.startPage }" end="${paging.endPage}" var="cnt">
													<c:if test="${paging.nowPage eq cnt }">
														<b>${cnt}</b>
													</c:if>
													<c:if test="${paging.nowPage ne cnt }">
                                            			<a class="page-link" href="contact.do?nowPage=${cnt}">${cnt}</a>
													</c:if>
												</c:forEach>
                                           	</li>
                                            <li class="page-item">
                                            	<c:if test="${paging.endPage < paging.lastPage }">
		                                            <a class="page-link" href="contact.do?nowPage=${paging.endPage+1}" aria-label="Next">
		                                            	<span aria-hidden="true">&raquo;</span>
		                                            </a>
	                                            </c:if>
                                            </li>
                                        </ul>
                                    </div>
                                    <!--end::Pagination-->
                                </div>
                            </div>
                        </div> <!-- /.col -->
                    </div> <!-- /.row -->
                </div> <!--end::Container-->
            </div>
        </main>
        
        <script>
	     	// 모달창 초기화 및 저장 버튼 이벤트
	        document.addEventListener("DOMContentLoaded", function () {
	            // 저장 버튼 클릭 이벤트
	            document.getElementById("saveReplyBtn").addEventListener("click", function () {
	                // 모달 내의 입력값 가져오기
	                const contactNo = document.getElementById("contactNo").value;
	                const comment = document.getElementById("comment").value;
	
	                // 유효성 검사
	                if (!comment.trim()) {
	                    alert("답변 내용을 입력해주세요.");
	                    return;
	                }
	
	                // AJAX 요청
	                fetch("saveReply.do", {
	                    method: "POST",
	                    headers: { "Content-Type": "application/json" },
	                    body: JSON.stringify({ contact_no: contactNo, contact_comment: comment })
	                })
		                .then(response => response.json())
		                .then(data => {
		                    if (data.status === "success") {
		                        alert(data.message); // 성공 메시지
		                        location.reload();   // 페이지 새로고침
		                    } else {
		                        alert(data.message); // 실패 메시지
		                    }
		                })
		                .catch(error => {
		                    console.error("Error:", error);
		                    alert("저장 중 오류가 발생했습니다. 다시 시도해주세요.");
		                });
	            });
	
	            // 모달창을 띄울 때 데이터를 채우는 로직
	            document.querySelectorAll(".contact-row").forEach(row => {
	                row.addEventListener("click", function () {
	                	const contactNo = this.getAttribute("data-contact-no"); // 클릭된 문의번호
	                	const type = this.getAttribute("data-contact-type")
	                    const title = this.getAttribute("data-contact-title"); // 문의 제목
	                    const content = this.getAttribute("data-contact-content"); // 문의 내용
	                    const comment = this.getAttribute("data-contact-comment"); // 문의 답변 내용
	                    const date = this.getAttribute("data-contact-date"); // 문의 등록일
	                    const orderedNo = this.getAttribute("data-ordered-no"); // 주문 번호
	                    const writer = this.getAttribute("data-contact-writer"); // 작성자
	                    const email = this.getAttribute("data-contact-email"); // 이메일

	                    // 모달창에 데이터 삽입
	                    document.getElementById("contactNo").value = contactNo;
	                    document.getElementById("contactType").innerText = type;
	                    document.getElementById("contactTitle").innerText = title;
	                    document.getElementById("contactContent").innerText = content;
	                    document.getElementById("contactDate").innerText = date;
	                    document.getElementById("orderedNo").innerText = orderedNo;
	                    document.getElementById("contactWriter").innerText = writer;
	                    document.getElementById("contactEmail").innerText = email;
	                    

	                    // 답변 내용이 있을 경우 textarea에 넣어주기
	                    const commentTextarea = document.getElementById("comment");
	                    if (comment) {
	                        commentTextarea.value = comment; // 기존 답변이 있을 경우 채워넣음
	                    } else {
	                        commentTextarea.value = ""; // 답변이 없으면 빈 값으로 설정
	                    }
	                    
	                    // 모달창 띄우기
	                    const modal = new bootstrap.Modal(document.getElementById("orderDetailModal"));
	                    modal.show();
	                });
	            });
	        });
        </script>
				
<%@ include file="/WEB-INF/views/admin/include/footer.jsp" %>