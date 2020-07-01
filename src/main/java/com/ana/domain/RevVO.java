package com.ana.domain;

import java.util.Date;

import lombok.Data;

@Data
public class RevVO {
	
	private String pstNum;
	private String brdCode;
	private String title;
	private String userNum;
	private Date regDate;
	private Date updateDate;
	private String revPurl;
	private Integer stisf;
	private String acmNum;
	private String bookNum;
	private String content;
	private String loginUser;
	private String acmName;
	private String checkInDay;
	private String CheckOutDay;
	
}
