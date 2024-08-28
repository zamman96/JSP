package kr.or.ddit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SampleController {
	@GetMapping(value = "/client")
	public String getClient(HttpServletRequest request, HttpServletResponse response) {
		return "socket";
	}

	@GetMapping(value = "/server")
	public String getServer(HttpServletRequest request, HttpServletResponse response) {
		return "server";
	}
}
