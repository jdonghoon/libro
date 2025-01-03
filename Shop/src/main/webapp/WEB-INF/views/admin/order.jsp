<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

        <main class="app-main">
            <!--begin::App Content Header-->
            <div class="app-content-header">
                <!--begin::Container-->
                <div class="container-fluid">
                    <!--begin::Row-->
                    <div class="row">
                        <div class="col-sm-6">
                            <h3 class="mb-0">주문관리</h3>
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
                                    <div class="card-title">주문 정보 목록</div>
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
                                                        <option value="주문번호">주문번호</option>
                                                        <option value="상품번호">상품번호</option>
                                                        <option value="상품명">상품명</option>
                                                        <option value="상품가격">상품가격</option>
                                                        <option value="수량">수량</option>
                                                        <option value="주문자명">주문자명</option>
                                                    </select>
                                                </div>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" id="inputCity">
                                                </div>
                                            </div>

                                            <div class="row g-2">
                                                <label for="inputDate" class="col-sm-2 col-form-label">주문일자</label>
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
                                                <label for="validationCustom04">주문상태</label>
                                                <div class="col-md-4">
                                                    <select class="form-select" id="validationCustom04">
                                                        <option value="전체" selected>전체</option>
                                                        <option value="주문완료">주문완료</option>
                                                        <option value="결제완료">결제완료</option>
                                                        <option value="발송완료">발송완료</option>
                                                    </select>
                                                </div>
                                            </div>
                                            
                                        </div>
                                    </div>
                                    <!--end::Body-->
                                    <!--begin::Footer-->
                                    <div class="card-footer">
                                        <button type="button" class="btn btn-primary">검색</button>
                                        <button type="button" class="btn float-end">취소</button>
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
                                                <th>상품주문번호</th>
                                                <th>주문번호</th>
                                                <th>상품번호</th>
                                                <th>상품명</th>
                                                <th>주문상태</th>
                                                <th>주문일자</th>
                                                <th>상품가격</th>
                                                <th>배송비</th>
                                                <th>결제상태</th>
                                                <th>결제금액</th>
                                                <th>수량</th>
                                                <th>주문자명</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach items="${orderList}" var="vo">
	                                        	<tr>
		                                           	<td>
		                                           		<!-- 클릭 시 ordered_status 타입이 D로 변경-->
		                                           		<%-- <c:if test="${ordered_status == 'O'}"> --%>
		                                           			<button class="btn btn-primary" onclick="changeStatus('${vo.ordered_no}', 'D')">발송완료</button>
		                                           		<%-- </c:if> --%>
												    </td>
	                                                <td onclick="showOrderDetails('${vo.ordered_detail_no}')"><span style="color:green; cursor: pointer;">${vo.ordered_detail_no}</span></td>
	                                                <td>${vo.ordered_no}</td>
	                                                <td>${vo.product_no}</td>
	                                                <td>${vo.product_name}</td>
	                                                <td>
	                                                	<c:if test="${vo.ordered_status == 'O'}">주문완료</c:if>
	                                                	<c:if test="${vo.ordered_status == 'D'}"><span style="color:blue;">발송완료</span></c:if>
	                                                </td>
	                                                <td>${vo.ordered_create_at}</td>
	                                                <td>
	                                                	<c:choose>
													        <c:when test="${empty vo.product_price}">
													            0원
													        </c:when>
													        <c:otherwise>
													            ${vo.product_price}원
													        </c:otherwise>
													    </c:choose>
	                                                </td>
	                                                <td>
	                                                	<c:choose>
													        <c:when test="${empty vo.ordered_delivery_fee}">
													            0원
													        </c:when>
													        <c:otherwise>
													            ${vo.ordered_delivery_fee}원
													        </c:otherwise>
													    </c:choose>
	                                                </td>
	                                                <td>
	                                                	<c:if test="${vo.payment_type == 'PC'}">결제완료</c:if>
	                                                </td>
                                 	                <td>
                                 	                	<c:choose>
													        <c:when test="${empty vo.payment_price}">
													            0원
													        </c:when>
													        <c:otherwise>
													            ${vo.payment_price}원
													        </c:otherwise>
													    </c:choose>
                                 	                </td>
	                                                <td>${vo.ordered_detail_quantity}</td>
	                                                <td>${vo.ordered_name}</td>
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
									                <a class="page-link" href="order.do?nowPage=${paging.startPage-1}" aria-label="Previous">
									                    <span aria-hidden="true">&laquo;</span>
									                </a>
									            </li>
									        </c:if>
									
									        <!-- 페이지 번호 -->
									        <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="cnt">
									            <li class="page-item <c:if test='${paging.nowPage eq cnt}'>active</c:if>">
									                <a class="page-link" href="order.do?nowPage=${cnt}">
									                    ${cnt}
									                </a>
									            </li>
									        </c:forEach>
									
									        <!-- Next 버튼 -->
									        <c:if test="${paging.endPage < paging.lastPage}">
									            <li class="page-item">
									                <a class="page-link" href="order.do?nowPage=${paging.endPage+1}" aria-label="Next">
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
		  	                var statusCell = $("td:contains('" + orderedNo + "')").siblings().eq(5); // 5번째 <td>는 주문 상태
		  	                if (orderedStatus === 'O') {
		  	                    statusCell.text("주문완료");
		  	                } else if (orderedStatus === 'D') {
		  	                    statusCell.text("발송완료").css("color", "blue");
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
		  	                <p>주문 상태 : \${response.ordered_status === 'O' ? '주문 완료' : response.ordered_status === 'D' ? '발송 완료' : ''}</p>
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