package com.ana.domain;

import java.util.Date;
import java.util.List;

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
	private String purl;
	private String pname;
	private Date pregdate;
	private String acmpurl;
	private String acmpname;
	
	
	private List<RevPicVO> picList;
}
