package filter;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class LogFilter implements Filter {
	// 필터를 초기화
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("WebMarket 초기화..");
	}

	// 필터를 리소스에 적용
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
			System.out.println("접속한 클라이언트 IP : " + request.getRemoteAddr());
			long start = System.currentTimeMillis();
			// URL + ? + QueryString => 요청 URI
			System.out.println("접근한 URL 경로 : " + getURLPath(request));
			// 현재 일시를 출력
			System.out.println("요청 처리 시작 시각 : " + getCurrentTime());
			
			//필터가 연속적으로 있다면 다음 필터로 제어 및 요청(request)/응답(response) 정보를 넘겨줌
			chain.doFilter(request, response);
			
			long end = System.currentTimeMillis();
			System.out.println("요청 처리 종료 시각 : " + getCurrentTime());
			System.out.println("요청 처리 소요 시간 : " + (end - start) + "ms");
			System.out.println("======================================");
	}

	private void destory() {
	}

	// 접근한 URL 경로 리턴 메소드
	// http://localhost/ch11/readParameterNoErrorPage.jsp?name=개똥이
	private String getURLPath(ServletRequest request) {
		// HttpServletRequest 인터페이스 는 ServletRequest 인터페이스를 상속받음
		HttpServletRequest req;
		// currentPath : URL경로 => http://localhost/ch11/readParameterNoErrorPage.jsp
		String currentPath = "";
		// queryString : 요청파라미터 => name=개똥이
		String queryString = "";
		// instanceOf 연산자는 객체가 어떤 클래스인지, 어떤 클래스를 상속받았는지 확인하는 데 사용됨
		if (request instanceof HttpServletRequest) {
			// 자식 = (cast)부모
			req = (HttpServletRequest) request;
			currentPath = req.getRequestURI();// http://localhost/ch11/readParameterNoErrorPage.jsp
			System.out.println("currentPath : " + currentPath);
			queryString = req.getQueryString();// name=개똥이
			System.out.println("queryString : " + queryString);
			// 삼항연산자
			queryString = queryString == null ? "" : "?" + queryString;
		}
		// http://localhost/ch11/readParameterNoErrorPage.jsp?name=개똥이
		return currentPath + queryString;
	}// end getURLPath()

	// 현재 시간을 얻어오는 메소드
	private String getCurrentTime() {
		// 2023/03/31 17:29:12
		DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		// 캘린더 객체 생성(싱글톤 : 메모리에 1번 생성하고 전역변수처럼 사용)
		Calendar calendar = Calendar.getInstance();
		// 톰켓서버에서 제공해주는 시스템 현재 시간을 구해서 캘린더 객체에 세팅
		calendar.setTimeInMillis(System.currentTimeMillis());
		// 2023/03/31 17:29:12 이러한 포맷을 준수하면서 리턴
		return formatter.format(calendar.getTime());
	}
}
