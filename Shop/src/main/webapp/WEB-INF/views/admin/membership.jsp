<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

        <main class="app-main">
            <!--begin::App Content Header-->
            <div class="app-content-header">
                <!--begin::Container-->
                <div class="container-fluid">
                    <!--begin::Row-->
                    <div class="row">
                        <div class="col-sm-6">
                            <h3 class="mb-0">회원관리</h3>
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
                                    <div class="card-title">회원 정보 목록</div>
                                </div>
                                <!--end::Header-->
                                <!--begin::Search Form-->
                                <form action="membership.do" method="get">
                                    <!--begin::Body-->
                                    <div class="card-body">
                                        <div class="row g-3">

                                            <div class="row g-2">
                                                <label for="validationCustom04">상세검색</label>
                                                <div class="col-md-4">
                                                    <select class="form-select" id="validationCustom04" name="searchType">
                                                        <option value="all" selected>전체</option>
                                                        <option value="id">아이디</option>
                                                        <option value="name">이름</option>
                                                        <option value="phone">전화번호</option>
                                                        <option value="email">이메일</option>
                                                        <option value="note">기타사항</option>
                                                    </select>
                                                </div>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" id="inputDetail" name="searchValue">
                                                </div>
                                            </div>

                                            <div class="row g-2">
                                                <label for="startDate">가입일</label>
                                                <div class="row">
                                                	<div class="col-md-5">
                                                   		<input type="date" class="form-control" id="startDate" name="startDate">
                                                	</div>
                                                   	<div class="col-md-5">
                                                   		<input type="date" class="form-control" id="endDate" name="endDate">
                                                	</div>
                                                </div>
                                            </div>
                                            
                                            <div class="row g-2">
                                                <label>회원상태</label>
                                                <div class="col">
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="status" id="inlineRadio1" value="all" checked>
                                                        <label class="form-check-label" for="inlineRadio1">전체</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="status" id="inlineRadio2" value="E">
                                                        <label class="form-check-label" for="inlineRadio2">활성</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="status" id="inlineRadio3" value="D">
                                                        <label class="form-check-label" for="inlineRadio3">비활성</label>
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
                                <!--end::Search Form-->
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
                                	
                                	<!-- Modal -->
                                	<div id="userModal" style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background: white; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); width: 600px; padding: 20px; z-index: 1000;">
									    <h2 style="text-align: center;">회원정보</h2>
									    <table style="width: 100%; border-collapse: collapse; margin-top: 20px;">
									        <tr>
									            <th>아이디</th>
									            <td id="modalUserId" style="padding: 5px;">${vo.user_id}</td>
									            <th>이름</th>
									            <td id="modalUserName" style="padding: 5px;">${vo.user_name}</td>
									        </tr>
									        <tr>
									            <th>휴대폰 번호</th>
									            <td id="modalUserPhone" style="padding: 5px;">${fn:replace(vo.user_phone, ',', '-')}</td>
									            <th>이메일</th>
									            <td id="modalUserEmail" style="padding: 5px;">${vo.user_email}</td>
									        </tr>
									        <tr>
									            <th>상태</th>
									            <td id="modalUserStatus" style="padding: 5px;">${vo.user_status}</td>
									            <td colspan="2">
									                <label><input type="radio" name="status" value="active" checked> 활성</label>
									                <label style="margin-left: 10px;"><input type="radio" name="status" value="inactive"> 비활성</label>
									            </td>
									        </tr>
									        <tr>
									            <th>가입일</th>
									            <td id="modalUserCreatedAt" style="padding: 5px;">${vo.user_created_at}</td>
									            <th>등록ID</th>
									            <td id="modalUserRegisterId" style="padding: 5px;">${vo.user_create_id}</td>
									        </tr>
									        <tr>
									            <th>수정일</th>
									            <td id="modalUserUpdatedAt" style="padding: 5px;">${vo.user_update_at}</td>
									            <th>수정ID</th>
									            <td id="modalUserUpdateId" style="padding: 5px;">${vo.user_update_id}</td>
									        </tr>
									    </table>
									    <div style="margin-top: 20px;">
									        <h3 style="margin: 10px 0;">MEMO</h3>
									        <textarea id="modalMemo" style="width: 100%; height: 100px; border: 1px solid #ccc; border-radius: 5px;">${vo.user_note}</textarea>
									    </div>
									    <div style="text-align: center; margin-top: 20px;">
									        <button onclick="applyChanges()" style="padding: 10px 20px; margin-right: 10px; background-color: #007BFF; color: white; border: none; border-radius: 5px; cursor: pointer;">적용</button>
									        <button onclick="closeModal()" style="padding: 10px 20px; background-color: #6C757D; color: white; border: none; border-radius: 5px; cursor: pointer;">닫기</button>
									    </div>
									</div>

                                
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>이름</th>
                                                <th>휴대폰번호</th>
                                                <th>이메일</th>
                                                <th>기타사항</th>
                                                <th>상태</th>
                                                <th>가입일</th>
                                                <th>수정일</th>
                                            </tr>
                                        </thead>
                                        <tbody>
											<c:forEach items="${list}" var="vo">
	                                            <tr onclick="showUserModal('${vo.user_id}', '${vo.user_name}', '${fn:replace(vo.user_phone, ',', '-')}', '${vo.user_email}', '${vo.user_note}', '${vo.user_status}', '${vo.user_created_at}', '${vo.user_update_at}')">
	                                                <td>${vo.user_id}</td>
	                                                <td>${vo.user_name}</td>
	                                                <td>${fn:replace(vo.user_phone, ',', '-')}</td>
	                                                <td>${vo.user_email}</td>
	                                                <td>${vo.user_note}</td>
	                                                <td>
	                                                	<c:if test="${vo.user_status == 'E'}"><span style="color:blue;">활성</span></c:if>
														<c:if test="${vo.user_status == 'D'}"><span style="color:red;">비활성</span></c:if>
	                                                </td>
	                                                <td>${vo.user_created_at}</td>
	                                                <td>${vo.user_update_at}</td>
	                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    
                                    <!--begin::Pagination-->
                                    <div aria-label="Page navigation example">
                                        <ul class="pagination">
                                            <li class="page-item">
                                             	<c:if test="${paging.startPage > 1 }">
	                                            	<a class="page-link" href="membership.do?nowPage=${paging.startPage-1}" aria-label="Previous">
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
                                            			<a class="page-link" href="membership.do?nowPage=${cnt}">${cnt}</a>
													</c:if>
												</c:forEach>
                                           	</li>
                                            <li class="page-item">
                                            	<c:if test="${paging.endPage < paging.lastPage }">
		                                            <a class="page-link" href="membership.do?nowPage=${paging.endPage+1}" aria-label="Next">
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
		 	// 모달 열기
		    function openModal() {
		        document.querySelector('#userModal').style.display = 'block';
		    }

		    // 모달 닫기
		    function closeModal() {
		        document.querySelector('#userModal').style.display = 'none';
		    }
		    
		 	// 적용 버튼 클릭 이벤트
		    function applyChanges() {
		        alert('변경 사항이 적용되었습니다.');
		        closeModal();
		    }

		    // 특정 유저 정보를 모달에 세팅하고 열기
		    function showUserModal(userId, userName, userPhone, userEmail, userNote, userStatus, userCreatedAt, userUpdatedAt) {
		        document.querySelector('#modalUserId').innerText = userId;
		        document.querySelector('#modalUserName').innerText = userName;
		        document.querySelector('#modalUserPhone').innerText = userPhone;
		        document.querySelector('#modalUserEmail').innerText = userEmail;
		        document.querySelector('#modalMemo').value = userNote;

		        // 상태 설정
		        const statusElement = document.querySelector('#modalUserStatus');
		        statusElement.innerText = userStatus === 'E' ? '활성' : '비활성';

		        // 가입일 및 수정일
		        document.querySelector('#modalUserCreatedAt').innerText = userCreatedAt;
		        document.querySelector('#modalUserUpdatedAt').innerText = userUpdatedAt;

		        openModal();
		    }
		</script>
        
        
<%@ include file="/WEB-INF/views/admin/include/footer.jsp" %>