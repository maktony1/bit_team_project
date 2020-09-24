package bit.project.restfull.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@NoArgsConstructor
public class LocationVO {
	public int getBoard_count() {
		return board_count;
	}
	public void setBoard_count(int board_count) {
		this.board_count = board_count;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
	public static org.apache.log4j.Logger getLog() {
		return log;
	}
	private int board_count;
	private String address;
	private String details;
	private String lat;	
	private String lng;
}
