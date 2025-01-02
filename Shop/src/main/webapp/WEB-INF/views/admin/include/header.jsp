<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Libro</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="title" content="AdminLTE v4 | Dashboard">
		<meta name="author" content="ColorlibHQ">
		<meta name="description" content="AdminLTE is a Free Bootstrap 5 Admin Dashboard, 30 example pages using Vanilla JS.">
		<meta name="keywords" content="bootstrap 5, bootstrap, bootstrap 5 admin dashboard, bootstrap 5 dashboard, bootstrap 5 charts, bootstrap 5 calendar, bootstrap 5 datepicker, bootstrap 5 tables, bootstrap 5 datatable, vanilla js datatable, colorlibhq, colorlibhq dashboard, colorlibhq admin dashboard"><!--end::Primary Meta Tags--><!--begin::Fonts-->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fontsource/source-sans-3@5.0.12/index.css" integrity="sha256-tXJfXfp6Ewt1ilPzLDtQnJV4hclT9XuaZUKyUvmyr+Q=" crossorigin="anonymous"><!--end::Fonts--><!--begin::Third Party Plugin(OverlayScrollbars)-->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/overlayscrollbars@2.3.0/styles/overlayscrollbars.min.css" integrity="sha256-dSokZseQNT08wYEWiz5iLI8QPlKxG+TswNRD8k35cpg=" crossorigin="anonymous"><!--end::Third Party Plugin(OverlayScrollbars)--><!--begin::Third Party Plugin(Bootstrap Icons)-->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.min.css" integrity="sha256-Qsx5lrStHZyR9REqhUF8iQt73X06c8LGIUPzpOhwRrI=" crossorigin="anonymous"><!--end::Third Party Plugin(Bootstrap Icons)--><!--begin::Required Plugin(AdminLTE)-->
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/adminlte.css"><!--end::Required Plugin(AdminLTE)--><!-- apexcharts -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/apexcharts@3.37.1/dist/apexcharts.css" integrity="sha256-4MX+61mt9NVvvuPjUWdUdyfZfxSB1/Rf9WtqRHgG5S0=" crossorigin="anonymous"><!-- jsvectormap -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/jsvectormap@1.5.3/dist/css/jsvectormap.min.css" integrity="sha256-+uGLJmmTKOqBr+2E6KDYs/NRsHxSkONXFHUL0fy2O/4=" crossorigin="anonymous">
		
		<!-- Bootstrap CSS -->
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
	    <!-- Chart.js -->
	    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	</head>
	
	<body class="layout-fixed sidebar-expand-lg bg-body-tertiary"> 
	    <div class="app-wrapper">
	    
	        <nav class="app-header navbar navbar-expand bg-body"> 
	            <div class="container-fluid"> 
	                <ul class="navbar-nav">
	                    <li class="nav-item"> <a class="nav-link" data-lte-toggle="sidebar" href="#" role="button"> <i class="bi bi-list"></i> </a> </li>
	                    <li class="nav-item d-none d-md-block"> <a href="<%=request.getContextPath()%>/admin/index.do" class="nav-link">Home</a> </li>
	                </ul>
	                <ul class="navbar-nav ms-auto">
	                    <li class="nav-item dropdown"> 
	                    	<a class="nav-link" data-bs-toggle="dropdown"> 
	                    		<img width="33" height="33" src="https://img.icons8.com/?size=100&id=32058&format=png&color=343A40" alt="bell--v1"/>
	                    		<span class="navbar-badge badge text-bg-warning">0</span> 
	                    	</a>
	                        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end">
	                            <div class="dropdown-item dropdown-header">알림</div>
	                            <div class="dropdown-divider"></div> 
	                            <a class="dropdown-item"> 
	                            	<i class="bi bi-envelope me-2"></i> 000님의 새 문의가 있습니다
	                                <span class="float-end text-secondary fs-7">2024-12-02</span> 
                                </a>
                                <div class="dropdown-divider"></div> 
                                <a href="#" class="dropdown-item"> 
                                	<i class="bi bi-envelope me-2"></i> 000님의 새 문의가 있습니다
                                    <span class="float-end text-secondary fs-7">2024-12-03</span>
                                </a>
                                <div class="dropdown-divider"></div> 
                                <a class="dropdown-item"> 
                                	<i class="bi bi-envelope me-2"></i> 000님의 새 문의가 있습니다
                                    <span class="float-end text-secondary fs-7">2024-12-04</span> 
                                </a>
                                <div class="dropdown-divider"></div> 
                                <a href="<%=request.getContextPath()%>/admin/contact.do" class="dropdown-item dropdown-footer">전체 문의 보기</a>
	                        </div>
	                    </li>
	                    <li class="user-body"><a href="<%=request.getContextPath()%>/logout.do" class="btn btn-default btn-flat float-end">Sign out</a></li>
                    </ul>
	            </div> 
	        </nav> 
	        
	        <aside class="app-sidebar bg-body-secondary shadow" data-bs-theme="dark"> <!--begin::Sidebar Brand-->
	            <div class="sidebar-brand"> 
	                <a href="<%=request.getContextPath()%>/admin/index.do" class="brand-link"> 
	                    <img width="45" height="45" src="https://img.icons8.com/?size=100&id=FiYXriO9AqJT&format=png&color=FFFFFF" alt="external-book-baby-victoruler-outline-victoruler"/>
	                    <span class="brand-text fw-light">L i b r o</span> 
	                </a> 
	             </div>
	            <div class="sidebar-wrapper">
	                <nav class="mt-2">
	                    <!--begin::Sidebar Menu-->
	                    <ul class="nav sidebar-menu flex-column" data-lte-toggle="treeview" role="menu" data-accordion="false">
	                        <li class="nav-item menu-open">
	                            <a href="<%=request.getContextPath()%>/admin/index.do" class="nav-link active">
	                                <i class="nav-icon bi bi-speedometer"></i>
	                                <p>대시보드</p>
	                            </a>
	                        </li>
	                        <li class="nav-item">
	                            <a href="<%=request.getContextPath()%>/admin/membership.do" class="nav-link"> 
	                                <img width="23" height="23" src="https://img.icons8.com/?size=100&id=ywULFSPkh4kI&format=png&color=C2C7D0" alt="person-male--v3"/>
	                                <p>회원관리</p>
	                            </a>
	                        </li>
	                        <li class="nav-item">
	                                <a href="#" class="nav-link">
	                                    <i class="nav-icon bi bi-box-seam-fill"></i>
	                                    <p>상품관리
	                                        <i class="nav-arrow bi bi-chevron-right"></i>
	                                    </p>
	                                </a>
	                                <ul class="nav nav-treeview">
	                                    <li class="nav-item"> <a href="<%=request.getContextPath()%>/admin/product.do" class="nav-link"> <i class="nav-icon bi bi-circle"></i>
	                                            <p>상품목록</p>
	                                        </a> </li>
	                                    <li class="nav-item"> <a href="<%=request.getContextPath()%>/admin/productWrite.do" class="nav-link"> <i class="nav-icon bi bi-circle"></i>
	                                            <p>상품등록</p>
	                                        </a> </li>
	                                </ul>
	                            </li>
	                            <li class="nav-item"> 
	                                <a href="#" class="nav-link"> 
	                                    <i class="nav-icon bi bi-clipboard-fill"></i>
	                                    <p>주문관리
	                                        <i class="nav-arrow bi bi-chevron-right"></i>
	                                    </p>
	                                </a>
	                                <ul class="nav nav-treeview">
	                                    <li class="nav-item"> 
	                                        <a href="<%=request.getContextPath()%>/admin/order.do" class="nav-link"> 
	                                            <i class="nav-icon bi bi-circle"></i>
	                                            <p>주문내역</p>
	                                        </a> 
	                                    </li>
	                                    <!-- <li class="nav-item"> 
	                                        <a href="shipping.html" class="nav-link"> 
	                                            <i class="nav-icon bi bi-circle"></i>
	                                            <p>배송관리</p>
	                                        </a> </li> -->
	                                    <li class="nav-item"> 
	                                        <a href="<%=request.getContextPath()%>/admin/cancel.do" class="nav-link"> 
	                                            <i class="nav-icon bi bi-circle"></i>
	                                            <p>취소관리</p>
	                                        </a> 
	                                    </li>
	                                    <!-- <li class="nav-item"> 
	                                        <a href="return.html" class="nav-link"> 
	                                            <i class="nav-icon bi bi-circle"></i>
	                                            <p>반품관리</p>
	                                        </a>
	                                    </li> -->
	                                </ul>
	                            </li>
	                            <li class="nav-item"> 
	                                <a href="<%=request.getContextPath()%>/admin/sales.do" class="nav-link"> 
	                                    <img width="23" height="23" src="https://img.icons8.com/?size=100&id=YjTRjnlGiNzf&format=png&color=C2C7D0" alt="bullish--v1"/>
	                                    <p>매출관리</p>
	                                </a>
	                            </li>
	                        <li class="nav-item"> 
	                            <a href="<%=request.getContextPath()%>/admin/review.do" class="nav-link"> 
	                                <img width="23" height="23" src="https://img.icons8.com/?size=100&id=82731&format=png&color=C2C7D0" alt="rating"/>
	                                <p> 리뷰관리</p>
	                            </a>
	                        </li>
	                        <li class="nav-item"> 
	                            <a href="<%=request.getContextPath()%>/admin/contact.do" class="nav-link"> 
	                                <img width="20" height="20" src="https://img.icons8.com/?size=100&id=53szkUSJOkco&format=png&color=C2C7D0" alt="chatbot"/>
	                                <p>문의관리</p>
	                            </a>
	                        </li>
	                    </ul> 
	                </nav>
	            </div> 
	        </aside>