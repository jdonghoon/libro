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
                            <h3 class="mb-0">상품등록</h3>
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
                                <!--begin::Form-->
                                <form action="productModify.do?product_no=${vo.product_no}" method="post" enctype="multipart/form-data">
                                    <!--begin::Body-->
                                    <div class="card-body">
                                        <div class="row g-3">

                                            <div class="row g-2">
                                                <label>표시여부</label>
                                                <div class="col">
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="product_status" id="inlineRadio1" value="E" ${vo.product_status == "E" ? "checked" : "" }>
                                                        <label class="form-check-label" for="inlineRadio1">진열</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="product_status" id="inlineRadio2" value="D" ${vo.product_status == "D" ? "checked" : "" }>
                                                        <label class="form-check-label" for="inlineRadio2">미진열</label>
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input class="form-check-input" type="radio" name="product_status" id="inlineRadio3" value="S" ${vo.product_status == "S" ? "checked" : "" }>
                                                        <label class="form-check-label" for="inlineRadio3">품절</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row g-2">
                                                <label for="category_name">카테고리</label>
                                                <div class="col-md-4">
                                                    <select class="form-select" id="category_name" name="category_name">
                                                        <option value="${vo.category_name}" disabled selected>${vo.category_name}</option>
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
                                                <label for="inputPrice" class="col-sm-2 col-form-label">가격</label>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <input type="text" class="form-control" id="inputPrice" name="product_price" value="${vo.product_price}">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row g-2">
                                                <label for="inputStock" class="col-sm-2 col-form-label">재고</label>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <input type="text" class="form-control" id="inputStock" name="product_stock" value="${vo.product_stock}">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row g-2">
                                                <label for="inputProduct" class="col-sm-2 col-form-label">상품명</label>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <input type="text" class="form-control" id="inputProduct" name="product_name" value="${vo.product_name}">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row g-2">
                                                <label for="inputISBN" class="col-sm-2 col-form-label">국제표준도서번호</label>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <input type="text" class="form-control" id="inputISBN" name="product_isbn" value="${vo.product_isbn}">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row g-2">
                                                <label for="inputpage" class="col-sm-2 col-form-label">쪽수</label>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <input type="text" class="form-control" id="inputpage" name="product_page" value="${vo.product_page}">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row g-2">
                                                <label for="inputProductInfo" class="col-sm-2 col-form-label">상품소개</label>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <textarea class="form-control" id="inputProductInfo" aria-label="With textarea" name="product_description">${vo.product_description}</textarea>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row g-2">
                                                <label for="inputWriter" class="col-sm-2 col-form-label">저자</label>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <input type="text" class="form-control" id="inputWriter" name="product_author" value="${vo.product_author}">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row g-2">
                                                <label for="inputWriterInfo" class="col-sm-2 col-form-label">저자소개</label>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <textarea class="form-control" id="inputWriterInfo" aria-label="With textarea" name="product_author_description">${vo.product_author_description}</textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="row g-2">
                                                <label for="topfile" class="col-sm-2 col-form-label">대표상품사진</label>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                    	<!-- 파일 입력 -->
                                                        <input type="file" class="form-control" id="topfile" name="topFile" onchange="showFileName(this)">
                                                        <!-- 기존 파일명 표시 (파일이 없다면 빈 값으로 처리) -->
										                <div id="fileNameDisplay">
										                    <!-- 기존 파일 이름을 서버에서 넘겨주는 방식으로 표시 -->
										                    <c:if test="${not empty existingFile}">
										                        <small>현재 파일: ${existingFile}</small>
										                    </c:if>
										                </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row g-2">
                                                <label for="files" class="col-sm-2 col-form-label">기타사진</label>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <input type="file" class="form-control" id="files" name="multiFile" multiple>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <!--end::Body-->
                                    <!--begin::Footer-->
                                    <div class="card-footer">
                                        <button class="btn btn-primary" >저장</button>
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
        </main>
		
		<script>
		    function showFileName(input) {
		        var fileName = input.files && input.files[0] ? input.files[0].name : '';
		        var displayElement = document.getElementById('fileNameDisplay');
		        
		        if (fileName) {
		            displayElement.innerHTML = '선택된 파일: ' + fileName;
		        } else {
		            displayElement.innerHTML = '';  // 파일을 선택하지 않으면 기존 파일명은 표시하지 않음
		        }
		    }
		</script>
<%@ include file="/WEB-INF/views/admin/include/footer.jsp" %>