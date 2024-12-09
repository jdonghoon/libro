<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/include/header.jsp" %>
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
                                    <div class="card-title">총 매출 합계</div>
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
                                                            <span>000,000,000원</span>
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
                                                            <span>000,000,000원</span>
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
                                                            <span>000,000,000개</span>
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
                                                    <option value="반품사유">거래액</option>
                                                    <option value="결제일">결제금액</option>
                                                    <option value="환불상태">총합</option>
                                                    <option value="환불금액">판매수량</option>
                                                </select>
                                            </div>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" id="inputCity">
                                            </div>
                                        </div>

                                        <div class="row g-2">
                                            <label for="inputDate" class="col-sm-2 col-form-label">조회기간</label>
                                            <div class="row">
                                                <div class="col-md-6">
                                                <input type="date" class="form-control" id="inputDate">
                                                </div>
                                            </div>
                                        </div>
                                        
                                    </div>
                                </div>
                                <!--end::Body-->
                                <!--begin::Footer-->
                                <div class="card-footer">
                                    <button type="button" class="btn btn-primary">Search</button>
                                    <button type="button" class="btn float-end">Reset</button>
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
                                            <tr>
                                                <td></td>
                                                <td>소년이온다</td>
                                                <td>607,500원</td>
                                                <td>270,000원</td>
                                                <td>877,500원</td>
                                                <td>20</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td>소년이온다</td>
                                                <td>607,500원</td>
                                                <td>270,000원</td>
                                                <td>877,500원</td>
                                                <td>20</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td>소년이온다</td>
                                                <td>607,500원</td>
                                                <td>270,000원</td>
                                                <td>877,500원</td>
                                                <td>20</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td>소년이온다</td>
                                                <td>607,500원</td>
                                                <td>270,000원</td>
                                                <td>877,500원</td>
                                                <td>20</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td>소년이온다</td>
                                                <td>607,500원</td>
                                                <td>270,000원</td>
                                                <td>877,500원</td>
                                                <td>20</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td>소년이온다</td>
                                                <td>607,500원</td>
                                                <td>270,000원</td>
                                                <td>877,500원</td>
                                                <td>20</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td>소년이온다</td>
                                                <td>607,500원</td>
                                                <td>270,000원</td>
                                                <td>877,500원</td>
                                                <td>20</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td>소년이온다</td>
                                                <td>607,500원</td>
                                                <td>270,000원</td>
                                                <td>877,500원</td>
                                                <td>20</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td>소년이온다</td>
                                                <td>607,500원</td>
                                                <td>270,000원</td>
                                                <td>877,500원</td>
                                                <td>20</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td>소년이온다</td>
                                                <td>607,500원</td>
                                                <td>270,000원</td>
                                                <td>877,500원</td>
                                                <td>20</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <!--begin::Pagination-->
                                    <div aria-label="Page navigation example">
                                        <ul class="pagination">
                                            <li class="page-item"> <a class="page-link" href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span> </a> </li>
                                            <li class="page-item"> <a class="page-link" href="#">1</a> </li>
                                            <li class="page-item"> <a class="page-link" href="#">2</a> </li>
                                            <li class="page-item"> <a class="page-link" href="#">3</a> </li>
                                            <li class="page-item"> <a class="page-link" href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span> </a> </li>
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