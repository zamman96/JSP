<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%-- <%@ page errorPage="exception_error.jsp" %> --%>
<!-- 본 페이지에서 오류 발생 시 exception_error.jsp에서 오류를 대신 처리 -->
<!DOCTYPE html>
<html>
<head>
<title>Exception</title>
</head>
<body>
	<% 
	int num1 = 0;
	int num2 = 0;
	double res = 0.0;
	try{
		
	num1 = Integer.parseInt(request.getParameter("num1"));
	num2 = Integer.parseInt(request.getParameter("num2"));
	
	res = num1/num2;
	} catch(ArithmeticException e){
		// 오류가 발생 시 tryCatch_error.jsp로 포워딩
		// 포워딩(forward) : JSP 리턴
		// 리다이렉트(redirect) : 새로운 URL을 재요청
		RequestDispatcher dispatcher =
		request.getRequestDispatcher("tryCatch_error.jsp");
		//request{num1=12,num2=0}
        //request객체와 response객체를 전달함
        //tryCatch_error.jsp에서도 요청파라미터인 ?num1=12&num2=0을 사용할 수 있음

		dispatcher.forward(request, response);
	}
		%>
	<p><%=num1 %> / <%=num2 %> = <%=res %></p>
</body>
</html>