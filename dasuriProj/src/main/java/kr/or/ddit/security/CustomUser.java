package kr.or.ddit.security;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

//사용자가 유저를 정의함
//memberVO(select결과)정보를 User(스프링 시큐리티에서 정의된 유저) 객체 정보에 연계하여 넣어줌
//CustomUser의 객체 = principal
public class CustomUser extends User{
	

	// User의 생성자를 처리해주는 생성자
	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> auth) {
		super(username, password, auth);
	}
	/*
    memberVO(우리) -> user(시큐리티)
    -----------------
    userId        -> username
    userPw        -> password
    enabled       -> enabled
    memberAuthVoList               -> authorities
    */
    // 위에 항목을 memberVO를 통해 바꿔주는 생성자
	
	
}
