<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<html>
<head>
    <title>결제 처리 중...</title>
</head>
<body>
    <main>
        <h2>결제를 처리 중입니다. 잠시만 기다려 주세요...</h2>
    </main>
    <script>
        // URL에서 pg_token 가져오기
        const urlParams = new URLSearchParams(window.location.search);
        const pg_token = urlParams.get('pg_token');

        if (pg_token) {
            // 서버로 승인 요청 전송
            fetch('<%=request.getContextPath()%>/kakaoPay/success?pg_token=' + pg_token, { method: 'GET' })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('결제 승인 요청 실패: ' + response.statusText);
                    }
                    return response.json();
                })
                .then(data => {
                    console.log('결제 승인 성공:', data);
                    // 결제 성공 페이지로 리다이렉트
                    window.location.href = '<%=request.getContextPath()%>/kakaoPay/paymentSuccess';
                })
                .catch(error => {
                    console.error('결제 승인 중 오류:', error);
                    alert('결제 승인 중 문제가 발생했습니다. 다시 시도해주세요.');
                    // 결제 실패 페이지로 리다이렉트
                    window.location.href = '<%=request.getContextPath()%>/kakaoPay/paymentFail';
                });
        } else {
            console.error('pg_token이 URL에 없습니다.');
            alert('결제 승인에 필요한 정보가 누락되었습니다.');
            // 메인 페이지로 리다이렉트
            window.location.href = '<%=request.getContextPath()%>/';
        }
    </script>
</body>
</html>
