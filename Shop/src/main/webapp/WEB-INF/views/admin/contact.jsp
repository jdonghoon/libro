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
                            <h3 class="mb-0">상품관리</h3>
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
                                    <div class="card-title">상품 정보 목록</div>
                                </div>
                                <!--end::Header-->
                                <!--begin::Form-->
                                <form>
                                    <!--begin::Body-->
                                    <div class="card-body">
                                        <div class="row g-3">
                                            
                                            <div class="row g-2">
                                                <label for="inputDate" class="col-sm-2 col-form-label">조회기간</label>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <select class="form-select" id="validationCustom04">
                                                            <option value="전체">전체</option>
                                                            <option value="결제일">등록일</option>
                                                            <option value="취소접수일">답변완료일</option>
                                                        </select>
                                                    </div>
                                                    <div class="col-md-6">
                                                    <input type="date" class="form-control" id="inputDate">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row g-2">
                                                <label for="validationCustom04">상세검색</label>
                                                <div class="col-md-4">
                                                    <select class="form-select" id="validationCustom04">
                                                        <option value="전체" selected>전체</option>
                                                        <option value="상품번호">이름</option>
                                                        <option value="상품명">이메일</option>
                                                        <option value="국제표준도서번호">문의제목</option>
                                                        <option value="재고">문의내용</option>
                                                        <option value="재고">문의답변내용</option>
                                                        <option value="재고">주문번호</option>
                                                    </select>
                                                </div>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" id="inputCity">
                                                </div>
                                            </div>

                                            <div class="row g-2">
                                                <label for="validationCustom04">문의유형</label>
                                                <div class="col-md-4">
                                                    <select class="form-select" id="validationCustom04">
                                                        <option value="전체" selected>전체</option>
                                                        <option value="상품번호">주문문의</option>
                                                        <option value="상품명">배송문의</option>
                                                        <option value="국제표준도서번호">기타문의</option>
                                                    </select>
                                                </div>
                                            </div>
                                            
                                            <div class="row g-2">
                                                <label>진열상태</label>
                                                <div class="col">
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1" checked>
                                                        <label class="form-check-label" for="inlineRadio1">전체</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                                                        <label class="form-check-label" for="inlineRadio2">미답변</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3">
                                                        <label class="form-check-label" for="inlineRadio3">답변완료</label>
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
                                                <th>답변여부</th>
                                                <th>문의유형</th>
                                                <th>등록일</th>
                                                <th>이름</th>
                                                <th>이메일</th>
                                                <th>문의제목</th>
                                                <th>문의내용</th>
                                                <th>첨부파일</th>
                                                <th>답변완료일</th>
                                                <th>문의답변내용</th>
                                                <th>주문번호</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>미답변</td>
                                                <td>배송문의</td>
                                                <td>2024-12-06</td>
                                                <td>홍길동</td>
                                                <td>ezen@ezen.com</td>
                                                <td>배송문의</td>
                                                <td>배송이 얼마나 걸리나요?</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td>16846598</td>
                                            </tr>
                                            <tr>
                                                <td>미답변</td>
                                                <td>배송문의</td>
                                                <td>2024-12-06</td>
                                                <td>홍길동</td>
                                                <td>ezen@ezen.com</td>
                                                <td>배송문의</td>
                                                <td>배송이 얼마나 걸리나요?</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td>16846598</td>
                                            </tr>
                                            <tr>
                                                <td>미답변</td>
                                                <td>배송문의</td>
                                                <td>2024-12-06</td>
                                                <td>홍길동</td>
                                                <td>ezen@ezen.com</td>
                                                <td>배송문의</td>
                                                <td>배송이 얼마나 걸리나요?</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td>16846598</td>
                                            </tr>
                                            <tr>
                                                <td>미답변</td>
                                                <td>배송문의</td>
                                                <td>2024-12-06</td>
                                                <td>홍길동</td>
                                                <td>ezen@ezen.com</td>
                                                <td>배송문의</td>
                                                <td>배송이 얼마나 걸리나요?</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td>16846598</td>
                                            </tr>
                                            <tr>
                                                <td>미답변</td>
                                                <td>배송문의</td>
                                                <td>2024-12-06</td>
                                                <td>홍길동</td>
                                                <td>ezen@ezen.com</td>
                                                <td>배송문의</td>
                                                <td>배송이 얼마나 걸리나요?</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td>16846598</td>
                                            </tr>
                                            <tr>
                                                <td>미답변</td>
                                                <td>배송문의</td>
                                                <td>2024-12-06</td>
                                                <td>홍길동</td>
                                                <td>ezen@ezen.com</td>
                                                <td>배송문의</td>
                                                <td>배송이 얼마나 걸리나요?</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td>16846598</td>
                                            </tr>
                                            <tr>
                                                <td>미답변</td>
                                                <td>배송문의</td>
                                                <td>2024-12-06</td>
                                                <td>홍길동</td>
                                                <td>ezen@ezen.com</td>
                                                <td>배송문의</td>
                                                <td>배송이 얼마나 걸리나요?</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td>16846598</td>
                                            </tr>
                                            <tr>
                                                <td>미답변</td>
                                                <td>배송문의</td>
                                                <td>2024-12-06</td>
                                                <td>홍길동</td>
                                                <td>ezen@ezen.com</td>
                                                <td>배송문의</td>
                                                <td>배송이 얼마나 걸리나요?</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td>16846598</td>
                                            </tr>
                                            <tr>
                                                <td>미답변</td>
                                                <td>배송문의</td>
                                                <td>2024-12-06</td>
                                                <td>홍길동</td>
                                                <td>ezen@ezen.com</td>
                                                <td>배송문의</td>
                                                <td>배송이 얼마나 걸리나요?</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td>16846598</td>
                                            </tr>
                                            <tr>
                                                <td>미답변</td>
                                                <td>배송문의</td>
                                                <td>2024-12-06</td>
                                                <td>홍길동</td>
                                                <td>ezen@ezen.com</td>
                                                <td>배송문의</td>
                                                <td>배송이 얼마나 걸리나요?</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td>16846598</td>
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