package kr.or.ddit.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.service.BuyprodService;
import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.vo.BuyprodVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value="/buyprod")
public class BuyprodController {
	@Autowired
	BuyprodService service;
	
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
}
