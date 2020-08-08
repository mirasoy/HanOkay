package com.ana.domain;

import java.util.Date;

import lombok.Data;

@Data
public class UserHisVO {

	private String serialNum;
	private String userNum;
	private Integer infoCode;
	private Date infoUpdatedate;
	private String changer;
	
}
