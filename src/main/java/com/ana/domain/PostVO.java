package com.ana.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PostVO {
	
	private String brdCode;
	private String userNum;
	private String pstNum;
	private String pTitle;
	private String pContent;
	private Date pRegDate;
	private Date pUpdateDate;

}
