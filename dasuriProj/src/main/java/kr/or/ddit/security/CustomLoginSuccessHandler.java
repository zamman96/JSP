package kr.or.ddit.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomLoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler{
	@Override
		public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
				Authentication auth) throws ServletException, IOException {
			log.info("로그인 성공");
			// auth.getPrincipal() : 사용자 정보를 가져옴
			// 시큐리티에서 사용자 정보는 User 클래스의 객체로 저장됨(CustomUser.java를 참고)
			// 시큐리티 user로 import할 것
			User customUser = (User) auth.getPrincipal();
			
			// 사용자 아이디를 리턴
			String username = customUser.getUsername();
			log.info("username : "+username);
			
			//auth.getAuthorities() -> 권한들(ROLE_MEMBER,ROLE_ADMIN)
		    //authority.getAuthority() : ROLE_MEMBER
			List<String> roleNames = new ArrayList<String>();
			auth.getAuthorities().forEach(authority->{
				roleNames.add(authority.getAuthority());
			});
			log.info("roleNames : "+roleNames);
			
//	      if(roleNames.contains("ROLE_ADMIN")) {
//	         response.sendRedirect("/notice/regist");
//	         return;
//	      } else { // ROLE_MEMBER
//	      //if(roleNames.contains("ROLE_MEMBER")) {
//	         response.sendRedirect("/freelancer/member/list");
//	         return;
//	      }
			
			super.onAuthenticationSuccess(request, response, auth);
		}
}
