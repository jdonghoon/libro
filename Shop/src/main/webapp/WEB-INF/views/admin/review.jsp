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
                            <h3 class="mb-0">리뷰관리</h3>
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
                                    <div class="card-title">리뷰 목록</div>
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
                                                        <option value="상품번호">상품번호</option>
                                                        <option value="상품명">상품명</option>
                                                        <option value="상품가격">별점</option>
                                                        <option value="수량">내용</option>
                                                        <option value="주문자명">작성자/ID</option>
                                                    </select>
                                                </div>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" id="inputCity">
                                                </div>
                                            </div>

                                            <div class="row g-2">
                                                <label for="startDate" class="col-sm-2 col-form-label">리뷰 작성일</label>
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
                                                <label>공개여부</label>
                                                <div class="col">
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="status" id="inlineRadio1" value="all" checked>
                                                        <label class="form-check-label" for="inlineRadio1">전체</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="status" id="inlineRadio2" value="E">
                                                        <label class="form-check-label" for="inlineRadio2">공개</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="status" id="inlineRadio3" value="D">
                                                        <label class="form-check-label" for="inlineRadio3">비공개</label>
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
                                            	<th rowspan='2'>btn</th>
                                                <th colspan='2'>상품정보</th>
                                                <th colspan='7'>리뷰정보</th>
                                                <th>주문정보</th>
                                            </tr>
                                            <tr>
                                                <th>상품번호</th>
                                                <th>상품명</th>
                                                <th>별점</th>
                                                <th>사진</th>
                                                <th>내용</th>
                                                <th>작성일</th>
                                                <th>수정일</th>
                                                <th>ID</th>
                                                <th>공개여부</th>
                                                <th>상품주문번호</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach items="${reviewList}" var="vo">
	                                            <tr>
	                                            	<td>
	                                            		<button class="btn btn-primary" onclick="changeStatus('${vo.review_no}', 'E')">공개</button>
	                                            		<button class="btn btn-primary" onclick="changeStatus('${vo.review_no}', 'D')">비공개</button>
	                                            	</td>
	                                                <td onclick="location.href='user/menu/product.do?product_no=${vo.product_no}'">${vo.product_no}</td>
	                                                <td>${vo.product_name}</td>
	                                                <td>${vo.review_starrating}</td>
	                                                <td>
	                                                	<c:if test="${not empty vo.attachment_detail_new_name}">
	                                                		<img src="<%=request.getContextPath()%>/upload/${vo.attachment_detail_new_name}" width="100" height="130">
	                                                	</c:if>
	                                                </td>
	                                                <td>
	                                                    ${vo.review_content}
	                                                </td>
	                                                <td>${vo.review_create_at}</td>
	                                                <td>${vo.review_update_at}</td>
	                                                <td>${vo.user_id}</td>
	                                                <td>
	                                                	<c:if test="${vo.review_status == 'E'}"><span style="color:blue;">공개</span></c:if>
	                                                	<c:if test="${vo.review_status == 'D'}"><span style="color:red;">비공개</span></c:if>
	                                                </td>
	                                                <td onclick="location.href='#';">${vo.ordered_detail_no}</td>
	                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <!--begin::Pagination-->
                                    <div aria-label="Page navigation example">
                                        <ul class="pagination">
                                            <li class="page-item">
                                             	<c:if test="${paging.startPage > 1 }">
	                                            	<a class="page-link" href="review.do?nowPage=${paging.startPage-1}" aria-label="Previous">
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
                                            			<a class="page-link" href="review.do?nowPage=${cnt}">${cnt}</a>
													</c:if>
												</c:forEach>
                                           	</li>
                                            <li class="page-item">
                                            	<c:if test="${paging.endPage < paging.lastPage }">
		                                            <a class="page-link" href="review.do?nowPage=${paging.endPage+1}" aria-label="Next">
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
	        function changeStatus(reviewNo, reviewStatus) {
		  	    var reviewVO = {
		  	      review_no: reviewNo,
		  	      review_status: reviewStatus
		  	    };
	
		  	    $.ajax({
		  	        url: 'reviewStatus.do',
		  	        type: 'POST',
		  	        contentType: 'application/json',  // JSON 형식으로 데이터 전송
		  	        data: JSON.stringify(reviewVO),  // 객체를 JSON 문자열로 변환
		  	        success: function(response) {
		  	            if(response === "success") {
		  	                
		  	           		// 상태 값에 맞는 텍스트 변경
		  	                var statusCell = $("td:contains('" + reviewNo + "')").siblings().eq(9);
		  	                if (reviewStatus === 'E') {
		  	                    statusCell.text("공개").css("color", "blue");
		  	                } else if (reviewStatus === 'D') {
		  	                    statusCell.text("비공개").css("color", "red");
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