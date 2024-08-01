package kr.or.ddit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.service.LprodService;
import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.vo.BuyerVO;
import kr.or.ddit.vo.LprodVO;
import kr.or.ddit.vo.ProdVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/lprod")
@Controller
public class LprodController {

	@Autowired
	LprodService service;
	
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("lprod/create");
		
		return mav;
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public ModelAndView list(@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage,
			@RequestParam(required=false) Map<String,Object> map) {
		ModelAndView mav = new ModelAndView();
		if(map.get("keyword")==null) {
			map.put("keyword","");
		}
		if(map.get("gubun")==null) {
			map.put("gubun","");
		}
		//전체 글 수
		int total = this.service.getTotal(map);
		log.info("list->total : " + total);
		//한 화면에 보여지는 행의 수
		int size = 10;
		map.put("size", size);
		map.put("currentPage", currentPage);
		mav.setViewName("lprod/list");
		List<LprodVO> list = this.service.list(map);
		map.remove("size");
		map.remove("currentPage");
		mav.addObject("data", new ArticlePage<LprodVO>(total, currentPage, size, list, map));
		return mav;
	}
	
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public ModelAndView detail(LprodVO vo) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("lprod/detail");
		vo = this.service.detail(vo);
		mav.addObject("vo", vo);
		return mav;
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public ModelAndView delete(LprodVO vo) {
		ModelAndView mav = new ModelAndView();
		// /로 시작하는 경우는 절대 경로
		// 그냥 시작할경우 상대 경로
		mav.setViewName("redirect:/lprod/list");
		int result = this.service.delete(vo);
		return mav;
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public ModelAndView update(LprodVO vo) {
		ModelAndView mav = new ModelAndView();
		int result = this.service.update(vo);
		mav.setViewName("redirect:/lprod/detail?lprodId="+vo.getLprodId());
		return mav;
	}
	
	@RequestMapping(value="/createPost", method=RequestMethod.POST)
	public ModelAndView createPost(LprodVO lvo) {
		ModelAndView mav = new ModelAndView();
		log.info("LprodVo"+lvo);
		int result = this.service.createPost(lvo);
		System.out.println("createPost -> result : "+result);
		mav.setViewName("redirect:/lprod/list");
		return mav;
	}
	
	@ResponseBody
	@PostMapping("/prodListAjax")
	public List<BuyerVO> getProdList(Model model, @RequestBody ProdVO vo){
		List<BuyerVO> list = this.service.getProdList(vo);
		log.info("list >>"+list);
		return list;
	}
}