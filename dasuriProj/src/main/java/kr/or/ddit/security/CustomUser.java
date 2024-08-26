package kr.or.ddit.security;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import kr.or.ddit.vo.EmpVO;

//사용자가 유저를 정의함
//memberVO(select결과)정보를 User(스프링 시큐리티에서 정의된 유저) 객체 정보에 연계하여 넣어줌
//CustomUser의 객체 = principal
public class CustomUser extends User{
	// principal.empVO
	private EmpVO empVO;

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
	public CustomUser(EmpVO empVO) {
	      //사용자가 정의한 (select한) EmpVO 타입의 객체 empVO를
	      //스프링 시큐리티에서 제공해주고 있는 UsersDetails 타입으로 변환
	      //회원정보를 보내줄테니 이제부터 프링이 너가 관리해줘
	      super(empVO.getEmpNum()+"",empVO.getPassword(),
	            empVO.getEmpAuthVOList().stream()
	         .map(auth->new SimpleGrantedAuthority(auth.getAuth()))
	         .collect(Collectors.toList())
	         );
	      this.empVO = empVO;
	}
	
	public EmpVO getEmpVO() {
		return empVO;
	}
	public void setEmpVO(EmpVO empVO) {
		this.empVO = empVO;
	}
	
}
