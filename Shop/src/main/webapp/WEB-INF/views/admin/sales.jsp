<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"  %>

        <main class="app-main">
            <!--begin::App Content Header-->
            <div class="app-content-header">
                <!--begin::Container-->
                <div class="container-fluid">
                    <!--begin::Row-->
                    <div class="row">
                        <div class="col-sm-6">
                            <h3 class="mb-0">매출관리</h3>
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
                                    <div class="card-title">이번 달 매출 합계</div>
                                </div>
                                <!--end::Header-->

                                    <!--begin::Body-->
                                    <div class="card-body">
                                        <div class="row g-3">

                                            <div class="col-lg-3 col-6"> 
                                                <!--begin::Small Box Widget 1-->
                                                <div class="small-box text-bg-primary">
                                                    <div class="inner">
                                                        <h3>총 거래금액</h3>
                                                        <div>
                                                            <p>
															    <c:choose>
															        <c:when test="${empty orderTotalAmount.orderTotalAmount}">
															            0원
															        </c:when>
															        <c:otherwise>
															            ${orderTotalAmount.orderTotalAmount}원
															        </c:otherwise>
															    </c:choose>
															</p>
                                                        </div>
                                                    </div>    
                                                </div> <!--end::Small Box Widget 1-->
                                            </div> <!--end::Col-->
                                            
                                            <div class="col-lg-3 col-6"> 
                                                <!--begin::Small Box Widget 1-->
                                                <div class="small-box text-bg-primary">
                                                    <div class="inner">
                                                        <h3>총 결제금액</h3>
                                                        <div>
                                                            <p>
															    <c:choose>
															        <c:when test="${empty paymentTotalAmount.paymentTotalAmount}">
															            0원
															        </c:when>
															        <c:otherwise>
															            ${paymentTotalAmount.paymentTotalAmount}원
															        </c:otherwise>
															    </c:choose>
															</p>
                                                        </div>
                                                    </div>    
                                                </div> <!--end::Small Box Widget 1-->
                                            </div> <!--end::Col-->
                                            
                                            <div class="col-lg-3 col-6"> 
                                                <!--begin::Small Box Widget 1-->
                                                <div class="small-box text-bg-primary">
                                                    <div class="inner">
                                                        <h3>판매수량</h3>
                                                        <div>
                                                            <p>
															    <c:choose>
															        <c:when test="${empty orderTotalQuantity.orderTotalQuantity}">
															            0원
															        </c:when>
															        <c:otherwise>
															            ${orderTotalQuantity.orderTotalQuantity}원
															        </c:otherwise>
															    </c:choose>
															</p>
                                                        </div>
                                                    </div>    
                                                </div> <!--end::Small Box Widget 1-->
                                            </div> <!--end::Col-->


                                        </div>
                                    </div>   
                            </div>
                            <!--end::Quick Example-->
                        </div>
                    </div> <!--end::Row-->
                </div> <!--end::Container-->
            </div> <!--end::App Content-->

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
                                    <div class="card-title">상품별 매출 통계 목록</div>
                                </div>
                                <!--end::Header-->
                                <!--begin::Body-->
                                <div class="card-body">
                                    <div class="row g-3">

                                        <div class="row g-2">
                                            <label for="validationCustom04">상세검색</label>
                                            <div class="col-md-4">
                                                <select class="form-select" id="validationCustom04">
                                                    <option value="전체" selected>전체</option>
                                                    <option value="상품명">상품명</option>
                                                    <option value="거래액">거래액</option>
                                                    <option value="결제금액">결제금액</option>
                                                    <option value="총합">총합</option>
                                                    <option value="판매수량">판매수량</option>
                                                </select>
                                            </div>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" id="inputCity">
                                            </div>
                                        </div>

                                        <div class="row g-2">
                                            <label for="inputDate" class="col-sm-2 col-form-label">조회기간</label>
                                            <div class="row">
                                                	<div class="col-md-5">
                                                   		<input type="date" class="form-control" id="startDate" name="startDate">
                                                	</div>
                                                   	<div class="col-md-5">
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
                                    <button type="button" class="btn float-end">취소</button>
                                </div> <!--end::Footer-->
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
                                                <th>대표상품사진</th>
                                                <th>상품명</th>
                                                <th>거래액</th>
                                                <th>결제금액</th>
                                                <th>총합</th>
                                                <th>판매수량</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach items="${salesList}" var="vo">
	                                            <tr>
	                                                <td onclick="window.open('${pageContext.request.contextPath}/product.do?product_no=${vo.product_no}', '_blank')" style="cursor: pointer;">
	                                                	<c:if test="${not empty vo.attachment_detail_new_name}">
	                                                		<img src="<%=request.getContextPath()%>/upload/${vo.attachment_detail_new_name}" width="100" height="130">
	                                                	</c:if>
	                                                </td>
	                                                <td>${vo.product_name}</td>
	                                                <td>
									                    <c:choose>
									                        <c:when test="${empty vo.total_transaction_amount}">
									                            0원
									                        </c:when>
									                        <c:otherwise>
									                            ${vo.total_transaction_amount}원
									                        </c:otherwise>
									                    </c:choose>
									                </td>
	                                                <td>
									                    <c:choose>
									                        <c:when test="${empty vo.total_payment_amount}">
									                            0원
									                        </c:when>
									                        <c:otherwise>
									                            ${vo.total_payment_amount}원
									                        </c:otherwise>
									                    </c:choose>
									                </td>
	                                                <td>
									                    <c:choose>
									                        <c:when test="${empty vo.total_payment_amount}">
									                            0원
									                        </c:when>
									                        <c:otherwise>
									                            ${vo.total_payment_amount}원
									                        </c:otherwise>
									                    </c:choose>
									                </td>
	                                                <td>
								                    <c:choose>
								                        <c:when test="${empty vo.total_sales_quantity}">
								                            0
								                        </c:when>
								                        <c:otherwise>
								                            ${vo.total_sales_quantity}
								                        </c:otherwise>
								                    </c:choose>
								                </td>
	                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <!--begin::Pagination-->
                                    <div aria-label="Page navigation example">
                                        <ul class="pagination">
                                            <li class="page-item">
                                             	<c:if test="${paging.startPage > 1 }">
	                                            	<a class="page-link" href="sales.do?nowPage=${paging.startPage-1}" aria-label="Previous">
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
                                            			<a class="page-link" href="sales.do?nowPage=${cnt}">${cnt}</a>
													</c:if>
												</c:forEach>
                                           	</li>
                                            <li class="page-item">
                                            	<c:if test="${paging.endPage < paging.lastPage }">
		                                            <a class="page-link" href="sales.do?nowPage=${paging.endPage+1}" aria-label="Next">
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
				
<%@ include file="/WEB-INF/views/admin/include/footer.jsp" %>