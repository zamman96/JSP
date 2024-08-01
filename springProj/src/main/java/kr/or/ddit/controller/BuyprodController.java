package kr.or.ddit.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.BuyprodService;
import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.vo.BuyprodVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/buyprod")
public class BuyprodController {
	@Autowired
	BuyprodService service;
	
	@ModelAttribute
	public void buyprodInit(Model model) {
		model.addAttribute("title", "매입 정보");
	}
	
	@GetMapping("/list")
	public String list(Model model, @RequestParam Map<String, Object> map, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		if(map.get("year")==null || map.get("year")=="") map.put("year", 2020);
		if(map.get("amt")==null || map.get("amt")=="") map.put("amt",0);
		int size = 3;
		map.put("size", size);
		int total = this.service.getTotal(map);
		log.info("total "+total);
		map.put("currentPage", currentPage);
		log.info("map >>"+map);
		List<BuyprodVO> list = this.service.list(map);
		map.remove("size");
		map.remove("currentPage");
		model.addAttribute("data", new ArticlePage<BuyprodVO>(total, currentPage, size, list, map));
		return "buyprod/list";
	}
	
	@GetMapping("/detail/{year}/{buyDateMonth}")
	public String detail(Model model, @RequestParam(value="amt" ,required = false,defaultValue="0") int amt, @PathVariable("year") int year, @PathVariable("buyDateMonth") int month, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
//	@GetMapping("/detail")
//	public String detail(Model model,@RequestParam Map<String, Object> map, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		int size = 10;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("year", year);
		map.put("month", month);
		map.put("amt", amt);
//		if(map.get("year").equals("0")) {
		if((int)map.get("year")==0) {
			map.put("year", 2020);
		}
		log.info("map >>"+map);
		int total = this.service.getDetailTotal(map);
		log.info("total "+total);
		map.put("size", size);
		map.put("currentPage", currentPage);
		log.info("map >>"+map);
		List<BuyprodVO> list = this.service.detail(map);
		map.remove("size");
		map.remove("currentPage");
		model.addAttribute("data", new ArticlePage<BuyprodVO>(total, currentPage, size, list, map));
		return "buyprod/detail";
	}
	
	/*
	   요청URI : /buyprod/detailAjax
	   요청파라미터 : JSON{buyDate:2020-02-11,buyProd:P101000001}
	   요청방식 : post
	   
	   client(JSON String) ->  ->    텍스트       -> -> (RequestBody)server
	   client(JSON Object) <-  <-    텍스트       <- ResponseBody <- (JSON String)server
	   */
	@ResponseBody
	@PostMapping("/detailAjax")
	public BuyprodVO detailAjax(@RequestBody BuyprodVO vo) {
		vo = this.service.detailAjax(vo);
		log.info("vo "+vo);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String buyDateStr = sdf.format(vo.getBuyDate());
		vo.setBuyDateStr(buyDateStr);
		log.info(buyDateStr);
		return vo;
	}
	
	@PostMapping("/update")
	public void list(Model model, @RequestParam BuyprodVO vo) {
		
	}
}
