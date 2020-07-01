package com.ana.domain;

import java.util.Date;

import lombok.Data;

@Data
public class RevPostVO {
	
	private String pstNum;
	private String brdCode;
	private String pTitle;
	private String userNum;
	private String pRegDate;
	private Date pUpdateDate;
	private RevDetailVO revDetail;
	{revDetail = new RevDetailVO();}
	
	
}
