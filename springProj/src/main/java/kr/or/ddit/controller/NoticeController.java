package kr.or.ddit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/notice")
@Slf4j
@Controller
public class NoticeController {
	
	@GetMapping("/list")
	public String list() {
		return "notice/list";
	}
	
	@GetMapping("/regist")
	public String regist() {
		return "notice/regist";
	}
}
