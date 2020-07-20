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
	private Integer stisf;
	private String acmNum;
	private String bookNum;
	private String content;
	private String loginUser;
	private String acmName;
	private String checkInDay;
	private String checkOutDay;
	private String pusl;
	private String pname;
	private Date pregdate;
}
