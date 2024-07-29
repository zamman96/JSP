package kr.or.ddit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.service.BookService;
import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.vo.BookVO;
import kr.or.ddit.vo.JdbcBoardVO;
import lombok.extern.slf4j.Slf4j;

/*
	Controller 어노테이션
	스프링 프레임워크에게 "이 클래스는 웹 브라우저의 요청(request)를
	받아들이는 컨트롤러야" 라고 알려주는 것임.
	스프링은 servlet-context.xml의 context:component-scan의 설정에 의해
	이 클래스를 자바빈 객체로 등록(메모리에 바인딩).
*/
@Slf4j
@Controller
public class BookController {
	
	@Autowired
	BookService bookService;
	
	// 책 입력 화면
	/*
	    요청URI : /create
	    요청파라미터 : 없음
	    요청방식 : get
    */
	/*
	   method 속성은 http 요청 메소드를 의미함. 일반적인 웹 페이지 개발에서 GEt 메소드는
	   데이터를 변경하지 않는 경우에, POST 메소드는 데이터가 변경될 경우 사용
	   책 생성 화면은 웹 브라우저에 화면을 보여줄 뿐 데이터의 변경이 일어나지 않으므로
	      GET 메소드를 사용함
	*/
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public ModelAndView create() {
		/*
	       ModelAndView
	       1) Model : Controller가 반환할 데이터(String, int, List, Map, VO..)를 담당
	       2) View : 화면을 담당(뷰(View : JSP)의 경로)
	       */
	      ModelAndView mav = new ModelAndView();
//	      <beans:property name="prefix" value="/WEB-INF/views/" />
//	      <beans:property name="suffix" value=".jsp" />
	      // prefix(접두어) : /WEB-INF/views/
	      // suffix(접미어) : .jsp
	      // /WEB-INF/views/ + book/create + .jsp
	      mav.setViewName("book/create");
	      
	      //forwarding
		return mav;
	}
	

	
	// 목록
		/*
		 * 카테고리 선택 요청
		 * 요청URI : /list?category=드라마
		 * 			/list?category=그림책&gubun=title&keyword=제목 
		 * 요청파라미터 : category=드라마 
		 * 요청방식 : get
		 * 
		 * @RequestParam(value="category",required=false,defaultValue="") String category
		 * required : 필수 설정
		 * defaultValue : 기본값 설정 (null 예외 처리)
		 */
		@RequestMapping(value="/list", method=RequestMethod.GET)
		public ModelAndView list(ModelAndView mav, 
				@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage, // required 필수설정 false인 경우 필수가 아님
				@RequestParam(required=false) Map<String,Object> map) {
			
			if(map.get("keyword")==null) {
				map.put("keyword","");
			}
			if(map.get("gubun")==null) {
				map.put("gubun","");
			}
			
			int total = this.bookService.getTotal(map);
			int size = 3;
			log.info("total "+total);
			map.put("currentPage", currentPage);
			map.put("size", size);
			log.info("map : "+map);
			Map<String, Object> keyword = new HashMap<String, Object>();
			keyword.put("category", map.get("category"));
			keyword.put("gubun", map.get("gubun"));
			keyword.put("keyword", map.get("keyword"));
			
			List<BookVO> BookVOList = this.bookService.list(map);
			mav.addObject("BookVOList", BookVOList);
			log.info("BookVOList : "+BookVOList);
			
			List<Map<String,Object>> categories = this.bookService.getCategories(); 
			mav.addObject("categories", categories);
			log.info("categories : "+categories);
			mav.addObject("data", new ArticlePage<BookVO>(total, currentPage, size, BookVOList, keyword));
			mav.setViewName("book/list");
			return mav;
		}
	
	/*
	Spring에서 파라미터 명과 매개변수 명이 같으면 파라미터 값이 매개변수 값으로 할당됨
	모든 파라미터는 문자. 그래서 price의 값도 숫자형 문자이다
	 */
	@RequestMapping(value="/createPost", method=RequestMethod.POST)
	public ModelAndView createPost(String title, String category, String price, BookVO vo) {
		log.info("title : "+title);
		log.info("category : "+category);
		log.info("price : "+price);
		log.info("vo : "+vo);
		
		/*
	      |    프리젠테이션 계층                |  서비스 계층              | 퍼시스턴스 계층 |
	                *Controller
	      뷰(JSP) -> Controller클래스 -> Service인터페이스
	                            *Service          *Repository
	                          -> ServiceImpl클래스 -> DAO클래스 -> 매퍼XML -> DB
	       */
		
		// 테이블에 도서를 등록
		int result = this.bookService.createPost(vo);
		System.out.println("createPost -> result : "+result);
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("redirect: /list");
		return mav;
	}
	
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public ModelAndView detail(BookVO vo) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("book/detail");
		log.info("vo : "+vo);
		vo = this.bookService.detail(vo);
		//Model : 데이터
		mav.addObject("vo", vo);
		
		//forwarding
		return mav;
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public ModelAndView update(BookVO vo) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/detail?bookId="+vo.getBookId());
		log.info("vo : "+vo);
		
		int result = this.bookService.update(vo);
		
		//forwarding
		return mav;
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public ModelAndView delete(BookVO vo) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/list");
		
		int result = this.bookService.delete(vo);
		
		
		//forwarding
		return mav;
	}
}
