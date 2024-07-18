package filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class InitParamFilter implements Filter{
	// 프로퍼티
	private FilterConfig filterConfig = null;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("Filter02 초기화 완료");
		this.filterConfig = filterConfig;
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("Filter02 수행");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		System.out.println(id+" "+pw);
		
		String param1 = this.filterConfig.getInitParameter("param1");
		String param2 = this.filterConfig.getInitParameter("param2");
		
		String message = "";
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(id.equals(param1)&&pw.equals(param2)) {
			message = "로그인 성공!";
		} else {
			message = "로그인 실패!!!!";
		}
		out.println(message);
		// 연속적으로 필터가 있으면 다음 필터로 제어를 넘겨줌(request, response)
		chain.doFilter(request, response);
	}
	
	@Override
	public void destroy() {
		System.out.println("Filter02 해제..");
	}
}
