package kr.or.ddit.controller;

import java.net.URLEncoder;
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

import kr.or.ddit.service.CustService;
import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.vo.CarVO;
import kr.or.ddit.vo.CustVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/cust")
@Slf4j
public class CustController {
	
	@Autowired
	CustService custService;
	
	/**
	 * 고객 목록
	 * 요쳥 URI : /cust/list
	 * 요청 파라미터 :
	 * 요청 방식 : get
	 */
	@GetMapping("/list")
	public String custList(Model model, 
			@RequestParam(value="currentPage", defaultValue = "1", required = false) int currentPage,
			@RequestParam Map<String, Object> map) {
		int total = this.custService.getListTotal(map);
		int size = 5;
		map.put("currentPage", currentPage);
		map.put("size", size);
		List<CustVO> list = this.custService.list(map);
		ArticlePage<CustVO> articlePage = new ArticlePage<CustVO>(total, currentPage, size, list, map);
		model.addAttribute("list", articlePage);
		return "cust/list";
	}
	
	/**
	 * 고객 등록폼
	 * 요쳥 URI : /cust/regist
	 * 요청 파라미터 : 
	 * 요청 방식 : get
	 */
	@GetMapping("/regist")
	public String custRegist() {
		return "cust/regist";
	}
	
	/**
	 * 고객 등록실행
	 * 요쳥 URI : /cust/registPost
	 * 요청 파라미터 : custVO
	 * 요청 방식 : post
	 */
	@PostMapping("/registPost")
	public String registPost(@ModelAttribute CustVO custVo) {
		log.info("registPost -> custVO : "+custVo);
		int result = this.custService.registPost(custVo);
		return "redirect: /cust/detail?custNum="+custVo.getCustNum();
	}
	
	/**
	 * 고객 상세보기
	 * 요쳥 URI : /cust/detail
	 * 요청 파라미터 : custNum=
	 * 요청 방식 : get
	 */
	@GetMapping("/detail")
	public String detail(Model model, @RequestParam("custNum") int custNum) {
		log.info("detail > custNum : "+custNum);
		CustVO custVO = this.custService.detail(custNum);
		model.addAttribute("vo", custVO);
		return "cust/detail";
	}
	
	@ResponseBody
	@GetMapping("/carList")
	public List<CarVO> carList(@RequestParam("custNum") int custNum) {
		log.info("detail > custNum : "+custNum);
		CustVO custVO = this.custService.detail(custNum);
		List<CarVO> car = custVO.getCarVOList();
		log.info("car >>"+car);
		return car;
	}
	
	/**
	 * 고객 수정 폼
	 * 요쳥 URI : /cust/edit
	 * 요청 파라미터 : custNum
	 * 요청 방식 : get
	 */
	@GetMapping("/edit")
	public String edit(Model model, @RequestParam("custNum") int custNum) {
		log.info("edit > custNum : "+custNum);
		CustVO custVO = this.custService.detail(custNum);
		model.addAttribute("vo", custVO);
		return "cust/edit";
	}
	
	/**
	 * 고객 수정 시행
	 * 요쳥 URI : /cust/editPost
	 * 요청 파라미터 : custVO
	 * 요청 방식 : post
	 */
	@PostMapping("/editPost")
	public String editPost(@ModelAttribute CustVO custVo) {
		log.info("editPost -> custVO : "+custVo);
		int result = this.custService.editPost(custVo);
		return "redirect: /cust/detail?custNum="+custVo.getCustNum();
	}
	
	/**
	 * 고객 삭제 실행
	 * 요쳥 URI : /cust/deletePost
	 * 요청 파라미터 : custNum
	 * 요청 방식 : post
	 */
	@PostMapping("/deletePost")
	public String deletePost(@RequestParam("custNum") int custNum) {
		int result = this.custService.deletePost(custNum);
		return "redirect: /cust/list";
	}
}
