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
	                                                	<c:if test="${vo.ordered_status == 'CC'}">취소완료</c:if>
	                                                </td>
	                                                <td>${vo.ordered_detail_no}</td>
	                                                <td>${vo.ordered_no}</td>
	                                                <td>${vo.product_name}</td>
	                                                <td>${vo.ordered_cancel_reason}</td>
	                                                <td>${vo.payment_date}</td>
	                                                <td>${vo.payment_method}</td>
	                                                <td>${vo.payment_price}</td>
	                                                <td>
	                                                	<c:if test="${vo.payment_type == 'RW'}">횐불대기</c:if>
	                                                	<c:if test="${vo.payment_type == 'RC'}">횐불완료</c:if>
	                                                </td>
	                                                <td>${vo.payment_refund_price}</td>
	                                                <td>${vo.payment_refund_date}</td>
	                                                <td>${vo.ordered_detail_quantity}</td>
	                                                <td>${vo.ordered_name}</td>
	                                                <td>${vo.ordered_phone}</td>
	                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
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
	  	                alert("상태가 성공적으로 변경되었습니다.");
	  	                
	  	           		// 상태 값에 맞는 텍스트 변경
	  	                var statusCell = $("td:contains('" + orderedNo + "')").siblings().eq(2);
	  	                if (orderedStatus === 'CW') {
	  	                    statusCell.text("취소대기");
	  	                } else if (orderedStatus === 'CC') {
	  	                    statusCell.text("취소완료");
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
	  	                alert("상태가 성공적으로 변경되었습니다.");
	  	                
	  	           		// 상태 값에 맞는 텍스트 변경
	  	                var statusCell = $("td:contains('" + paymentNo + "')").siblings().eq(10);
	  	                if (paymentStatus === 'RW') {
	  	                    statusCell.text("환불대기");
	  	                } else if (paymentStatus === 'RC') {
	  	                    statusCell.text("환불완료");
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
		</script>
        
        
<%@ include file="/WEB-INF/views/admin/include/footer.jsp" %>