package filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

// Filter 인터페이스를 구현한 구현 클래스
public class AuthenFilter implements Filter {
	
	// 필터 시작 초기화
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("Filter01 초기화 완료");
	}
	
	// 필터 기능 수행
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("Filter01수행");
		
		String name = request.getParameter("name");
		
		// 응답 메세지를 담아서 서버에서 클라이언트로 전달해줌 (response객체 활용)
		if(name==null || name.isEmpty()) {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("입력된 name값은 null입니다");
			return;
		}
		// 필터가 여러개가 있을 때 request, response 객체를 전달해줌
		chain.doFilter(request, response);
	}
	
	// 필터 종료하기 전에 호출
	@Override
	public void destroy() {
		System.out.println("Filter01 해제..");
	}

}
