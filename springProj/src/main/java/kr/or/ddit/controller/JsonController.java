package kr.or.ddit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/json")
@Slf4j
@Controller
public class JsonController {
	@GetMapping("/jsonTest01")
	public String jsonTest01(Model model) {
		
		//forwarding : jsp
		return "json/jsonTest01";
	}
	
	@GetMapping("/jsonTest02")
	public String jsonTest02(Model model) {
		
		//forwarding : jsp
		return "json/jsonTest02";
	}
	
	@GetMapping("/jsonTest03")
	public String jsonTest03(Model model) {
		
		//forwarding : jsp
		return "json/jsonTest03";
	}
	
	@GetMapping("/jsonTest04")
	public String jsonTest04(Model model) {
		
		//forwarding : jsp
		return "json/jsonTest04";
	}
}
