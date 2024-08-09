package kr.or.ddit.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.ProdService;
import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.util.UploadController;
import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.LprodVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProdVO;
import kr.or.ddit.vo.TblUserVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/prod")
@Controller
public class ProdController {
	
	@Autowired
	ProdService service;
	
	@ModelAttribute
	public void prodInit(Model model) {
		model.addAttribute("title", "상품 정보");
	}
	
	@GetMapping("/list")
	public String list(Model model, @RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage) {
		Map<String, Object> map = new HashMap<>();
		int size = 10;
		int total = this.service.getTotal();
		map.put("currentPage", currentPage);
		map.put("size", size);
		List<ProdVO> list = this.service.list(map);
		map.clear();
//		model.addAttribute("data", list);
		model.addAttribute("data", new ArticlePage<ProdVO>(total, currentPage, size, list, map));
		return "prod/list";
	}
	
	@ResponseBody
	@PostMapping("/listAjax")
	public List<ProdVO> listAjax(@RequestBody ProdVO vo){
		List<ProdVO> list = this.service.cartlist(vo);
		return list;
	}
	
	@ResponseBody
	@PostMapping("/memInfo")
	public MemberVO memDetail(@RequestBody MemberVO vo) {
		vo = this.service.memDetail(vo);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String datestr = sdf.format(vo.getMemBir());
		vo.setMemBirStr(datestr);
		return vo;
	}
	
	@GetMapping("/cart")
	public String cart(Model model) {
		return "prod/cart";
	}
	
	@ResponseBody
	@GetMapping("/prodlist")
	public ArticlePage<ProdVO> prodList(Model model, @RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage) {
		Map<String, Object> map = new HashMap<>();
		int size = 10;
		int total = this.service.getTotal();
		map.put("currentPage", currentPage);
		map.put("size", size);
		List<ProdVO> list = this.service.list(map);
		map.clear();
		ArticlePage<ProdVO> art = new ArticlePage<ProdVO>(total, currentPage, size, list, map);
		return art;
	}
	
	@GetMapping("/cardForm")
	public String cardForm(Model model) {
		// 카드번호 자동 생성
		List<String> cardRndNo = new ArrayList<String>();
		for(int i=0; i<3; i++) {
			Random rand = new Random();
			cardRndNo.add(""+rand.nextInt(1000000000));
		}
		model.addAttribute("cardList", cardRndNo);
		return "prod/cardForm";
	}
	
	@ResponseBody
	@PostMapping("/cardFormPost")
	public TblUserVO cardFormPost (TblUserVO vo) {
		log.info("vo "+vo);
		
		int result = this.service.cardFormPost(vo);
		log.info("result "+result);
		
		return vo;
	}
	
	@GetMapping("/regist")
	public String regist(Model model,@ModelAttribute ProdVO prodVO) {
		return "prod/regist";
	}
	
	@ResponseBody
	@GetMapping("/lprod")
	public List<LprodVO> lprodList(){
		List<LprodVO> lprod = this.service.lprodList();
		return lprod;
	}
	
	@ResponseBody
	@PostMapping("/buyer")
	public List<BuyerVO> buyerList(@RequestBody BuyerVO vo) {
		List<BuyerVO> buyer = this.service.buyerList(vo);
		return buyer;
	}
	
	@ResponseBody
	@PostMapping("/createProdId")
	public String createProdId(@RequestBody ProdVO vo) {
		log.info("vo >>"+vo);
		String prodId = this.service.createProdId(vo);
		log.info("id >>"+prodId);
		return prodId;
	}
	
	@PostMapping("/registPost")
	// BindingResult를 처리하기 위해선 Spring form이 필요하다
	/* p.384 (실전스프링웹개발)
    BindingResult에는 요청 파라미터의 바인딩 오류와 입력값 검증(숫자타입의 멤버변수에 문자가 옴)  
    오류 정보가 저장됨
     - hasErrors() : 오류 발생 시 true를 반환 
   */
  //입력값 검증을 할 도메인 클래스(ProdVO)에 골뱅이Validated를 지정함
  //입력값 검증 대상의 도메인 클래스 직후에 BindingResult를 정의함. 
  //BindingResult에는 요청 파라미터 데이터의 바인딩(set..) 오류와 
  // 입력값 검증 오류 정보가 저장됨
	public String registPost(@Validated ProdVO prodVo, BindingResult result, Model model) {
		log.info("vo >>"+prodVo);
		// 도메인클래스(ProdVO의 prodName 및 prodSave 멤버변수(프로퍼티)에 오류가 발생함
	     // brResult.hasErrors() => true
		if(result.hasErrors()) { // 오류 발생
			// Global + Field
			List<ObjectError> allErrors = result.getAllErrors();
			// 객체(중첩된 자바 빈_와 관련된 오류
			List<ObjectError> globalErrors = result.getGlobalErrors();
			// 프로퍼티와 관련된 오류
			List<FieldError> fieldErrors = result.getFieldErrors();
			
			for(ObjectError objectError : allErrors) {
	            log.info("allError : " + objectError);
	         }
	         
	         for(ObjectError objectError : globalErrors) {
	            log.info("globalError : " + objectError);
	         }
	         
	         for(FieldError fieldError: fieldErrors) {
	            log.info("fieldError : " + fieldError.getDefaultMessage());
	         }
	         
	         Map<String, Object> errors = new HashMap<String, Object>();
	         
	         if(prodVo.getProdSale()==0) {
	        	 errors.put("prodSale", "판매가는 필수 입력 항목입니다");
	        	 model.addAttribute("errors", errors);
	         }
	         // redirect로는 안됨
	         // 오류 정보도 함께 이동
	         return "prod/regist";
		}
		
		int sresult = this.service.registPost(prodVo);
		log.info("result >> "+sresult);
		return "redirect: /prod/detail?prodId="+prodVo.getProdId();
	}
	
	@GetMapping("/detail")
	public String detail(@RequestParam("prodId") String prodId, Model model) {
		ProdVO prodVo = new ProdVO();
		prodVo.setProdId(prodId);
		log.info("vo >>"+prodVo);
		BuyerVO buyer = this.service.detail(prodVo);
		log.info("vo >>"+buyer);
		model.addAttribute("buyer", buyer);
		return "prod/detail";
	}
	
	@GetMapping("/edit")
	public String edit(@RequestParam("prodId") String prodId, Model model) {
		ProdVO prodVo = new ProdVO();
		prodVo.setProdId(prodId);
		log.info("vo >>"+prodVo);
		BuyerVO buyer = this.service.detail(prodVo);
		log.info("vo >>"+buyer);
		model.addAttribute("buyer", buyer);
		
		List<LprodVO> lprod = this.service.lprodList();
		
		List<BuyerVO> buySel = this.service.buyerList(buyer);
		model.addAttribute("sel", buySel);
		model.addAttribute("lprod", lprod);
		return "prod/edit";
	}
	
	@PostMapping("/updatePost")
	public String updatePost(ProdVO prodVo) {
		log.info("vo >>"+prodVo);
		int result = this.service.updatePost(prodVo);
		log.info("result >> "+result);
		return "redirect: /prod/detail?prodId="+prodVo.getProdId();
	}
	
	@GetMapping("delete")
	public String delete(@RequestParam("prodId") String prodId) {
		int result = this.service.delete(prodId);
		log.info("result >> "+result);
		return "redirect: /prod/list";
	}
}
