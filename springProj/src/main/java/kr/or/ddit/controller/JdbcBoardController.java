package kr.or.ddit.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.service.JdbcBoardService;
import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.vo.JdbcBoardVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class JdbcBoardController {
	@Autowired
	JdbcBoardService service;
	
	@RequestMapping (value="/jdbcBoard/list")
	public ModelAndView list(@RequestParam Map<String, Object> map, @RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jdbcBoard/list");
		int total = this.service.getTotal(map);
		int size = 5;
		map.put("currentPage", currentPage);
		map.put("size", size);
		List<JdbcBoardVO> list = this.service.list(map);
		map.remove("size");
		map.remove("currentPage");
		mav.addObject("list", list);
		mav.addObject("data", new ArticlePage<JdbcBoardVO>(total, currentPage, size, list, map));
		return mav;
	}
	
	@RequestMapping (value="/jdbcBoard/create")
	public ModelAndView create() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jdbcBoard/create");
		
		return mav;
	}
	
	
	
	@RequestMapping (value="/jdbcBoard/createPost", method=RequestMethod.POST)
	public ModelAndView createPost(JdbcBoardVO bvo) {
		ModelAndView mav = new ModelAndView();
		int result = this.service.createPost(bvo);
		mav.setViewName("redirect:/jdbcBoard/list");
		return mav;
	}
	
	@RequestMapping (value="/jdbcBoard/detail")
	public ModelAndView detail(JdbcBoardVO bvo) {
		ModelAndView mav = new ModelAndView();
		int result = this.service.cntChange(bvo);
		bvo = this.service.detail(bvo);
		mav.setViewName("jdbcBoard/detail");
		mav.addObject("vo", bvo);
		
		return mav;
	}
	
	@RequestMapping (value="/jdbcBoard/update", method=RequestMethod.POST)
	public ModelAndView update(JdbcBoardVO bvo) {
		ModelAndView mav = new ModelAndView();
		int result = this.service.update(bvo);
		mav.setViewName("redirect:/jdbcBoard/detail?boardNo="+bvo.getBoardNo());
		return mav;
	}
	
	@RequestMapping (value="/jdbcBoard/delete")
	public ModelAndView delete(JdbcBoardVO bvo) {
		ModelAndView mav = new ModelAndView();
		int result = this.service.delete(bvo);
		mav.setViewName("redirect:/jdbcBoard/list");
		return mav;
	}
}
