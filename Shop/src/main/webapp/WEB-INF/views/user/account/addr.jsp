<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mypage.css">

    <main>
        <section>
            <div class="addr-container">
                <h2>주소록 관리</h2>
                <div class="addr-info">
                    <p>집 (홍길동)</p><br>
                    <p>[54930] 전북특별자치도 전주시 덕진구 백제대로 572 5층</p>
                    <p>010-1234-5678</p><br>
                    <div class="m-d">
                        <button onclick="location.href='addrmodify.do'" class="dh-btn">수정</button>
                        <button style="background-color: white; color: black;" class="dh-btn">삭제</button>
                    </div>
                </div>
                <div class="addr-info">
                    <p>미지정 (홍길동)</p><br>
                    <p>[54930] 전북특별자치도 전주시 덕진구 백제대로 572 5층</p>
                    <p>010-1234-5678</p><br>
                    <div class="m-d">
                        <button onclick="location.href='addrmodify.do'" class="dh-btn">수정</button>
                        <button style="background-color: white; color: black;" class="dh-btn">삭제</button>
                    </div>
                </div>
                <button onclick="location.href='addrregister.do'" class="dh-btn">등록</button>
            </div>
        </section>
    </main>

<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>	
