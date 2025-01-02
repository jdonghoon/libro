<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/menu.css">

<main class="main-container-error">
    <div class="error-container">
        <h1>결제 처리 중 오류가 발생했습니다</h1>
        <p>${errorMessage}</p>
        <p>다시 시도하시거나, 문제가 계속될 경우 고객센터에 문의해 주세요.</p>
        <a href="<c:url value='/'/>" class="btn btn-primary">메인 페이지로 돌아가기</a>
    </div>
</main>

<script>
    // 로그를 통해 오류 메시지 확인
    console.log("결제 오류 메시지:", "<%=request.getAttribute("errorMessage")%>");
</script>

<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>
