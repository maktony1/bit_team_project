package bit.project.restfull.service;

import java.util.List;

import bit.project.restfull.vo.BoardContentsVO;
import bit.project.restfull.vo.BoardVO;
import bit.project.restfull.vo.LocationVO;

public interface BoardService {
	public List<LocationVO> getLocList(String searchWord);
	public List<BoardVO> getList(String searchWord);
	List<BoardContentsVO> getContents(String searchWord);
}
