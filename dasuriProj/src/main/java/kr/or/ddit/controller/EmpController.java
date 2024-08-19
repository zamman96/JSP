package kr.or.ddit.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.vo.EmpVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/emp")
@Slf4j
public class EmpController {
	
	
	
	/**
	 * 직원 목록
	 * 요쳥 URI : /emp/list
	 * 요청 파라미터 :
	 * 요청 방식 : get
	 */
	@GetMapping("/list")
	public String empList(Model model) {
//		List<EmpVO> list = this.service
		return "emp/list";
	}
	
	/**
	 * 직원 등록폼
	 * 요쳥 URI : /emp/regist
	 * 요청 파라미터 : 
	 * 요청 방식 : get
	 */
	@GetMapping("/regist")
	public String empRegist() {
		return "emp/regist";
	}
	
	/**
	 * 직원 등록실행
	 * 요쳥 URI : /emp/registPost
	 * 요청 파라미터 : EmpVO
	 * 요청 방식 : post
	 */
	@PostMapping("/registPost")
	public String registPost(@ModelAttribute EmpVO empVo) {
		log.info("registPost -> empVO : "+empVo);
		return "redirect: /emp/detail?empNum="+empVo.getEmpNum();
	}
	
	/**
	 * 직원 상세보기
	 * 요쳥 URI : /emp/detail
	 * 요청 파라미터 : empNum=
	 * 요청 방식 : get
	 */
	@GetMapping("/detail")
	public String detail(@RequestParam("empNum") int empNum) {
		log.info("detail > empNum : "+empNum);
		return "emp/detail";
	}
	
	/**
	 * 직원 수정 폼
	 * 요쳥 URI : /emp/edit
	 * 요청 파라미터 : empNum
	 * 요청 방식 : get
	 */
	@GetMapping("/edit")
	public String edit(@RequestParam("empNum") int empNum) {
		log.info("edit > empNum : "+empNum);
		return "emp/edit";
	}
	
	/**
	 * 직원 수정 시행
	 * 요쳥 URI : /emp/editPost
	 * 요청 파라미터 : EmpVO
	 * 요청 방식 : post
	 */
	@PostMapping("/editPost")
	public String editPost(@ModelAttribute EmpVO empVo) {
		log.info("editPost -> empVO : "+empVo);
		return "redirect: /emp/detail?empNum="+empVo.getEmpNum();
	}
	
	/**
	 * 직원 삭제 실행
	 * 요쳥 URI : /emp/deletePost
	 * 요청 파라미터 : empNum
	 * 요청 방식 : post
	 */
	@PostMapping("/deletPost")
	public String deletePost(@RequestParam("empNum") int empNum) {
		return "redirect: /emp/list";
	}
}
