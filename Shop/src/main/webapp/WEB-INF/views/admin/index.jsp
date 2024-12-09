<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/include/header.jsp" %>

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
				                    <div class="small-box text-bg-primary">
				                        <div class="inner">
				                            <h3>
				                                <img width="48" height="48" src="https://img.icons8.com/color-glass/48/paper-bag.png" alt="paper-bag"/>
				                                주문 관리
				                            </h3>
				                            <div>
				                                <span>결제완료</span>
				                                <span>0건</span>
				                            </div>
				                            <div>
				                                <span>상품준비</span>
				                                <span>0건</span>
				                            </div>
				                            <div>
				                                <span>배송 중</span>
				                                <span>0건</span>
				                            </div>
				                            <div>
				                                <span>배송완료</span>
				                                <span>0건</span>
				                            </div>
				                        </div>
				                        <a href="#" class="small-box-footer link-light link-underline-opacity-0 link-underline-opacity-50-hover">
				                            More info <i class="bi bi-link-45deg"></i> </a>
				                    </div> <!--end::Small Box Widget 1-->
				                </div> <!--end::Col-->
				                <div class="col-lg-3 col-6"> <!--begin::Small Box Widget 2-->
				                    <div class="small-box text-bg-danger">
				                        <div class="inner">
				                            <h3>
				                                <img width="65" height="65" src="https://img.icons8.com/papercut/60/money.png" alt="money"/>
				                                취소/반품 관리
				                            </h3>
				                            <div>
				                                <span>취소요청</span>
				                                <span>0건</span>
				                            </div>
				                            <div>
				                                <span>반품요청</span>
				                                <span>0건</span>
				                            </div>
				                            <div>
				                                <span>환불요청</span>
				                                <span>0건</span>
				                            </div>
				                        </div>
				                        <a href="#" class="small-box-footer link-light link-underline-opacity-0 link-underline-opacity-50-hover">
				                            More info <i class="bi bi-link-45deg"></i> </a>
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
				                                <span>0건</span>
				                            </div>
				                            <div>
				                                <span>상품문의</span>
				                                <span>0건</span>
				                            </div>
				                            <div>
				                                <span>배송문의</span>
				                                <span>0건</span>
				                            </div>
				                            <div>
				                                <span>주문 문의</span>
				                                <span>0건</span>
				                            </div>
				                            <div>
				                                <span>기타문의</span>
				                                <span>0건</span>
				                            </div>
				                        </div>
				                        <a href="#" class="small-box-footer link-light link-underline-opacity-0 link-underline-opacity-50-hover">
				                            More info <i class="bi bi-link-45deg"></i> </a>
				                    </div> 
				                </div> 
				            </div> 
				            <div class="row"> 
				                <div class="col-lg-7 connectedSortable">
				                    <div class="card mb-4">
				                        <div class="card-header">
				                            <h3 class="card-title">매출통계</h3>
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
