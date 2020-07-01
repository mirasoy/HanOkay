package com.ana.domain;

import java.util.Date;

import lombok.Data;

@Data
public class RevPostVO {
	
	private String pstNum;
	private String brdCode;
	private String title;
	private String userNum;
	private String regDate;
	private Date updateDate;
	private RevDetailVO revDetail;
	{revDetail = new RevDetailVO();}
	
	
}
