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
                            <h3 class="mb-0">리뷰관리</h3>
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
                                    <div class="card-title">리뷰 목록</div>
                                </div>
                                <!--end::Header-->
                                <!--begin::Form-->
                                <form>
                                    <!--begin::Body-->
                                    <div class="card-body">
                                        <div class="row g-3">

                                            <div class="row g-2">
                                                <label for="validationCustom04">상세검색</label>
                                                <div class="col-md-4">
                                                    <select class="form-select" id="validationCustom04">
                                                        <option value="전체" selected>전체</option>
                                                        <option value="상품주문번호">상품주문번호</option>
                                                        <option value="상품번호">상품번호</option>
                                                        <option value="상품명">상품명</option>
                                                        <option value="상품가격">별점</option>
                                                        <option value="수량">내용</option>
                                                        <option value="주문자명">작성자/ID</option>
                                                    </select>
                                                </div>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" id="inputCity">
                                                </div>
                                            </div>

                                            <div class="row g-2">
                                                <label for="startDate" class="col-sm-2 col-form-label">리뷰 작성일</label>
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
                                                <label>공개여부</label>
                                                <div class="col">
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="status" id="inlineRadio1" value="all" checked>
                                                        <label class="form-check-label" for="inlineRadio1">전체</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="status" id="inlineRadio2" value="E">
                                                        <label class="form-check-label" for="inlineRadio2">공개</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="status" id="inlineRadio3" value="D">
                                                        <label class="form-check-label" for="inlineRadio3">비공개</label>
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
                                            	<th rowspan='2'>btn</th>
                                                <th colspan='2'>상품정보</th>
                                                <th colspan='7'>리뷰정보</th>
                                                <th>주문정보</th>
                                            </tr>
                                            <tr>
                                                <th>상품번호</th>
                                                <th>상품명</th>
                                                <th>별점</th>
                                                <th>사진</th>
                                                <th>내용</th>
                                                <th>작성일</th>
                                                <th>수정일</th>
                                                <th>ID</th>
                                                <th>공개여부</th>
                                                <th>상품주문번호</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach items="${reviewList}" var="vo">
	                                            <tr>
	                                            	<td>
	                                            		<button class="btn btn-primary" onclick="changeStatus('${vo.review_no}', 'E')">공개</button>
	                                            		<button class="btn btn-primary" onclick="changeStatus('${vo.review_no}', 'D')">비공개</button>
	                                            	</td>
	                                                <td onclick="window.open('${pageContext.request.contextPath}/product.do?product_no=${vo.product_no}', '_blank')">
	                                                	<span style="color:green; cursor: pointer;">${vo.product_no}</span>
	                                                </td>
	                                                <td>${vo.product_name}</td>
	                                                <td>${vo.review_starrating}</td>
	                                                <td>
	                                                	<c:if test="${not empty vo.attachment_detail_new_name}">
	                                                		<img src="<%=request.getContextPath()%>/upload/${vo.attachment_detail_new_name}" width="100" height="130">
	                                                	</c:if>
	                                                </td>
	                                                <td>
	                                                    ${vo.review_content}
	                                                </td>
	                                                <td>${vo.review_create_at}</td>
	                                                <td>${vo.review_update_at}</td>
	                                                <td>${vo.review_create_id}</td>
	                                                <td>
	                                                	<c:if test="${vo.review_status == 'E'}"><span style="color:blue;">공개</span></c:if>
	                                                	<c:if test="${vo.review_status == 'D'}"><span style="color:red;">비공개</span></c:if>
	                                                </td>
	                                                <td onclick="showOrderDetails('${vo.ordered_detail_no}')">
	                                                	<span style="color:green; cursor: pointer;">${vo.ordered_detail_no}</span>
	                                                </td>
	                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    
                                    <!-- Modal -->
									<div class="modal fade" id="orderDetailModal" tabindex="-1" aria-labelledby="orderDetailModalLabel" aria-hidden="true">
									  <div class="modal-dialog modal-lg">
									    <div class="modal-content">
									      <div class="modal-header">
									        <h5 class="modal-title" id="orderDetailModalLabel">상품주문조회</h5>
									        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									      </div>
									      <div class="modal-body">
									        <h6>주문 상세 정보</h6>
									        <div id="orderDetails">
									          <!-- AJAX로 채워질 내용 -->
									        </div>
									        <hr>
									        <h6>구매자 정보</h6>
									        <div id="buyerDetails">
									          <!-- AJAX로 채워질 내용 -->
									        </div>
									      </div>
									      <div class="modal-footer">
									        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
									      </div>
									    </div>
									  </div>
									</div>
                                    
                                    <!--begin::Pagination-->
                                    <div aria-label="Page navigation example">
									    <ul class="pagination justify-content-center">
									        <!-- Previous 버튼 -->
									        <c:if test="${paging.startPage > 1}">
									            <li class="page-item">
									                <a class="page-link" href="review.do?nowPage=${paging.startPage-1}" aria-label="Previous">
									                    <span aria-hidden="true">&laquo;</span>
									                </a>
									            </li>
									        </c:if>
									
									        <!-- 페이지 번호 -->
									        <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="cnt">
									            <li class="page-item <c:if test='${paging.nowPage eq cnt}'>active</c:if>">
									                <a class="page-link" href="review.do?nowPage=${cnt}">
									                    ${cnt}
									                </a>
									            </li>
									        </c:forEach>
									
									        <!-- Next 버튼 -->
									        <c:if test="${paging.endPage < paging.lastPage}">
									            <li class="page-item">
									                <a class="page-link" href="review.do?nowPage=${paging.endPage+1}" aria-label="Next">
									                    <span aria-hidden="true">&raquo;</span>
									                </a>
									            </li>
									        </c:if>
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
	        function changeStatus(reviewNo, reviewStatus) {
		  	    var reviewVO = {
		  	      review_no: reviewNo,
		  	      review_status: reviewStatus
		  	    };
	
		  	    $.ajax({
		  	        url: 'reviewStatus.do',
		  	        type: 'POST',
		  	        contentType: 'application/json',  // JSON 형식으로 데이터 전송
		  	        data: JSON.stringify(reviewVO),  // 객체를 JSON 문자열로 변환
		  	        success: function(response) {
		  	            if(response === "success") {
		  	                
		  	           		// 상태 값에 맞는 텍스트 변경
		  	                var statusCell = $("td:contains('" + reviewNo + "')").siblings().eq(9);
		  	                if (reviewStatus === 'E') {
		  	                    statusCell.text("공개").css("color", "blue");
		  	                } else if (reviewStatus === 'D') {
		  	                    statusCell.text("비공개").css("color", "red");
		  	                }
		  	                
		  	            } else {
		  	                alert("상태 변경에 실패했습니다.");
		  	            }
		  	        },
		  	        error: function() {
		  	            alert("서버와의 통신에 실패했습니다.");
		  	        }
		  	    });
		  	}
	        
	        function showOrderDetails(orderedDetailNo) {
		  	    // AJAX로 주문 상세 데이터 가져오기
		  	    $.ajax({
		  	        url: 'getOrderDetails.do', // 데이터를 가져올 서버 URL
		  	        type: 'GET',
		  	        data: { ordered_detail_no: orderedDetailNo }, // 서버 파라미터 이름 맞추기
		  	        success: function(response) {
		  	            // 서버로부터 받은 데이터 콘솔에 출력
		  	            console.log('서버 응답 데이터:', response);  // 응답 데이터 확인

		  	            if (response.error) {
		  	                alert(response.error);  // 오류가 있을 경우 메시지 표시
		  	                return;
		  	            }
		  	            
		  	            // 서버로부터 받은 데이터를 모달에 채우기
		  	            $('#orderDetails').html(`
		  	                <p>상품명 : \${response.product_name}</p>
		  	                <p>상품 가격 : \${response.product_price ? response.product_price.toLocaleString() : 0} 원</p>
		  	                <p>주문 상태 : \${response.ordered_status === 'CC' ? '취소 완료' : response.ordered_status === 'D' ? '발송 완료' : ''}</p>
		  	                <p>주문일 : \${response.ordered_create_at}</p>
		  	                <p>결제일 : \${response.payment_date}</p>
		  	                <p>결제 방법 : \${response.payment_method}</p>
		  	                <p>수량 : \${response.ordered_detail_quantity}</p>
		  	                <p>배송비 : \${response.ordered_delivery_fee !== null && response.ordered_delivery_fee !== undefined ? response.ordered_delivery_fee.toLocaleString() : 0} 원</p>
		  	                <p>결제 금액 : \${response.payment_price ? response.payment_price.toLocaleString() : 0} 원</p>
		  	            `);
		  	            $('#buyerDetails').html(`
		  	                <p>구매자명 : \${response.ordered_name}</p>
		  	                <p>구매자 주소 : \${response.ordered_address}</p>
		  	                <p>구매자 연락처 : \${response.ordered_phone.replace(/,/g, '-')}</p>
		  	                <p>배송 메모 : \${response.ordered_note}</p>
		  	            `);

		  	            // 모달 표시
		  	            $('#orderDetailModal').modal('show');
		  	        },
		  	        error: function(xhr, status, error) {
		  	            console.error('AJAX 요청 오류:', error);  // 오류가 발생하면 출력
		  	            alert('주문 상세 정보를 가져오는 데 실패했습니다.');
		  	        }
		  	    });
		  	}
	        
		</script>
		
		
				
<%@ include file="/WEB-INF/views/admin/include/footer.jsp" %>