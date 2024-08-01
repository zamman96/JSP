package kr.or.ddit.controller;

import java.text.SimpleDateFormat;
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

import kr.or.ddit.service.ProdService;
import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProdVO;
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
	
}
