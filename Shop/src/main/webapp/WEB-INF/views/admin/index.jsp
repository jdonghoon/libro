<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

				<main class="app-main"> 
    <div class="app-content-header"> 
        <div class="container-fluid"> 
            <h3 class="mb-0">Dashboard</h3>
        </div> 
    </div> 
    <div class="app-content"> 
        <div class="container-fluid"> 
            <!-- 관리 섹션 -->
            <div class="row g-4 mb-5"> 
                <!-- 주문 관리 -->
                <div class="col-lg-4 col-md-6"> 
                    <div class="small-box text-bg-primary">
                        <div class="inner">
                            <h3>
                                <img width="48" height="48" src="https://img.icons8.com/color-glass/48/paper-bag.png" alt="paper-bag"/>
                                주문 관리
                            </h3>
                            <div>
                                <span>결제 완료</span>
                                <span>${orderCount.pc_cnt}건</span>
                            </div>
                            <div>
                                <span>상품 준비</span>
                                <span>${orderCount.o_cnt}건</span>
                            </div>
                            <div>
                                <span>발송 완료</span>
                                <span>${orderCount.d_cnt}건</span>
                            </div>
                        </div>
                    </div>
                </div> 

                <!-- 취소 관리 -->
                <div class="col-lg-4 col-md-6"> 
                    <div class="small-box text-bg-danger">
                        <div class="inner">
                            <h3>
                                <img width="52" height="52" src="https://img.icons8.com/papercut/60/money.png" alt="money"/>
                                취소 관리
                            </h3>
                            <div>
                                <span>취소 요청</span>
                                <span>${cancelCount.cw_cnt}건</span>
                            </div>
                            <div>
                                <span>취소 완료</span>
                                <span>${cancelCount.cc_cnt}건</span>
                            </div>
                            <div>
                                <span>환불 요청</span>
                                <span>${cancelCount.rw_cnt}건</span>
                            </div>
                            <div>
                                <span>환불 완료</span>
                                <span>${cancelCount.rc_cnt}건</span>
                            </div>
                        </div>
                    </div>
                </div> 

                <!-- 리뷰/문의 관리 -->
                <div class="col-lg-4 col-md-6"> 
                    <div class="small-box text-bg-success">
                        <div class="inner">
                            <h3>
                                <img width="50" height="50" src="https://img.icons8.com/deco-color/48/commercial.png" alt="commercial"/>
                                리뷰/문의 관리
                            </h3>
                            <div>
                                <span>새 리뷰</span>
                                <span>${contentCount.review_cnt}건</span>
                            </div>
                            <div>
                                <span>주문 문의</span>
                                <span>${contentCount.contactO_cnt}건</span>
                            </div>
                            <div>
                                <span>상품 문의</span>
                                <span>${contentCount.contactP_cnt}건</span>
                            </div>
                            <div>
                                <span>기타 문의</span>
                                <span>${contentCount.contactM_cnt}건</span>
                            </div>
                        </div>
                    </div>
                </div> 
            </div>

            <!-- 매출 통계 -->
            <div class="container">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h5 class="card-title mb-0">매출 통계</h5>
                    </div>
                    <div class="card-body">
                        <!-- 기간 설정 -->
                        <div class="row mb-4">
                            <div class="col-md-5">
                                <label for="startDate" class="form-label">시작일</label>
                                <input type="date" id="startDate" class="form-control" />
                            </div>
                            <div class="col-md-5">
                                <label for="endDate" class="form-label">종료일</label>
                                <input type="date" id="endDate" class="form-control" />
                            </div>
                            <div class="col-md-2 d-flex align-items-end">
                                <button id="filterBtn" class="btn btn-primary w-100">조회</button>
                            </div>
                        </div>

                        <!-- 매출 요약 -->
                        <div class="row text-center mb-4">
                            <div class="col-md-6">
                                <div class="card border-primary">
                                    <div class="card-body">
                                        <h6>총 주문 금액</h6>
                                        <h4 id="totalSales" class="text-primary">${statistics.totalSales != null ? statistics.totalSales : 0}원</h4>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card border-success">
                                    <div class="card-body">
                                        <h6>총 주문 수</h6>
                                        <h4 id="totalOrders" class="text-success">${statistics.totalOrders != null ? statistics.totalOrders : 0}건</h4>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 그래프 -->
                        <canvas id="salesChart" height="100"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

				
				<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
				<script>
					// 날짜별 데이터 가져오기
			        const dailyData = ${statistics.dailyData};
	
			        const labels = dailyData.map(data => data.orderDate);
			        const salesData = dailyData.map(data => data.dailySales);
			        const ordersData = dailyData.map(data => data.dailyOrders);
	
			        // Chart.js 그래프 생성
			        const ctx = document.getElementById('salesChart').getContext('2d');
			        new Chart(ctx, {
			            type: 'line',
			            data: {
			                labels: labels,
			                datasets: [
			                    {
			                        label: '일별 주문액',
			                        data: salesData,
			                        borderColor: 'rgba(75, 192, 192, 1)',
			                        borderWidth: 2,
			                        fill: false
			                    },
			                    {
			                        label: '일별 주문 수',
			                        data: ordersData,
			                        borderColor: 'rgba(153, 102, 255, 1)',
			                        borderWidth: 2,
			                        fill: false
			                    }
			                ]
			            },
			            options: {
			                responsive: true,
			                scales: {
			                    x: { title: { display: true, text: '날짜' } },
			                    y: { title: { display: true, text: '' } }
			                }
			            }
			        });
				</script>
				
<%@ include file="/WEB-INF/views/admin/include/footer.jsp" %>
