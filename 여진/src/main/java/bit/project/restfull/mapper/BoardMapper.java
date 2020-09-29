package bit.project.restfull.mapper;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bit.project.restfull.vo.BoardContentsVO;
import bit.project.restfull.vo.BoardVO;
import bit.project.restfull.vo.LocationVO;
import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
public interface BoardMapper{
	//목록 출력
	List<BoardContentsVO> getList(@Param("boardlist_numbers")int boardlist_numbers, @Param("searchWord") String searchWord);
	BoardVO getBoardVO(String board_count);
	
	//글작성
	void writeBoardContentsVO(@Param("title") String title,@Param("contents") String contents);
	void writeBoardLocationVO(LocationVO location);
}