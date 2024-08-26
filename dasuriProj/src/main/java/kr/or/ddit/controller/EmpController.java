package kr.or.ddit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.EmpService;
import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.vo.EmpVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/emp")
@Slf4j
public class EmpController {
	
	@Autowired
	EmpService empService;
	
	/**
	 * 직원 목록
	 * 요쳥 URI : /emp/list
	 * 요청 파라미터 :
	 * 요청 방식 : get
	 */
	@GetMapping("/list")
	public String list(Model model, 
			@RequestParam(value="currentPage", defaultValue = "1", required = false) int currentPage,
			@RequestParam Map<String, Object> map) {
		
		int total = this.empService.getListTotal(map);
		int size = 5;
		map.put("currentPage", currentPage);
		map.put("size", size);
		List<EmpVO> list = this.empService.list(map);
		ArticlePage<EmpVO> articlePage = new ArticlePage<EmpVO>(total, currentPage, size, list, map);
		model.addAttribute("list", articlePage);
		return "emp/list";
	}
	
	@ResponseBody
	@GetMapping("/empList")
	public ArticlePage<EmpVO> empList(@RequestParam("currentPage") int currentPage) {
		Map<String, Object> map = new HashMap<String, Object>();
		int total = this.empService.getListTotal(map);
		int size = 5;
		map.put("currentPage", currentPage);
		map.put("size", size);
		List<EmpVO> list = this.empService.list(map);
		ArticlePage<EmpVO> articlePage = new ArticlePage<EmpVO>(total, currentPage, size, list, map);
		return articlePage;
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
		int result = this.empService.registPost(empVo);
		log.info("result >> "+result);
		return "redirect: /emp/detail?empNum="+empVo.getEmpNum();
	}
	
	/**
	 * 직원 상세보기
	 * 요쳥 URI : /emp/detail
	 * 요청 파라미터 : empNum=
	 * 요청 방식 : get
	 */
	@GetMapping("/detail")
	public String detail(Model model, @RequestParam("empNum") int empNum) {
		log.info("detail > empNum : "+empNum);
		EmpVO empVO = this.empService.detail(empNum);
		model.addAttribute("vo", empVO);
		return "emp/detail";
	}
	
	/**
	 * 직원 수정 폼
	 * 요쳥 URI : /emp/edit
	 * 요청 파라미터 : empNum
	 * 요청 방식 : get
	 */
	@GetMapping("/edit")
	public String edit(Model model, @RequestParam("empNum") int empNum) {
		log.info("edit > empNum : "+empNum);
		EmpVO empVO = this.empService.detail(empNum);
		model.addAttribute("vo", empVO);
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
		int result = this.empService.editPost(empVo);
		log.info("result >> "+result);
		return "redirect: /emp/detail?empNum="+empVo.getEmpNum();
	}
	
	/**
	 * 직원 삭제 실행
	 * 요쳥 URI : /emp/deletePost
	 * 요청 파라미터 : empNum
	 * 요청 방식 : post
	 */
	@PostMapping("/deletePost")
	public String deletePost(@RequestParam("empNum") int empNum) {
		int result = this.empService.deletePost(empNum);
		log.info("result >> "+result);
		return "redirect: /emp/list";
	}
}
