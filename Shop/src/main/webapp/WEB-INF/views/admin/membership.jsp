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
                                                        <option value="아이디">아이디</option>
                                                        <option value="이름">이름</option>
                                                        <option value="전화번호">전화번호</option>
                                                        <option value="이메일">이메일</option>
                                                        <option value="기타사항">기타사항</option>
                                                    </select>
                                                </div>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" id="inputCity">
                                                </div>
                                            </div>

                                            <div class="row g-2">
                                                <label for="inputDate" class="col-sm-2 col-form-label">가입일</label>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                    <input type="date" class="form-control" id="inputDate">
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="row g-2">
                                                <label>회원상태</label>
                                                <div class="col">
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1" checked>
                                                        <label class="form-check-label" for="inlineRadio1">전체</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                                                        <label class="form-check-label" for="inlineRadio2">활성</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3">
                                                        <label class="form-check-label" for="inlineRadio3">비활성</label>
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
                                                <th>ID</th>
                                                <th>이름</th>
                                                <th>휴대폰번호</th>
                                                <th>이메일</th>
                                                <th>상태</th>
                                                <th>가입일</th>
                                                <th>수정일</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr onclick="location.href='membershipInfo.html';">
                                                <td>hong</td>
                                                <td>홍길동</td>
                                                <td>01000000000</td>
                                                <td>hong@ezen.com</td>
                                                <td>E</td>
                                                <td>2024-12-05</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>hong</td>
                                                <td>홍길동</td>
                                                <td>01000000000</td>
                                                <td>hong@ezen.com</td>
                                                <td>E</td>
                                                <td>2024-12-05</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>hong</td>
                                                <td>홍길동</td>
                                                <td>01000000000</td>
                                                <td>hong@ezen.com</td>
                                                <td>E</td>
                                                <td>2024-12-05</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>hong</td>
                                                <td>홍길동</td>
                                                <td>01000000000</td>
                                                <td>hong@ezen.com</td>
                                                <td>E</td>
                                                <td>2024-12-05</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>hong</td>
                                                <td>홍길동</td>
                                                <td>01000000000</td>
                                                <td>hong@ezen.com</td>
                                                <td>E</td>
                                                <td>2024-12-05</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>hong</td>
                                                <td>홍길동</td>
                                                <td>01000000000</td>
                                                <td>hong@ezen.com</td>
                                                <td>E</td>
                                                <td>2024-12-05</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>hong</td>
                                                <td>홍길동</td>
                                                <td>01000000000</td>
                                                <td>hong@ezen.com</td>
                                                <td>E</td>
                                                <td>2024-12-05</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>hong</td>
                                                <td>홍길동</td>
                                                <td>01000000000</td>
                                                <td>hong@ezen.com</td>
                                                <td>E</td>
                                                <td>2024-12-05</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>hong</td>
                                                <td>홍길동</td>
                                                <td>01000000000</td>
                                                <td>hong@ezen.com</td>
                                                <td>E</td>
                                                <td>2024-12-05</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>hong</td>
                                                <td>홍길동</td>
                                                <td>01000000000</td>
                                                <td>hong@ezen.com</td>
                                                <td>E</td>
                                                <td>2024-12-05</td>
                                                <td></td>
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