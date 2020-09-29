package bit.project.restfull.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
//메인 게시글 객체.
public class BoardContentsVO {
	private int board_count;
	private String title;	
	private String hit;
	private String contents;
	private Timestamp dates;
	private LocationVO location;
}
