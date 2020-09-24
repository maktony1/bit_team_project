package bit.project.restfull.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.project.restfull.mapper.BoardMapper;
import bit.project.restfull.vo.BoardContentsVO;
import bit.project.restfull.vo.BoardVO;
import bit.project.restfull.vo.LocationVO;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service("boardService")
@AllArgsConstructor
public class BoardServiceImpl implements BoardService{ 
	
	@Autowired
	private BoardMapper mapper;	
	
	@Override
	public List<BoardContentsVO> getList(int boardlist_numbers, String searchWord) {
		log.info("boardServicImpl-getList(�Խñ� ��� ȣ��): " + searchWord);
		return mapper.getList(boardlist_numbers, searchWord);
	}

	@Override
	public BoardVO getBoardVO(String board_count) {
		log.info("boardServicImpl-getBoardVO(�Խñ� ȣ��): " + board_count);
		return mapper.getBoardVO(board_count);
	}

	@Override
	public void writeBoardContentsVO(String title, String content, LocationVO location) {
		log.info("boardServicImpl-writeBoardContentsVO(�Խñ� �ۼ�): ������ " + title);
		mapper.writeBoardContentsVO(title, content);
		mapper.writeBoardLocationVO(location);
	}

	@Override
	public void writeBoardContentsVO2(LocationVO location) {
		mapper.writeBoardLocationVO(location);
	}

}
