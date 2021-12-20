package co.micol.potal.board.service;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
@Setter
@Getter
public class BoardVO {
	private int no;
	private String writer;	// member id
	
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asian/Seoul")
	private Date wdate;
	private String title;
	private String subject;
	private int hit;
	
	private String name; // member name
	
}
