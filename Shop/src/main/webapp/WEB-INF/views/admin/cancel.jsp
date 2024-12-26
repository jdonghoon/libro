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
                            <h3 class="mb-0">취소관리</h3>
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
                                    <div class="card-title">취소 목록</div>
                                </div>
                                <!--end::Header-->
                                <!--begin::Form-->
                                <form>
                                    <!--begin::Body-->
                                    <div class="card-body">
                                        <div class="row g-3">

                                            <div class="row g-2">
                                                <label for="validationCustom04">처리상태</label>
                                                <div class="col-md-4">
                                                    <select class="form-select" id="validationCustom04">
                                                        <option value="전체" selected>전체</option>
                                                        <option value="취소대기">취소대기</option>
                                                        <option value="취소완료">취소완료</option>
                                                        <option value="환불완료">환불대기</option>
                                                        <option value="환불완료">환불완료</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="row g-2">
                                                <label for="validationCustom04">상세검색</label>
                                                <div class="col-md-4">
                                                    <select class="form-select" id="validationCustom04">
                                                        <option value="전체" selected>전체</option>
                                                        <option value="상품주문번호">상품주문번호</option>
                                                        <option value="주문번호">주문번호</option>
                                                        <option value="상품명">상품명</option>
                                                        <option value="취소사유">취소사유</option>
                                                        <option value="결제일">결제수단</option>
                                                        <option value="결제일">결제금액</option>
                                                        <option value="결제일">환불상태</option>
                                                        <option value="결제일">환불금액</option>
                                                        <option value="수량">수량</option>
                                                        <option value="주문자명">주문자명</option>
                                                        <option value="주문자 연락처">주문자 연락처</option>
                                                    </select>
                                                </div>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" id="inputCity">
                                                </div>
                                            </div>

                                            <div class="row g-2">
                                                <label for="inputDate" class="col-sm-2 col-form-label">조회기간</label>
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <select class="form-select" id="validationCustom04">
                                                            <option value="전체">전체</option>
                                                            <option value="결제일">결제일</option>
                                                            <option value="취소접수일">취소접수일</option>
                                                            <option value="환불완료일">환불완료일</option>
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
                                                <th>btn</th>
                                                <th>취소접수일</th>
                                                <th>주문상태</th>
                                                <th>상품주문번호</th>
                                                <th>주문번호</th>
                                                <th>상품명</th>
                                                <th>취소사유</th>
                                                <th>결제일</th>
                                                <th>결제수단</th>
                                                <th>결제금액</th>
                                                <th>환불상태</th>
                                                <th>환불금액</th>
                                                <th>환불완료일</th>
                                                <th>수량</th>
                                                <th>주문자명</th>
                                                <th>주문자 연락처</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach items="${orderCancelList}" var="vo">
	                                            <tr>
	                                                <td>
	                                                    <button class="btn btn-primary" onclick="changeStatus('${vo.ordered_no}', 'CC')">취소완료</button>
	                                                    <button class="btn btn-primary" onclick="changeRefundStatus('${vo.payment_no}', 'RC')">환불완료</button>
	                                                </td>
	                                                <td>${vo.ordered_cancel_date}</td>
	                                                <td>
	                                                	<c:if test="${vo.ordered_status == 'CW'}">취소대기</c:if>
	                                                	<c:if test="${vo.ordered_status == 'CC'}"><span style="color:blue;">취소완료</span></c:if>
	                                                </td>
	                                                <td onclick="showOrderDetails('${vo.ordered_detail_no}')"><span style="color:green; cursor: pointer;">${vo.ordered_detail_no}</span></td>
	                                                <td>${vo.ordered_no}</td>
	                                                <td>${vo.product_name}</td>
	                                                <td>${vo.ordered_cancel_reason}</td>
	                                                <td>${vo.payment_date}</td>
	                                                <td>${vo.payment_method}</td>
	                                                <td>${vo.payment_price}원</td>
	                                                <td>
	                                                	<c:if test="${vo.payment_type == 'RW'}">환불대기</c:if>
	                                                	<c:if test="${vo.payment_type == 'RC'}"><span style="color:blue;">환불완료</span></c:if>
	                                                </td>
	                                                <td>${vo.payment_refund_price}원</td>
	                                                <td>${vo.payment_refund_date}</td>
	                                                <td>${vo.ordered_detail_quantity}</td>
	                                                <td>${vo.ordered_name}</td>
	                                                <td>
	                                                	${fn:replace(vo.ordered_phone, ',', '-')}
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
                                        <ul class="pagination">
                                            <li class="page-item">
                                             	<c:if test="${paging.startPage > 1 }">
	                                            	<a class="page-link" href="cancel.do?nowPage=${paging.startPage-1}" aria-label="Previous">
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
                                            			<a class="page-link" href="cancel.do?nowPage=${cnt}">${cnt}</a>
													</c:if>
												</c:forEach>
                                           	</li>
                                            <li class="page-item">
                                            	<c:if test="${paging.endPage < paging.lastPage }">
		                                            <a class="page-link" href="cancel.do?nowPage=${paging.endPage+1}" aria-label="Next">
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
        function changeStatus(orderedNo, orderedStatus) {
	  	    var orderedVO = {
	  	        ordered_no: orderedNo,
	  	        ordered_status: orderedStatus
	  	    };

	  	    $.ajax({
	  	        url: 'updateStatus.do',
	  	        type: 'POST',
	  	        contentType: 'application/json',  // JSON 형식으로 데이터 전송
	  	        data: JSON.stringify(orderedVO),  // 객체를 JSON 문자열로 변환
	  	        success: function(response) {
	  	            if(response === "success") {
	  	                
	  	           		// 상태 값에 맞는 텍스트 변경
	  	                var statusCell = $("td:contains('" + orderedNo + "')").siblings().eq(2);
	  	                if (orderedStatus === 'CW') {
	  	                    statusCell.text("취소대기");
	  	                } else if (orderedStatus === 'CC') {
	  	                    statusCell.text("취소완료").css("color", "blue");
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
        
        function changeRefundStatus(paymentNo, paymentStatus) {
	  	    var paymentVO = {
	    		payment_no: paymentNo,
	  	      	payment_type: paymentStatus
	  	    };

	  	    $.ajax({
	  	        url: 'updateRefundStatus.do',
	  	        type: 'POST',
	  	        contentType: 'application/json',  // JSON 형식으로 데이터 전송
	  	        data: JSON.stringify(paymentVO),  // 객체를 JSON 문자열로 변환
	  	        success: function(response) {
	  	            if(response === "success") {
	  	                
	  	           		// 상태 값에 맞는 텍스트 변경
	  	                var statusCell = $("td:contains('" + paymentNo + "')").siblings().eq(10);
	  	                if (paymentStatus === 'RW') {
	  	                    statusCell.text("환불대기");
	  	                } else if (paymentStatus === 'RC') {
	  	                    statusCell.text("환불완료").css("color", "blue");
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
	  	                <p>주문 상태 : \${response.ordered_status === 'CC' ? '취소 완료' : response.ordered_status === 'CW' ? '취소 대기' : ''}</p>
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