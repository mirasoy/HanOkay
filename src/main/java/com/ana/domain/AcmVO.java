package com.ana.domain;

import java.util.Date;

import lombok.Data;

@Data
public class AcmVO {
	
	private String acmNum;
	private String acmName;
	private String acmCity;
	private String acmDistr;
	private String acmDetailaddr;
	private long repPhone;
	private long bizRegnum;
	private String checkinTime;
	private String checkoutTime;
	private Date acmRegdate;
	private Date acmUpdatedate;
	private long phone2;
	private long acmFax;
	private String acmEmail;
	private String acmDesc;
}
