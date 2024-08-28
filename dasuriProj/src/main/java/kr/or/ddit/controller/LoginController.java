package kr.or.ddit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LoginController {

	@Autowired
	PasswordEncoder passwordEncoder;
	
	@GetMapping("/login")
	public String loginForm() {
		// 암호화 ( asdfasdf 라는 문자열을 암호화)
		String pw = "java";
		String encodePw = this.passwordEncoder.encode(pw);
		log.info("encodedPw : "+encodePw); //$2a$10$H/tmoD9L561PbEZl39Ocf.A3e7XaUoHVjk3pyJGch1/ARfcmy1xXS
		return "loginForm";
	}
	
	
}
