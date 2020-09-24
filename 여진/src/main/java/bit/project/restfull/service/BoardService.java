package bit.project.restfull.service;

import java.util.List;

import bit.project.restfull.vo.BoardContentsVO;
import bit.project.restfull.vo.BoardVO;
import bit.project.restfull.vo.LocationVO;

public interface BoardService {
	List<BoardContentsVO> getList(int boardlist_numbers, String searchWord);
	public BoardVO getBoardVO(String board_count);
	void writeBoardContentsVO(String title, String content, LocationVO location);
	void writeBoardContentsVO2(LocationVO location);
}
