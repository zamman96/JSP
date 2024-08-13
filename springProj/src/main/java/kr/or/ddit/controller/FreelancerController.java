package kr.or.ddit.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

// 둘 중에 하나만 있어도 올 수 있음
@PreAuthorize("hasAnyRole('ROLE_MEMBER', 'ROLE_ADMIN')")
@RequestMapping("/freelancer/member")
@Controller
public class FreelancerController {
	
	//ROLE_MEMBER 권한을 가진 사용자만 접근 가능
	// PreAuthorize : 메소드 실행 전에 권한 체킹
	@GetMapping("/list")
	public String list() {
		return "freelancer/member/list";
	}
	
//	1. 공지사항 등록 - 로그인 한 관리자만 접근 가능
//	   @PreAuthorize("hasRole('ROLE_ADMIN')")
//	   @PreAuthorize("hasRole('ROLE_ADMIN') or hasRole('ROLE_MEMBER')")
//	   2. 공지사항 등록 - 로그인(인증) 한 관리자 또는 회원(인가)만 접근 가능
//	   @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER')")   
//	   @Secured({"ROLE_MEMBER","ROLE_ADMIN"})
//	   3. 공지사항 등록 - 로그인(인증) 한 관리자 이면서 회원(인가)만 접근 가능
//	   @PreAuthorize("hasRole('ROLE_ADMIN') and hasRole('ROLE_MEMBER')")
//	   4. 로그인한 사용자만 접근 가능(권한과 상관 없음)
//	   @PreAuthorize("isAuthenticated()")
//	   5. 로그인 안 한 사용자가 접근 가능 -> 로그인 한 사용자는 접근 불가
//	   @PreAuthorize("isAnonymous()")
//	   6. 누구나 접근 가능(PreAuthorize 생략)
}
