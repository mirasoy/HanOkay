package com.ana.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QnaVO {
	
	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date updateDate;
	

}
