package com.ana.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class RevPostVO {
	
	private String pstNum;
	private String brdCode;
	private String title;
	private String userNum;
	private Date regDate;
	private Date updateDate;
	private RevDetailVO revDetail;
	{revDetail = new RevDetailVO();}
	

}
