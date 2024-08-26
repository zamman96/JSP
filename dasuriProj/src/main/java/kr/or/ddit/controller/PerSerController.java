package kr.or.ddit.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.service.PerSerService;
import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.util.UploadController;
import kr.or.ddit.vo.PerReplyVO;
import kr.or.ddit.vo.PerSerVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/perSer")
@Slf4j
@PreAuthorize("hasRole('ROLE_MEMBER')")
public class PerSerController {
	
	@Autowired
	PerSerService perSerService;
	
	@Inject
	PasswordEncoder passwordEncoder;
	
	/**
	 * 수리내역 목록
	 * 요쳥 URI : /perSer/list
	 * 요청 파라미터 :
	 * 요청 방식 : get
	 */
	@GetMapping("/list")
	public String perSerList(Model model, 
			@RequestParam(value="currentPage", defaultValue = "1", required = false) int currentPage,
			@RequestParam Map<String, Object> map) {
		int total = this.perSerService.getListTotal(map);
		int size = 5;
		map.put("currentPage", currentPage);
		map.put("size", size);
		List<PerSerVO> list = this.perSerService.list(map);
		ArticlePage<PerSerVO> articlePage = new ArticlePage<PerSerVO>(total, currentPage, size, list, map);
		model.addAttribute("list", articlePage);
		return "perSer/list";
	}
	
	/**
	 * 수리내역 등록폼
	 * 요쳥 URI : /perSer/regist
	 * 요청 파라미터 : 
	 * 요청 방식 : get
	 */
	@GetMapping("/regist")
	public String perSerRegist() {
		return "perSer/regist";
	}
	
	@GetMapping("/test")
	public String test() {
		return "perSer/write";
	}
	
	/**
	 * 수리내역 등록실행
	 * 요쳥 URI : /perSer/registPost
	 * 요청 파라미터 : PerSerVO
	 * 요청 방식 : post
	 */
	@PostMapping("/registPost")
	public String registPost(@ModelAttribute PerSerVO perSerVo) {

		log.info("registPost -> perSerVO : "+perSerVo);
		
		int result = this.perSerService.registPost(perSerVo);
		return "redirect: /perSer/detail?serNum="+perSerVo.getSerNum();
	}
	
	/**
	 * 수리내역 상세보기
	 * 요쳥 URI : /perSer/detail
	 * 요청 파라미터 : perSerNum=
	 * 요청 방식 : get
	 */
	@GetMapping("/detail")
	public String detail(Model model, @RequestParam("serNum") int serNum) {
		String pwd = "java";
		String encodePwd = passwordEncoder.encode(pwd);
		log.info(encodePwd);
		
		log.info("detail > perSerNum : "+serNum);
		PerSerVO per = this.perSerService.detail(serNum);
		model.addAttribute("vo",per);
		
		List<PerReplyVO> reply = this.perSerService.replyList(serNum);
		model.addAttribute("reply", reply);
		return "perSer/detail";
	}
	
	/**
	 * 수리내역 수정 폼
	 * 요쳥 URI : /perSer/edit
	 * 요청 파라미터 : perSerNum
	 * 요청 방식 : get
	 */
	@GetMapping("/edit")
	public String edit(Model model, @RequestParam("serNum") int serNum) {
		log.info("edit > perSerNum : "+serNum);
		PerSerVO per = this.perSerService.detail(serNum);
		model.addAttribute("vo",per);
		return "perSer/edit";
	}
	
	/**
	 * 수리내역 수정 시행
	 * 요쳥 URI : /perSer/editPost
	 * 요청 파라미터 : PerSerVO
	 * 요청 방식 : post
	 */
	@PostMapping("/editPost")
	public String editPost(@ModelAttribute PerSerVO perSerVo) {
		log.info("editPost -> perSerVO : "+perSerVo);
		int result = this.perSerService.editPost(perSerVo);
		return "redirect: /perSer/detail?serNum="+perSerVo.getSerNum();
	}
	
	/**
	 * 수리내역 삭제 실행
	 * 요쳥 URI : /perSer/deletePost
	 * 요청 파라미터 : perSerNum
	 * 요청 방식 : post
	 */
	@PostMapping("/deletePost")
	public String deletePost(@RequestParam("serNum") int serNum) {
		int result = this.perSerService.deletePost(serNum);
		return "redirect: /perSer/list";
	}
	
	@PostMapping("/registReplyPost")
	public String registReplyPost(PerReplyVO perReplyVO) {
		int result = this.perSerService.registReplyPost(perReplyVO);
		return "redirect: /perSer/detail?serNum="+perReplyVO.getSerNum();
	}
}
