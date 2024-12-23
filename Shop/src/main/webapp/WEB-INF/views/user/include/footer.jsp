<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>		
		<script>
			// 메뉴 토글 함수
			function toggleSideMenu(menuType) {
				// 모든 메뉴 숨기기
				const subMenu = document.getElementById('sub-menu');
				const loginMenu = document.getElementById('login-menu');
				const cartMenu = document.getElementById('cart-menu');
				
				subMenu.classList.remove('active');
				loginMenu.classList.remove('active');
				cartMenu.classList.remove('active');
	
				// 선택된 메뉴 표시
				if (menuType === 'sub') {
					subMenu.classList.toggle('active');
				} else if (menuType === 'login') {
					loginMenu.classList.toggle('active');
				} else if (menuType === 'cart') {
					cartMenu.classList.toggle('active');
				}
			}
	
			// 메뉴 닫기 함수
			function closeMenu() {
				const subMenu = document.getElementById('sub-menu');
				const loginMenu = document.getElementById('login-menu');
				const cartMenu = document.getElementById('cart-menu');
				
				subMenu.classList.remove('active');
				loginMenu.classList.remove('active');
				cartMenu.classList.remove('active');
			}
	
			// 검색창 토글 함수
			function toggleSearch() {
				const searchContainer = document.getElementById('search-container');
				console.log(searchContainer);
				searchContainer.classList.toggle('hidden');
				
			}	
		</script>
		<footer>
			<p>Footer Content</p>
		</footer>
	</body>
</html>