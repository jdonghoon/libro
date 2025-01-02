package pj.spring.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

@Order(1) // 여러개의 필터 중 실행 순서 지정
@WebFilter({"/inquiryOk.do"}) // 해당 어노테이션으로 자동으로 filter 적용(web.xml 작업 X)
//@WebFilter("/board/**") // 단일 경로 매핑
//@WebFilter(urlPatterns = "/board/**") // 단일 경로 매핑
//@WebFilter(urlPatterns = {"/board/**", "/free/**"}) // 여러 경로 매핑
@Component
public class ContentFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// 필터생성 시점 호출
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		// 경로시 하나의 가상 경로에 대한 get, post를 구분할 수 없으므로 하나의 가상경로에서 post만 필터를 적용할 수 없다.
		
		String contact_content = request.getParameter("contact_content");
		
		contact_content = contact_content.replaceAll("<", "&lt;");
		contact_content = contact_content.replaceAll(">", "&gt;");
		contact_content = contact_content.replaceAll("\n", "<br>");
		
		request.setAttribute("contact_content", contact_content);
		
		System.out.println("Filter contact_content : " + contact_content);
		
		chain.doFilter(request, response); // 다음 요청으로 전달 
	}

	@Override
	public void destroy() {
		
	}
	
}
