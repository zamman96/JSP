package kr.or.ddit.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.vo.CustVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/cust")
@Slf4j
public class CustController {
	
	
	
	/**
	 * 직원 목록
	 * 요쳥 URI : /cust/list
	 * 요청 파라미터 :
	 * 요청 방식 : get
	 */
	@GetMapping("/list")
	public String custList(Model model) {
//		List<CustVO> list = this.service
		return "cust/list";
	}
	
	/**
	 * 직원 등록폼
	 * 요쳥 URI : /cust/regist
	 * 요청 파라미터 : 
	 * 요청 방식 : get
	 */
	@GetMapping("/regist")
	public String custRegist() {
		return "cust/regist";
	}
	
	/**
	 * 직원 등록실행
	 * 요쳥 URI : /cust/registPost
	 * 요청 파라미터 : custVO
	 * 요청 방식 : post
	 */
	@PostMapping("/registPost")
	public String registPost(@ModelAttribute CustVO custVo) {
		log.info("registPost -> custVO : "+custVo);
		return "redirect: /cust/detail?custNum="+custVo.getCustNum();
	}
	
	/**
	 * 직원 상세보기
	 * 요쳥 URI : /cust/detail
	 * 요청 파라미터 : custNum=
	 * 요청 방식 : get
	 */
	@GetMapping("/detail")
	public String detail(@RequestParam("custNum") int custNum) {
		log.info("detail > custNum : "+custNum);
		return "cust/detail";
	}
	
	/**
	 * 직원 수정 폼
	 * 요쳥 URI : /cust/edit
	 * 요청 파라미터 : custNum
	 * 요청 방식 : get
	 */
	@GetMapping("/edit")
	public String edit(@RequestParam("custNum") int custNum) {
		log.info("edit > custNum : "+custNum);
		return "cust/edit";
	}
	
	/**
	 * 직원 수정 시행
	 * 요쳥 URI : /cust/editPost
	 * 요청 파라미터 : custVO
	 * 요청 방식 : post
	 */
	@PostMapping("/editPost")
	public String editPost(@ModelAttribute CustVO custVo) {
		log.info("editPost -> custVO : "+custVo);
		return "redirect: /cust/detail?custNum="+custVo.getCustNum();
	}
	
	/**
	 * 직원 삭제 실행
	 * 요쳥 URI : /cust/deletePost
	 * 요청 파라미터 : custNum
	 * 요청 방식 : post
	 */
	@PostMapping("/deletPost")
	public String deletePost(@RequestParam("custNum") int custNum) {
		return "redirect: /cust/list";
	}
}
