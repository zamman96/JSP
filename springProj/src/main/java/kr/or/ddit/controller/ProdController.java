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
	
	@Autowired
	UploadController upload;
	
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
	public String regist(Model model) {
		List<LprodVO> lprod = this.service.lprodList();
		model.addAttribute("lprod",lprod);
		return "prod/regist";
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
	public String registPost(ProdVO prodVo) {
		log.info("vo >>"+prodVo);
		long groupNo = upload.multiImageUpload(prodVo.getUploadFile());
		prodVo.setFileGroupNo(groupNo);
		int result = this.service.registPost(prodVo);
		log.info("result >> "+result);
//		return "redirect: /prod/list";
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
}
