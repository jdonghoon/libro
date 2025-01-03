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
                                                <label for="validationCustom04">카테고리</label>
                                                <div class="col-md-4">
                                                    <select class="form-select" id="category_name" name="category_name">
                                                        <option value="" disabled selected>선택</option>
                                                        <option value="시">시</option>
                                                        <option value="소설">소설</option>
                                                        <option value="자기계발서">자기계발서</option>
                                                        <option value="만화">만화</option>
                                                        <option value="예술">예술</option>
                                                        <option value="자연/과학">자연/과학</option>
                                                        <option value="학습">학습</option>
                                                        <option value="기술/공학">기술/공학</option>
                                                        <option value="수험서">수험서</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="row g-2">
                                                <label for="validationCustom04">상세검색</label>
                                                <div class="col-md-4">
                                                    <select class="form-select" id="validationCustom04">
                                                        <option value="전체" selected>전체</option>
                                                        <option value="상품번호">상품번호</option>
                                                        <option value="상품명">상품명</option>
                                                        <option value="국제표준도서번호">국제표준도서번호</option>
                                                        <option value="재고">재고</option>
                                                    </select>
                                                </div>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" id="inputCity">
                                                </div>
                                            </div>

                                            <div class="row g-2">
                                                <label for="startDate" class="col-sm-2 col-form-label">상품 등록일</label>
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
                                                <label>진열상태</label>
                                                <div class="col">
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="product_status" id="inlineRadio1" value="all" checked>
                                                        <label class="form-check-label" for="inlineRadio1">전체</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="product_status" id="inlineRadio2" value="E">
                                                        <label class="form-check-label" for="inlineRadio2">진열</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="product_status" id="inlineRadio3" value="D">
                                                        <label class="form-check-label" for="inlineRadio3">미진열</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="product_status" id="inlineRadio4" value="S">
                                                        <label class="form-check-label" for="inlineRadio3">품절</label>
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
                                                <th>상품번호</th>
                                                <th>대표상품사진</th>
                                                <th>카테고리</th>
                                                <th>상품명</th>
                                                <th>출판사</th>
                                                <th>저자</th>
                                                <th>국제표준도서번호</th>
                                                <th>판매가</th>
                                                <th>재고</th>
                                                <th>진열상태</th>
                                                <th>등록일</th>
                                                <th>등록id</th>
                                                <th>수정일</th>
                                                <th>수정id</th>
                                                <th>수정</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach items="${list}" var="vo">
	                                            <tr id="product-${vo.product_no}"> <!-- 각 상품에 고유 id 부여 -->
	                                                <td onclick="window.open('${pageContext.request.contextPath}/product.do?product_no=${vo.product_no}', '_blank')">
													    <span style="color:green; cursor: pointer;">${vo.product_no}</span>
													</td>
													<td>
													    <c:if test="${not empty vo.attachment_detail_new_name}">
											        		<img src="<%=request.getContextPath()%>/upload/${vo.attachment_detail_new_name}" alt="대표 이미지" width="90" height="120" />
													    </c:if>
													</td>
													
	                                                <td>${vo.category_name}</td>
	                                                <td>${vo.product_name}</td>
	                                                <td>${vo.product_publisher}</td>
	                                                <td>${vo.product_author}</td>
	                                                <td>${vo.product_isbn}</td>
	                                                <td>${vo.product_price}원</td>
	                                                <td>${vo.product_stock}</td>
	                                                <td>
	                                                	<c:if test="${vo.product_status == 'E'}"><span style="color:blue;">진열</span></c:if>
														<c:if test="${vo.product_status == 'D'}">미진열</c:if>
														<c:if test="${vo.product_status == 'S'}"><span style="color:red;">품절</span></c:if>
	                                                </td>
	                                                <td>${vo.product_created_at}</td>
	                                                <td>${vo.product_create_id}</td>
	                                                <td>${vo.product_update_at}</td>
	                                                <td>${vo.product_update_id}</td>
	                                                <td>
	                                                    <button class="btn btn-primary" onclick="location.href='productModify.do?product_no=${vo.product_no}'">수정</button>
	                                                    <button class="btn btn-primary" onclick="deleteProduct('${vo.product_no}')">삭제</button>
	                                                </td>
	                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <!--begin::Pagination-->
                                    <div aria-label="Page navigation example">
									    <ul class="pagination justify-content-center">
									        <!-- Previous 버튼 -->
									        <c:if test="${paging.startPage > 1}">
									            <li class="page-item">
									                <a class="page-link" href="product.do?nowPage=${paging.startPage-1}" aria-label="Previous">
									                    <span aria-hidden="true">&laquo;</span>
									                </a>
									            </li>
									        </c:if>
									
									        <!-- 페이지 번호 -->
									        <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="cnt">
									            <li class="page-item <c:if test='${paging.nowPage eq cnt}'>active</c:if>">
									                <a class="page-link" href="product.do?nowPage=${cnt}">
									                    ${cnt}
									                </a>
									            </li>
									        </c:forEach>
									
									        <!-- Next 버튼 -->
									        <c:if test="${paging.endPage < paging.lastPage}">
									            <li class="page-item">
									                <a class="page-link" href="product.do?nowPage=${paging.endPage+1}" aria-label="Next">
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
	        function deleteProduct(productNo, productStatus) {
		  	    var productVO = {
		  	    		product_no: productNo,
	  	    		product_status: productStatus
		  	    };
	
		  	    $.ajax({
		  	        url: 'deleteProduct.do',
		  	        type: 'POST',
		  	        contentType: 'application/json',  // JSON 형식으로 데이터 전송
		  	        data: JSON.stringify(productVO),  // 객체를 JSON 문자열로 변환
		  	        success: function(response) {
		  	            if(response === "success") {
		  	            	 $('#product-' + productNo).remove();
		  	            } else {
		  	                alert("삭제 실패했습니다.");
		  	            }
		  	        },
		  	        error: function() {
		  	            alert("서버와의 통신에 실패했습니다.");
		  	        }
		  	    });
		  	}
	       
        </script>
        
				
<%@ include file="/WEB-INF/views/admin/include/footer.jsp" %>