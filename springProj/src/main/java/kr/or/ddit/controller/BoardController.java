package kr.or.ddit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/board")
@Slf4j
@Controller
public class BoardController {
	
	@GetMapping("/list")
	public String list() {
		log.info("회원 게시판 -> 목록 : 모두가 접근 가능");
		return "board/list";
	}
	
	@GetMapping("/regist")
	public String regist(){
		log.info("회원 게시판 -> 등록 : 로그인한 회원만 접근 가능");
		return "board/regist";
	}

}
