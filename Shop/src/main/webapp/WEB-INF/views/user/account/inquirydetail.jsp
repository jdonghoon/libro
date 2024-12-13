<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mypage.css">

    <main>
        <section>
            <div class="inquirydetail-container">
                <h3>문의</h3>
                
                <c:if test="${vo.user_phone == '주문문의'}">
                </c:if>
					<div class="inquirydetail-group" >
						<div class="product-inquiry" >
                            <div style="display: flex;">
                                <img src="<%=request.getContextPath()%>/img/소년이온다.jpg">
                                <div>
                                    <p><b>소년이 온다</b></p>
                                    <p>13,500원</p>
	                                <button onclick="location.href='reviewregister.do'" class="product-detail-btn">상품상세보기</button>
                                </div>
                            </div>
                        </div>
					</div>
                    
                    <div class="inquirydetail-group" style="border: none;">
						<table class="inquirydetail-title">
							<tr>
								<th>제목</th>
								<td>[상품문의]</td>
							</tr>
							<tr>
								<th>작성자</th>
								<td>홍길동</td>
							</tr>
							<tr>
								<th>작성일</th>
								<td>2018-11-07</td>
							</tr>
						</table>
                    </div>

					<div class="inquirydetail-group">
						<div class="inquirydetail-content">
							▶ 상품 기본 설명은 상품 페이지 하단에 기재되어있습니다.<br>
사이즈는 잘 맞는 상품의 상세사이즈와 저희가 올려드린 상세사이즈를 비교 해주시는게 좋습니다.<br><br>

야외촬영or스태프촬영의경우 야외촬영이나 조명에 따라 약간씩 컬러가 다를 수 있어서 디테일컷으로 보시는게 가장 정확 합니다. (해상도에 따라 약간씩 차이 날 수 있습니다.)<br><br>

* 배송전 교환/취소시 [배송전 부분취소/변경] 제목선택을 안해주시면 상품교환/주문취소는 당일 처리되지 않습니다 *<br><br>

비회원으로 문의주실 경우엔 동명이인으로 인해 주문정보와 함께 남겨주셔야 바로 처리 가능합니다.<br><br>

----------------------------------------------------------------------<br>
블랙으로 주문했는데 혹시 베이지 들어오면 베이지로 보내주실 수 있나요?
						</div>
					</div>

					<div class="inquirydetail-group" style="border: none;">
						<input type="password" name="user_password" placeholder="비밀번호">
					</div>
					
                    <div class="inquirydetail-footer">
                        <button class="left-button">등록</button>
                        <div class="right-buttons">
	                        <button>삭제</button>
	                        <button>수정</button>
                        </div>
                    </div>
            </div>
        </section>
    </main>

<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>	
