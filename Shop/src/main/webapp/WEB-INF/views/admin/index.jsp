<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

				<main class="app-main"> 
					<div class="app-content-header"> 
						<div class="container-fluid"> 
							<h3 class="mb-0">Dashboard</h3>
						</div> 
				 	</div> 
				    <div class="app-content"> 
				        <div class="container-fluid"> 
				            <div class="row"> 
				                <div class="col-lg-3 col-6"> 
				                    <div class="small-box text-bg-primary" >
				                        <div class="inner">
				                            <h3>
				                                <img width="48" height="48" src="https://img.icons8.com/color-glass/48/paper-bag.png" alt="paper-bag"/>
				                                                        주문 관리
				                            </h3>
				                            <div>
				                                <span>결제 완료</span>
				                                <span>${orderCount.pc_cnt}건</span>
				                            </div>
				                            <div>
				                                <span>상품 준비</span>
				                                <span>${orderCount.o_cnt}건</span>
				                            </div>
				                            <div>
				                                <span>발송 완료</span>
				                                <span>${orderCount.d_cnt}건</span>
				                            </div>
				                        </div>
				                    </div> <!--end::Small Box Widget 1-->
				                </div> <!--end::Col-->
				                <div class="col-lg-3 col-6"> <!--begin::Small Box Widget 2-->
				                    <div class="small-box text-bg-danger">
				                        <div class="inner">
				                            <h3>
				                                <img width="52" height="52" src="https://img.icons8.com/papercut/60/money.png" alt="money"/>
				                                                        취소 관리
				                            </h3>
				                            <div>
				                                <span>취소 요청</span>
				                                <span>${cancelCount.cw_cnt}건</span>
				                            </div>
				                            <div>
				                                <span>취소 완료</span>
				                                <span>${cancelCount.cc_cnt}건</span>
				                            </div>
				                            <div>
				                                <span>환불 요청</span>
				                                <span>${cancelCount.rw_cnt}건</span>
				                            </div>
				                            <div>
				                                <span>환불 완료</span>
				                                <span>${cancelCount.rc_cnt}건</span>
				                            </div>
				                        </div>
				                    </div> <!--end::Small Box Widget 2-->
				                </div> <!--end::Col-->
				                <div class="col-lg-3 col-6"> <!--begin::Small Box Widget 3-->
				                    <div class="small-box text-bg-success">
				                        <div class="inner">
				                            <h3>
				                                <img width="50" height="50" src="https://img.icons8.com/deco-color/48/commercial.png" alt="commercial"/>
				                                                        리뷰/문의 관리
				                            </h3>
				                            <div>
				                                <span>새 리뷰</span>
				                                <span>${contentCount.review_cnt}건</span>
				                            </div>
				                            <div>
				                                <span>주문 문의</span>
				                                <span>${contentCount.contactO_cnt}건</span>
				                            </div>
				                            <div>
				                                <span>상품 문의</span>
				                                <span>${contentCount.contactP_cnt}건</span>
				                            </div>
				                            <div>
				                                <span>기타 문의</span>
				                                <span>${contentCount.contactM_cnt}건</span>
				                            </div>
				                        </div>
				                    </div> 
				                </div> 
				            </div> 
				            <div class="row"> 
				                <div class="col-lg-7 connectedSortable">
				                    <div class="card mb-4">
				                        <div class="card-header">
				                            <h3 class="card-title">매출 통계</h3>
				                            <!-- <input type="date" name="startDate">
                                    			- <input type="date" name="endDate">
                                    			<button type="button" class="btn btn-primary mb-2">Search</button>
			                                    <table border="1">
			                                        <tr>
			                                            <th rowspan="2">00월 매출</th>
			                                            <th>총 주문 액</th>
			                                            <th>총 주문 수</th>
			                                        </tr>
			                                        <tr>
			                                            <td>000,000,000원</td>
			                                            <td>000건</td>
			                                        </tr>
			                                    </table> -->
				                        </div>
				                        <div class="card-body">
				                            <div id="revenue-chart"></div>
				                        </div>
				                    </div> 
				                </div>
				        </div>
					</div>
				</main>
				
<%@ include file="/WEB-INF/views/admin/include/footer.jsp" %>
