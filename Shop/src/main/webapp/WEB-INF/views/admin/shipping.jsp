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
                            <h3 class="mb-0">배송관리</h3>
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
                                    <div class="card-title">배송 정보 목록</div>
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
                                                        <option value="배송 준비 중">배송 준비 중</option>
                                                        <option value="배송 중">배송 중</option>
                                                        <option value="배송완료">배송완료</option>
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
                                                        <option value="수량">수량</option>
                                                        <option value="결제일">결제일</option>
                                                        <option value="택배사">택배사</option>
                                                        <option value="송장번호">송장번호</option>
                                                        <option value="주문자명">주문자명</option>
                                                        <option value="주문자 연락처">주문자 연락처</option>
                                                        <option value="수령인 연락처">수령인 연락처</option>
                                                        <option value="배송지">배송지</option>
                                                    </select>
                                                </div>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" id="inputCity">
                                                </div>
                                            </div>

                                            <div class="row g-2">
                                                <label for="inputDate" class="col-sm-2 col-form-label">조회기간</label>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <select class="form-select" id="validationCustom04">
                                                            <option value="배송상태">전체</option>
                                                            <option value="결제일">결제일</option>
                                                            <option value="배송예정일">배송예정일</option>
                                                            <option value="배송완료일">배송완료일</option>
                                                        </select>
                                                    </div>
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
                                </form>
                                <!--end::Form-->
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
                                    <div class="card-title">배송 정보 목록</div>
                                </div>
                                <!--end::Header-->
                                <!--begin::Form-->
                                <form>
                                    <!--begin::Body-->
                                    <div class="card-body">
                                        <div class="row g-3">

                                            <div class="row g-2">
                                                <label for="validationCustom04">주문관리</label>
                                                <div class="btn-group mb-2" role="group" aria-label="Basic radio toggle button group"> 
                                                    <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked> 
                                                    <label class="btn btn-outline-primary" for="btnradio1">배송 준비 중</label> 
                                                    <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off"> 
                                                    <label class="btn btn-outline-primary" for="btnradio2">배송 중</label> 
                                                    <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off"> 
                                                    <label class="btn btn-outline-primary" for="btnradio3">배송완료</label> 
                                                </div>
                                            </div>

                                            <div class="row g-2">
                                                <label for="validationCustom04">송장정보</label>
                                                <div class="col-md-4">
                                                    <select class="form-select" id="validationCustom04">
                                                        <option value="cj택배사" selected>cj택배사</option>
                                                    </select>
                                                </div>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" id="inputCity">
                                                </div>
                                            </div>
                                            
                                        </div>
                                    </div>
                                    <!--end::Body-->
                                    <!--begin::Footer-->
                                    <div class="card-footer">
                                        <button type="button" class="btn btn-primary">적용</button>
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
                                                <th>
                                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                                </th>
                                                <th>상품주문번호</th>
                                                <th>주문번호</th>
                                                <th>상품명</th>
                                                <th>주문상태</th>
                                                <th>수량</th>
                                                <th>결제일</th>
                                                <th>택배사</th>
                                                <th>송장번호</th>
                                                <th>주문자명</th>
                                                <th>주문자 연락처</th>
                                                <th>수령인명</th>
                                                <th>수령인 연락처</th>
                                                <th>배송지</th>
                                                <th>배송상태</th>
                                                <th>배송예정일</th>
                                                <th>배송완료일</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                                </td>
                                                <td onclick="location.href='#';">465128315</td>
                                                <td>651321431</td>
                                                <td>소년이온다</td>
                                                <td>결제완료</td>
                                                <td>1</td>
                                                <td>2024-12-03</td>
                                                <td>cj택배사</td>
                                                <td>5898551</td>
                                                <td>홍길동</td>
                                                <td>01000000000</td>
                                                <td>홍길동</td>
                                                <td>01000000000</td>
                                                <td>전주시 덕진구</td>
                                                <td>배송 준비 중</td>
                                                <td>2024-12-06</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                                </td>
                                                <td onclick="location.href='#';">465128315</td>
                                                <td>651321431</td>
                                                <td>소년이온다</td>
                                                <td>결제완료</td>
                                                <td>1</td>
                                                <td>2024-12-03</td>
                                                <td>cj택배사</td>
                                                <td>5898551</td>
                                                <td>홍길동</td>
                                                <td>01000000000</td>
                                                <td>홍길동</td>
                                                <td>01000000000</td>
                                                <td>전주시 덕진구</td>
                                                <td>배송 준비 중</td>
                                                <td>2024-12-06</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                                </td>
                                                <td onclick="location.href='#';">465128315</td>
                                                <td>651321431</td>
                                                <td>소년이온다</td>
                                                <td>결제완료</td>
                                                <td>1</td>
                                                <td>2024-12-03</td>
                                                <td>cj택배사</td>
                                                <td>5898551</td>
                                                <td>홍길동</td>
                                                <td>01000000000</td>
                                                <td>홍길동</td>
                                                <td>01000000000</td>
                                                <td>전주시 덕진구</td>
                                                <td>배송 준비 중</td>
                                                <td>2024-12-06</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                                </td>
                                                <td onclick="location.href='#';">465128315</td>
                                                <td>651321431</td>
                                                <td>소년이온다</td>
                                                <td>결제완료</td>
                                                <td>1</td>
                                                <td>2024-12-03</td>
                                                <td>cj택배사</td>
                                                <td>5898551</td>
                                                <td>홍길동</td>
                                                <td>01000000000</td>
                                                <td>홍길동</td>
                                                <td>01000000000</td>
                                                <td>전주시 덕진구</td>
                                                <td>배송 준비 중</td>
                                                <td>2024-12-06</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                                </td>
                                                <td onclick="location.href='#';">465128315</td>
                                                <td>651321431</td>
                                                <td>소년이온다</td>
                                                <td>결제완료</td>
                                                <td>1</td>
                                                <td>2024-12-03</td>
                                                <td>cj택배사</td>
                                                <td>5898551</td>
                                                <td>홍길동</td>
                                                <td>01000000000</td>
                                                <td>홍길동</td>
                                                <td>01000000000</td>
                                                <td>전주시 덕진구</td>
                                                <td>배송 준비 중</td>
                                                <td>2024-12-06</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                                </td>
                                                <td onclick="location.href='#';">465128315</td>
                                                <td>651321431</td>
                                                <td>소년이온다</td>
                                                <td>결제완료</td>
                                                <td>1</td>
                                                <td>2024-12-03</td>
                                                <td>cj택배사</td>
                                                <td>5898551</td>
                                                <td>홍길동</td>
                                                <td>01000000000</td>
                                                <td>홍길동</td>
                                                <td>01000000000</td>
                                                <td>전주시 덕진구</td>
                                                <td>배송 준비 중</td>
                                                <td>2024-12-06</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                                </td>
                                                <td onclick="location.href='#';">465128315</td>
                                                <td>651321431</td>
                                                <td>소년이온다</td>
                                                <td>결제완료</td>
                                                <td>1</td>
                                                <td>2024-12-03</td>
                                                <td>cj택배사</td>
                                                <td>5898551</td>
                                                <td>홍길동</td>
                                                <td>01000000000</td>
                                                <td>홍길동</td>
                                                <td>01000000000</td>
                                                <td>전주시 덕진구</td>
                                                <td>배송 준비 중</td>
                                                <td>2024-12-06</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                                </td>
                                                <td onclick="location.href='#';">465128315</td>
                                                <td>651321431</td>
                                                <td>소년이온다</td>
                                                <td>결제완료</td>
                                                <td>1</td>
                                                <td>2024-12-03</td>
                                                <td>cj택배사</td>
                                                <td>5898551</td>
                                                <td>홍길동</td>
                                                <td>01000000000</td>
                                                <td>홍길동</td>
                                                <td>01000000000</td>
                                                <td>전주시 덕진구</td>
                                                <td>배송 준비 중</td>
                                                <td>2024-12-06</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                                </td>
                                                <td onclick="location.href='#';">465128315</td>
                                                <td>651321431</td>
                                                <td>소년이온다</td>
                                                <td>결제완료</td>
                                                <td>1</td>
                                                <td>2024-12-03</td>
                                                <td>cj택배사</td>
                                                <td>5898551</td>
                                                <td>홍길동</td>
                                                <td>01000000000</td>
                                                <td>홍길동</td>
                                                <td>01000000000</td>
                                                <td>전주시 덕진구</td>
                                                <td>배송 준비 중</td>
                                                <td>2024-12-06</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                                </td>
                                                <td onclick="location.href='#';">465128315</td>
                                                <td>651321431</td>
                                                <td>소년이온다</td>
                                                <td>결제완료</td>
                                                <td>1</td>
                                                <td>2024-12-03</td>
                                                <td>cj택배사</td>
                                                <td>5898551</td>
                                                <td>홍길동</td>
                                                <td>01000000000</td>
                                                <td>홍길동</td>
                                                <td>01000000000</td>
                                                <td>전주시 덕진구</td>
                                                <td>배송 준비 중</td>
                                                <td>2024-12-06</td>
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