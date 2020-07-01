package com.ana.domain;

import java.util.Date;

import lombok.Data;

@Data
public class RevVO {
	
	private String pstNum;
	private String brdCode;
	private String pTitle;
	private String userNum;
	private Date pRegDate;
	private Date pUpdateDate;
	private String revPurl;
	private Integer stisf;
	private String acmNum;
	private String bookNum;
	private String content;

}
