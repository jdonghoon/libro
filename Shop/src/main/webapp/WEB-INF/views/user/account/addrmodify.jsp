<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mypage.css">

    <main>
        <section>
            <div class="addrform-container">
                <h2>주소록 수정</h2>
                <form>
                    <!-- 기본 정보 -->
                    <div class="addrform-group">
                        <input type="text" id="userId" name="userId" value="미지정">
                    </div>
                    <div class="addrform-group">
                        <input type="text" id="name" name="name" value="홍길동">
                    </div>
                    <div class="addrform-group">
                        <div style="display: flex; justify-content: space-between; margin-bottom: 15px;">
                            <input type="text" id="addr" name="addr" value="54930" style="width: 73%;">
                            <button class="addr_btn">우편번호</button>
                        </div>
                        <input type="text" id="addr" name="addr" style="margin-bottom: 15px;" value="전북특별자치도 전주시 덕진구 백제대로 572">
                        <input type="text" id="addr" name="addr" value="5층">
                    </div>
                    <div class="addrform-group">
                        <div style="display: flex; justify-content: space-between;">
                            <select id="phonePrefix" name="phonePrefix" style="width: 30%;">
                                <option value="010">010</option>
                                <option value="011">011</option>
                                <option value="016">016</option>
                                <option value="016">017</option>
                                <option value="016">018</option>
                                <option value="016">019</option>
                            </select>&nbsp;_&nbsp;
                            <input type="text" id="phoneMiddle" name="phoneMiddle" style="width: 35%;" value="1234">&nbsp;_&nbsp;
                            <input type="text" id="phoneLast" name="phoneLast" style="width: 35%;" value="5678">
                        </div>
                    </div>

                    <!-- 버튼 -->
                    <div class="addrform-footer">
                        <button onclick="location.href='addr.do'">취소</button>
                        <button type="submit" onclick="location.href='addr.do'">수정</button>
                    </div>
                </form>
            </div>
        </section>
    </main>

<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>	
