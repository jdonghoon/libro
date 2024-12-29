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
                                                    <select class="form-select" id="searchType" name="searchType">
                                                        <option value="all" selected>전체</option>
                                                        <option value="user_id">아이디</option>
                                                        <option value="user_name">이름</option>
                                                        <option value="user_phone">전화번호</option>
                                                        <option value="user_email">이메일</option>
                                                        <option value="user_note">기타사항</option>
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
                                                   		<input type="date" class="form-control" id="startDate" name="user_created_at">
                                                	</div>
                                                   	<div class="col-md-5">
                                                   		<input type="date" class="form-control" id="endDate" name="user_created_atEnd">
                                                	</div>
                                                </div>
                                            </div>
                                            
                                            <div class="row g-2">
                                                <label>회원상태</label>
                                                <div class="col">
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="user_status" id="inlineRadio1" value="all" checked>
                                                        <label class="form-check-label" for="inlineRadio1">전체</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="user_status" id="inlineRadio2" value="E">
                                                        <label class="form-check-label" for="inlineRadio2">활성</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="user_status" id="inlineRadio3" value="D">
                                                        <label class="form-check-label" for="inlineRadio3">비활성</label>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                        </div>
                                    </div>
                                    <!--end::Body-->
                                    <!--begin::Footer-->
                                    <div class="card-footer">
                                        <button type="button" onclick="search()" class="btn btn-primary">검색</button>
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
									            <td id="modalUserId" style="padding: 5px;"></td>
									            <th>이름</th>
									            <td id="modalUserName" style="padding: 5px;"></td>
									        </tr>
									        <tr>
									            <th>휴대폰 번호</th>
									            <td id="modalUserPhone" style="padding: 5px;"></td>
									            <th>이메일</th>
									            <td id="modalUserEmail" style="padding: 5px;"></td>
									        </tr>
									        <tr>
									            <th>상태</th>
									            <td id="modalUserStatus" style="padding: 5px;"></td>
									            <td colspan="2">
									                <label><input type="radio" name="status" id="statusModal" value="E"> 활성</label>
									                <label style="margin-left: 10px;"><input type="radio" name="status" id="statusModal" value="D"> 비활성</label>
									            </td>
									        </tr>
									        <tr>
									            <th>가입일</th>
									            <td id="modalUserCreatedAt" style="padding: 5px;"></td>
									        </tr>
									        <tr>
									            <th>수정일</th>
									            <td id="modalUserUpdatedAt" style="padding: 5px;"></td>
									            <th>수정ID</th>
									            <td id="modalUserUpdatedBy" style="padding: 5px;"></td>
									        </tr>
									    </table>
									    <div style="margin-top: 20px;">
									        <h3 style="margin: 10px 0;">MEMO</h3>
									        <textarea id="modalMemo" style="width: 100%; height: 100px; border: 1px solid #ccc; border-radius: 5px;"></textarea>
									    </div>
									    <div style="text-align: center; margin-top: 20px;">
									        <button onclick="applyChanges()" style="padding: 10px 20px; margin-right: 10px; background-color: #007BFF; color: white; border: none; border-radius: 5px; cursor: pointer;">적용</button>
									        <button onclick="closeModal()" style="padding: 10px 20px; background-color: #6C757D; color: white; border: none; border-radius: 5px; cursor: pointer;">닫기</button>
									    </div>
									</div>

                                
                                    <table id="memberTable">
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
                                                <th>수정ID</th>
                                            </tr>
                                        </thead>
                                        <tbody>
											<c:forEach items="${list}" var="vo">
	                                            <tr onclick="showUserModal('${vo.user_id}', '${vo.user_name}', '${fn:replace(vo.user_phone, ',', '-')}', '${vo.user_email}', '${vo.user_note}', '${vo.user_status}', '${vo.user_created_at}', '${vo.user_update_at}', '${vo.user_update_id}')">
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
													<td>${vo.user_update_id}</td>
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
	        // 모달창 열기
	        function showUserModal(userId, userName, userPhone, userEmail, userMemo, userStatus, createdAt, updatedAt, updatedBy) {
	        	// 사용자 정보
	        	document.getElementById('modalUserId').innerText = userId;
	            document.getElementById('modalUserName').innerText = userName;
	            document.getElementById('modalUserPhone').innerText = userPhone;
	            document.getElementById('modalUserEmail').innerText = userEmail;
	            document.getElementById('modalMemo').value = userMemo;

	         	// 사용자 상태 설정 (활성/비활성)
	            var statusText = '';
	            if (userStatus === 'E') {
	                statusText = '활성';
	                console.log(document.querySelector('input[name="status"][value="E"]'));
	                document.querySelector('input[id="statusModal"][value="E"]').checked = true;
	                document.querySelector('input[id="statusModal"][value="D"]').checked = false;
	            } else if (userStatus === 'D') {
	                statusText = '비활성';
	                document.querySelector('input[id="statusModal"][value="D"]').checked = true;
	                document.querySelector('input[id="statusModal"][value="E"]').checked = false;
	            }
	            document.getElementById('modalUserStatus').innerText = statusText;
	
	            // 가입일과 수정일, 수정ID
	            document.getElementById('modalUserCreatedAt').innerText = createdAt;
	            document.getElementById('modalUserUpdatedAt').innerText = updatedAt;
	            document.getElementById('modalUserUpdatedBy').innerText = updatedBy;
	
	            // 모달 열기
	            document.getElementById('userModal').style.display = 'block';
	        }
	
	        // 모달창 닫기
	        function closeModal() {
	            document.getElementById('userModal').style.display = 'none';
	        }
	
	        // 변경사항 적용
	        function applyChanges() {
	        	var userId = document.getElementById('modalUserId').innerText;
	            var userUpdateId = document.getElementById('modalUserUpdatedBy').innerText;
	            var userMemo = document.getElementById('modalMemo').value;
	            var userStatus = document.querySelector('input[id="statusModal"]:checked').value;
	
	            var userVO = {
            		user_id : userId,
	            	user_update_id : userUpdateId,
	                user_note: userMemo,
	                user_status: userStatus
	            };
	            
	            // AJAX 요청을 통해 서버로 데이터 전송
	            var ajaxUrl = "<%= request.getContextPath() %>/admin/updateUser.do";
	            
	            $.ajax({
	                url: ajaxUrl,
	                type: 'POST',
	                contentType: 'application/json',
	                data: JSON.stringify(userVO),
	                success: function(response) {
	                    if (response.status === 'success') {
	                    	console.log(userVO);
	                        alert(response.message);
	                        closeModal();  // 모달 닫기
	                        // 데이터 갱신을 위해 페이지 새로고침 또는 부분 업데이트
	                        location.reload(); // 페이지 새로고침
	                    } else {
	                        alert(response.message);
	                    }
	                },
	                error: function(xhr, status, error) {
	                    alert("서버 오류가 발생했습니다.");
	                }
	            });
	        }
	        
	        
	        function search() {
	            const searchType = document.getElementById("searchType").value;
	            const searchValue = document.getElementById("inputDetail").value;
	            const startDate = document.getElementById("startDate").value;
	            const endDate = document.getElementById("endDate").value || new Date().toISOString().split('T')[0];  // 오늘 날짜
	            const userStatus = document.querySelector('input[name="user_status"]:checked').value;

	            // Create query parameters
	            const queryParams = {
	                searchType,
	                searchValue,
	                startDate,
	                endDate,
	                userStatus
	            };

	            // Send AJAX request
	            fetch('search.do', {
	                method: 'POST',
	                headers: { 'Content-Type': 'application/json' },
	                body: JSON.stringify(queryParams)
	            })
	            .then(response => response.json())
	            .then(data => {
	                // Update table with the search result
	                updateTable(data);
	            })
	            .catch(error => {
	                console.error('Error:', error);
	            });
	        }

	        // Update table dynamically
	        function updateTable(data) {
	            const tableBody = document.querySelector('#memberTable tbody');
	            tableBody.innerHTML = ''; // Clear existing rows

	            if (data.length === 0) {
	                tableBody.innerHTML = '<tr><td colspan="8">검색 결과가 없습니다.</td></tr>';
	                return;
	            }

	            data.forEach(member => {
	                const row = document.createElement('tr');
	                row.innerHTML = `
	                    <td>/${member.userId}</td>
	                    <td>/${member.userName}</td>
	                    <td>/${member.userPhone}</td>
	                    <td>/${member.userEmail}</td>
	                    <td>/${member.userNote}</td>
	                    <td>
		                    <c:choose>
		                        <c:when test="/${vo.userStatus == 'E'}">
		                            활성
		                        </c:when>
		                        <c:otherwise>
		                            비활성
		                        </c:otherwise>
		                    </c:choose>
	                </td>
	                    <td>/${member.userCreatedAt}</td>
	                    <td>/${member.userUpdatedAt}</td>
	                `;
	                tableBody.appendChild(row);
	            });
	        }



	        
	        
		</script>
        
        
<%@ include file="/WEB-INF/views/admin/include/footer.jsp" %>