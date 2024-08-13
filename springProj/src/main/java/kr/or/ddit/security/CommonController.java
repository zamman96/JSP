package kr.or.ddit.security;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CommonController {

	// 로그인은 됐지만 권한이 없을 때 요청됨
	@GetMapping("/accessError")
	public void accessError(Authentication auth, Model model) {
		log.info("accessError : "+auth);
		model.addAttribute("auth", "권한이 없습니다.");
		// 메소드명과 jsp파일명이 같다면 return을 생략하고 void로 처리 가능
//		return "accessError";
	}
}
