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
	
	//�ε��� ������
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		log.info("index");
		return "RS-index";
	}
	
	//�˻� ��� ������-loc
	@GetMapping("/search")
	public String search(@RequestParam(value="boardlist_numbers") int boardlist_numbers, @RequestParam(value="searchWord") String searchWord, Model model) {
		log.info("searchWord : " + searchWord);
		//�˻�� �ش��ϴ� �Խñ۵��� �ҷ���
		List<BoardContentsVO> boardlist = boardService.getList(boardlist_numbers, searchWord);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("boardlist", boardlist);
		
		log.info(searchWord + " �� ���� �˻���� return �� : " + boardlist.size());
		return "searchResult";
	}
	
	//content_view
	@GetMapping("/content_view")
	public String content_view(BoardVO boardVO, Model model) {
		log.info("content_view");
		
		String board_count  = String.valueOf(boardVO.getBoard_count());
		log.info("�Խñ� view ȣ��; �Խñ� ��ȣ = " + board_count);
		
		boardVO = boardService.getBoardVO(board_count);
		model.addAttribute("content_view",boardVO);
		
		return "content_view";
	}
	
	
	
	
	//write_view �׽�Ʈ
	@GetMapping("/write_view")
	public String write_view() {
		log.info("write_view ");
		
		return "write_view";
	}
	//write_view �׽�Ʈ2
	@RequestMapping(value="/write", method = {RequestMethod.GET, RequestMethod.POST})
	public String write(@RequestParam(value="title") String title, @RequestParam(value="contents") String contents, LocationVO location) {
		log.info("write");
		String address = location.getAddress();
		
		log.info(address + "�� ���� �Խñ� �ۼ�");
		boardService.writeBoardContentsVO(title, contents, location);
		return "redirect:/index";
	}
	//write_view �׽�Ʈ2 -- write_form
	@GetMapping("/write_form")
	public String write_form() {
		log.info("write_form ");
		
		return "write_form";
	}
	
	
}
