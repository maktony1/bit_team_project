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
public class MemberVO {
	private String member_id;
	private String pw;	
	private String name;	
	private String email;	
	private int phone;
	private Timestamp date;
	
}
