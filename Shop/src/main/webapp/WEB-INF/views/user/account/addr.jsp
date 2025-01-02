<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mypage.css">

    <main>
        <section>
            <div class="addr-container">
                <h2>주소록 관리</h2>
                <span class="addr_info">
                	<img src="https://img.icons8.com/?size=100&id=Y0DIg4yKtAk6&format=png&color=000000" style="width:20px; height:20px;">
                배송지는 최대 5개까지 등록하실 수 있습니다.
                </span> 
                <c:if test="${empty list}">
                	<span>등록된 주소록이 없습니다.</span><br><br><br>
                </c:if>
                <c:if test="${not empty list}">
                <c:forEach items="${list}" var="vo">
	                <div class="addr-info">
	                    <p style="display: flex;">${vo.address_book_addressname} (${vo.address_book_name}) 
	                    	<c:if test="${vo.address_book_top == 'Y'}"><span class="addr_top">기본</span></c:if>
	                    </p><br>
	                    <p>[${vo.address_book_postcode}] ${vo.address_book_address} ${vo.address_book_detailaddress}</p>
	                    <p>${fn:replace(vo.address_book_phone, ",", "-")}</p>
	                    <div class="m-d">
	                        <button onclick="location.href='addrmodify.do?address_book_no=${vo.address_book_no}'" class="dh-btn">수정</button>
	                        <button onclick="location.href='addrdelete.do?address_book_no=${vo.address_book_no}'" style="background-color: white; color: black;" class="dh-btn">삭제</button>
	                    </div>
	                </div>
				</c:forEach> 
				</c:if>
	
                <button onclick="checkAddressBookCount()" class="dh-btn">등록</button>
            </div>
        </section>
    </main>

	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script>
		// 페이지 로드 시 주소록 갯수 확인
		function checkAddressBookCount() {
			var listSize = <c:out value="${fn:length(list)}" />;
			if (listSize >= 5) {
				Swal.fire({
						icon: "warning",
						title: "배송지는 최대 5개까지 등록하실 수 있습니다.",
						text: "등록 된 배송지를 삭제하거나 수정하세요."
					});
			} else {
				location.href = 'addrregister.do'; // 주소록 등록 페이지로 이동
			}
		};
	</script>

<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>	
