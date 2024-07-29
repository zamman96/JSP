<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<table border="1">
		<thead>
			<th>요청 파라미터 이름</th>
			<th>요청 파라미터 값</th>
		</thead>	
		<tbody>
	<!-- 
   		요청URI : form02_process.jsp
   		요청파라미터 : request{id=a001,pw=java,name=개똥이
         		,phone1=010,phone2=111,phone3=2222
         		,gender=여성,hobby=reading,movie}
  		 요청방식 : post
   -->
	<%
		request.setCharacterEncoding("utf-8");
		
		// Parameter이름은 Enumeration(열거형) 으로 가져올 수 있음
		Enumeration name = request.getParameterNames();
		// 열거형 요소가 있다면 true 반환
		// hasMoreElements 메서드 : 전송된 요청 파라미터가 없을 때까지 반복
		while(name.hasMoreElements()){
			// object 타입
			// nextElement 메서드 : 각 요청 파라미터의 이름을 가져옴
			String key = (String)name.nextElement();
			String value = "";
			if(!key.equals("hobby")){
				value = request.getParameter(key);
			} else{
				String[] hobby = request.getParameterValues(key);
				if(hobby!=null){
					for(String a : hobby){
						value += a + ", ";
					}
					value = value.substring(0, value.length()-2);
				}
			}
			out.print("<tr><td>"+key + "</td><td>" +value+"</td></tr>");
		}
	%>
		</tbody>
	</table>
</body>
</html>