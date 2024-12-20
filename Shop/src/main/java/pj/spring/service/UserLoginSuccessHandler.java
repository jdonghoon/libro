package pj.spring.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
 
public class UserLoginSuccessHandler implements AuthenticationSuccessHandler {
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {

		// 로그인 성공 시 호출!!
		System.out.println("로그인 성공!");
		
	    // 사용자의 권한 확인
	    boolean isAdmin = authentication.getAuthorities().stream()
	        .anyMatch(authority -> authority.getAuthority().equals("A")); // ROLE_A 권한 체크

	    if (isAdmin) {
	        // Admin 권한이 있을 경우
	        response.sendRedirect(request.getContextPath() + "/admin/index.do");
	    } else {
	        // 기본 메인 페이지로 이동
	        response.sendRedirect(request.getContextPath() + "/cookietodb.do");
	    }
	}
}
