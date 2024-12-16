<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mypage.css">

    <main>
        <section>
            <div class="inquirydetail-container">
                <h3>문의</h3>
                
<%--                 <c:if test="${vo.user_phone == '주문문의'}">
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
                </c:if> --%>
                    
                    <div class="inquirydetail-group" style="border: none;">
						<table class="inquirydetail-title">
							<tr>
								<th>제목</th>
								<td>[${vo.contact_type}]</td>
							</tr>
							<tr>
								<th>작성자</th>
								<td>${vo.user_name}</td>
							</tr>
							<tr>
								<th>작성일</th>
								<td>${vo.contact_create_at}</td>
							</tr>
						</table>
                    </div>

					<div class="inquirydetail-group">
						<div class="inquirydetail-content">
							<c:if test="${vo.attachment_detail_new_name != null}">
								<c:forEach var="image" items="${fn:split(vo.attachment_detail_new_name, ',')}">
									<img src="<%=request.getContextPath()%>/upload/${image}" alt="Attachment"/>
								</c:forEach>
							</c:if>
								${vo.contact_content}
						</div>
					</div>

					<div class="inquirydetail-group" style="border: none;">
						<input type="password" name="user_password" placeholder="비밀번호">
					</div>
					
                    <div class="inquirydetail-footer">
                        <button class="left-button">등록</button>
                        <div class="right-buttons">
	                        <button onclick="location.href='contactdelete.do?contact_no=${vo.contact_no}'">삭제</button>
	                        <button onclick="location.href='inquirymodify.do?contact_no=${vo.contact_no}'">수정</button>
                        </div>
                    </div>
            </div>
        </section>
    </main>

<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>	
