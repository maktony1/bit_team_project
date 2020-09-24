package bit.project.restfull.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bit.project.restfull.service.BoardService;
import bit.project.restfull.vo.BoardContentsVO;
import bit.project.restfull.vo.BoardVO;
import bit.project.restfull.vo.LocationVO;
import bit.project.restfull.vo.MemberVO;
import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j
public class BoardController {
	
	
	@Autowired
	private BoardService boardService;
	
	//인덱스 페이지
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		log.info("index");
		return "index";
	}
	
	//검색 결과 페이지-loc
	@GetMapping("/search")
	public String search(@RequestParam(value="searchWord") String searchWord, Model model) {
		log.info("searchWord : " + searchWord);
		//검색어에 해당하는 게시글들을 불러옴
		//List<LocationVO> boardlist = boardService.getLocList(searchWord);
		List<BoardContentsVO> boardlist = boardService.getContents(searchWord);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("boardlist", boardlist);
		
		log.info(searchWord + " 에 대한 검색결과 return 수 : " + boardlist.size());
		return "searchResult";
	}
	
	//write_view 테스트
	@GetMapping("/write_view")
	public String write_view2() {
		log.info("write_view ");
		
		return "write_view";
	}
	//write_view 테스트2
	@GetMapping("/write")
	public String writeTest() {
		log.info("writeTest");
		
		return "writeTest";
	}
	//write_view 테스트2 -- write_form
	@GetMapping("/write_form")
	public String write_form() {
		log.info("write_form ");
		
		return "write_form";
	}
	
	
}
