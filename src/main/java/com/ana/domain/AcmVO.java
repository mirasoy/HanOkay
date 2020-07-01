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
	private Long repPhone;
	private Long bizRegnum;
	private String checkinTime;
	private String checkoutTime;
	private Date acmRegdate;
	private Date acmUpdatedate;
	private Long acmPhone2;
	private Long acmFax;
	private String acmEmail;
	private String acmDesc;
	private String acmPurl;
	private String acmPurl1;
	private String acmPurl2;
	private String acmPurl3;
	private String acmPurl4;
	private String acmPurl5;
	private String acmPurl6;
	private RomVO rom;
}
