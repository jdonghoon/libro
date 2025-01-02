<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>		
	        <footer class="app-footer">
	            <div class="float-end d-none d-sm-inline">Copyright &copy; Ezen c team</div>
	            <strong>
                Copyright &copy; 2014-2024&nbsp;
                <a href="https://adminlte.io" class="text-decoration-none">AdminLTE.io</a>.
            </strong>
            All rights reserved.
	        </footer>
	    </div>
		
		<script src="https://cdn.jsdelivr.net/npm/overlayscrollbars@2.3.0/browser/overlayscrollbars.browser.es6.min.js" integrity="sha256-H2VM7BKda+v2Z4+DRy69uknwxjyDRhszjXFhsL4gD3w=" crossorigin="anonymous"></script> <!--end::Third Party Plugin(OverlayScrollbars)--><!--begin::Required Plugin(popperjs for Bootstrap 5)-->
		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha256-whL0tQWoY1Ku1iskqPFvmZ+CHsvmRWx/PIoEvIeWh4I=" crossorigin="anonymous"></script> <!--end::Required Plugin(popperjs for Bootstrap 5)--><!--begin::Required Plugin(Bootstrap 5)-->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha256-YMa+wAM6QkVyz999odX7lPRxkoYAan8suedu4k2Zur8=" crossorigin="anonymous"></script> <!--end::Required Plugin(Bootstrap 5)--><!--begin::Required Plugin(AdminLTE)-->
		<script src="<%=request.getContextPath()%>/javascript/jquery-3.7.1.min.js"></script>
		<script src="<%=request.getContextPath()%>/javascript/adminlte.js"></script>
		<script>
			const SELECTOR_SIDEBAR_WRAPPER = ".sidebar-wrapper";
			const Default = {
				scrollbarTheme: "os-theme-light",
				scrollbarAutoHide: "leave",
				scrollbarClickScroll: true,
			};
			document.addEventListener("DOMContentLoaded", function() {
				const sidebarWrapper = document.querySelector(SELECTOR_SIDEBAR_WRAPPER);
				if ( sidebarWrapper && typeof OverlayScrollbarsGlobal?.OverlayScrollbars !== "undefined" ) {
						OverlayScrollbarsGlobal.OverlayScrollbars(sidebarWrapper, {
							scrollbars: {
								theme: Default.scrollbarTheme,
								autoHide: Default.scrollbarAutoHide,
								clickScroll: Default.scrollbarClickScroll,
							},
					});
				}
			});
		</script>
		<script src="https://cdn.jsdelivr.net/npm/sortablejs@1.15.0/Sortable.min.js" integrity="sha256-ipiJrswvAR4VAx/th+6zWsdeYmVae0iJuiR+6OqHJHQ=" crossorigin="anonymous"></script> <!-- sortablejs -->
		<!-- <script>
		const connectedSortables =
		    document.querySelectorAll(".connectedSortable");
		connectedSortables.forEach((connectedSortable) => {
		    let sortable = new Sortable(connectedSortable, {
		        group: "shared",
		        handle: ".card-header",
		    });
		});
		
		const cardHeaders = document.querySelectorAll(
		    ".connectedSortable .card-header",
		);
		cardHeaders.forEach((cardHeader) => {
		    cardHeader.style.cursor = "move";
		});
		</script>
		<script src="https://cdn.jsdelivr.net/npm/apexcharts@3.37.1/dist/apexcharts.min.js" integrity="sha256-+vh8GkaU7C9/wbSLIcwq82tQ2wTf44aOHA8HlBMwRI8=" crossorigin="anonymous"></script> ChartJS
		<script>
		// NOTICE!! DO NOT USE ANY OF THIS JAVASCRIPT
		// IT'S ALL JUST JUNK FOR DEMO
		// ++++++++++++++++++++++++++++++++++++++++++
		
		const sales_chart_options = {
		    series: [{
		            name: "Digital Goods",
		            data: [28, 48, 40, 19, 86, 27, 90],
		        },
		        {
		            name: "Electronics",
		            data: [65, 59, 80, 81, 56, 55, 40],
		        },
		    ],
		    chart: {
		        height: 300,
		        type: "area",
		        toolbar: {
		            show: false,
		        },
		    },
		    legend: {
		        show: false,
		    },
		    colors: ["#0d6efd", "#20c997"],
		    dataLabels: {
		        enabled: false,
		    },
		    stroke: {
		        curve: "smooth",
		    },
		    xaxis: {
		        type: "datetime",
		        categories: [
		            "2023-01-01",
		            "2023-02-01",
		            "2023-03-01",
		            "2023-04-01",
		            "2023-05-01",
		            "2023-06-01",
		            "2023-07-01",
		        ],
		    },
		    tooltip: {
		        x: {
		            format: "MMMM yyyy",
		        },
		    },
		};
		
		const sales_chart = new ApexCharts(
		    document.querySelector("#revenue-chart"),
		    sales_chart_options,
		);
		sales_chart.render();
		</script> -->
		
	</body>
</html>