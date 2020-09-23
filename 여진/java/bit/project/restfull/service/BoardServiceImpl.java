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
	public List<LocationVO> getLocList(String searchWord) {
		log.info("boardServicImpl-getLocList: " + searchWord);
		return mapper.getLocList(searchWord);
	}

	@Override
	public List<BoardVO> getList(String searchWord) {
		log.info("boardServicImpl-getList: " + searchWord);
		return mapper.getList(searchWord);
	}

	@Override
	public List<BoardContentsVO> getContents(String searchWord) {
		log.info("boardServicImpl-getContents: " + searchWord);
		return mapper.getContents(searchWord);
	}

}
