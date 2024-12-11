<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mypage.css">

    <main>
        <section>
            <div class="addr-container">
                <h2>주소록 관리</h2>
                <c:forEach items="${list}" var="vo">
	                <div class="addr-info">
	                    <p>${vo.address_book_addressname} (${vo.address_book_name})</p><br>
	                    <p>[${vo.address_book_postcode}] ${vo.address_book_address} ${vo.address_book_detailaddress}</p>
	                    <p>${vo.address_book_phone}-${vo.address_book_phone}-${vo.address_book_phone}</p>
	                    <div class="m-d">
	                        <button onclick="location.href='addrmodify.do'" class="dh-btn">수정</button>
	                        <button style="background-color: white; color: black;" class="dh-btn">삭제</button>
	                    </div>
	                </div>
				</c:forEach> 

                <button onclick="location.href='addrregister.do'" class="dh-btn">등록</button>
            </div>
        </section>
    </main>

<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>	
