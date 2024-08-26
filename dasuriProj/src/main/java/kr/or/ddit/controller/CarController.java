package kr.or.ddit.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.CarService;
import kr.or.ddit.service.CustService;
import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.util.MfrController;
import kr.or.ddit.vo.CarVO;
import kr.or.ddit.vo.CustVO;
import kr.or.ddit.vo.MfrVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/car")
@Slf4j
public class CarController {
	
	@Autowired
	CarService carService;
	
	@Autowired
	CustService custService;
	
	@Autowired
	MfrController mfrCtr;
	
	/**
	 * 자동차 목록
	 * 요쳥 URI : /car/list
	 * 요청 파라미터 :
	 * 요청 방식 : get
	 */
	@GetMapping("/list")
	public String carList(Model model, 
			@RequestParam(value="currentPage", defaultValue = "1", required = false) int currentPage,
			@RequestParam Map<String, Object> map) {
		int total = this.carService.getListTotal(map);
		int size = 5;
		map.put("currentPage", currentPage);
		map.put("size", size);
		List<CarVO> list = this.carService.list(map);
		ArticlePage<CarVO> articlePage = new ArticlePage<CarVO>(total, currentPage, size, list, map);
		model.addAttribute("list", articlePage);
		return "car/list";
	}
	
	/**
	 * 자동차 등록폼
	 * 요쳥 URI : /car/regist
	 * 요청 파라미터 : 
	 * 요청 방식 : get
	 */
	@GetMapping("/regist")
	public String carRegist(Model model) {
		List<MfrVO> list = this.mfrCtr.getMfrVOList();
		log.info("mfr >>"+list);
		model.addAttribute("mfr", list);
		return "car/regist";
	}
	
	@ResponseBody
	@GetMapping("/custList")
	public ArticlePage<CustVO> custList(@RequestParam("currentPage") int currentPage){
		Map<String, Object> map = new HashMap<String, Object>();
		int total = this.custService.getListTotal(map);
		int size = 5;
		map.put("currentPage", currentPage);
		map.put("size", size);
		List<CustVO> list = this.custService.list(map);
		ArticlePage<CustVO> articlePage = new ArticlePage<CustVO>(total, currentPage, size, list, map);
		return articlePage;
	}
	
	/**
	 * 자동차 등록실행
	 * 요쳥 URI : /car/registPost
	 * 요청 파라미터 : CarVO
	 * 요청 방식 : post
	 */
	@PostMapping("/registPost")
	public String registPost(@ModelAttribute CarVO carVo) {
		log.info("registPost -> carVO : "+carVo);
		int result = this.carService.registPost(carVo);
		
		// 파라미터에 한들이 들어가는 것을 최소화
		// 스페이스바도 들어가지 않게 하기
		String param = URLEncoder.encode(carVo.getCarNum());
		log.info("param > "+ param);
		
		return "redirect: /car/detail?carNum="+param;
	}
	
	/**
	 * 자동차 상세보기
	 * 요쳥 URI : /car/detail
	 * 요청 파라미터 : carNum=
	 * 요청 방식 : get
	 */
	@GetMapping("/detail")
	public String detail(Model model, @RequestParam("carNum") String carNum) {
		log.info("detail > carNum : "+carNum);
		CarVO carVo = this.carService.detail(carNum);
		model.addAttribute("vo", carVo);
		return "car/detail";
	}
	
	/**
	 * 자동차 수정 폼
	 * 요쳥 URI : /car/edit
	 * 요청 파라미터 : carNum
	 * 요청 방식 : get
	 */
	@GetMapping("/edit")
	public String edit(Model model, @RequestParam("carNum") String carNum) {
		log.info("edit > carNum : "+carNum);
		CarVO carVo = this.carService.detail(carNum);
		model.addAttribute("vo", carVo);
		return "car/edit";
	}
	
	/**
	 * 자동차 수정 시행
	 * 요쳥 URI : /car/editPost
	 * 요청 파라미터 : CarVO
	 * 요청 방식 : post
	 */
	@PostMapping("/editPost")
	public String editPost(@ModelAttribute CarVO carVo) {
		log.info("editPost -> carVO : "+carVo);
		int result = this.carService.editPost(carVo);
		return "redirect: /car/detail?carNum="+carVo.getCarNum();
	}
	
	/**
	 * 자동차 삭제 실행
	 * 요쳥 URI : /car/deletePost
	 * 요청 파라미터 : carNum
	 * 요청 방식 : post
	 */
	@PostMapping("/deletePost")
	public String deletePost(@RequestParam("carNum") String carNum) {
		int result = this.carService.deletePost(carNum);
		return "redirect: /car/list";
	}
}
