package com.ana.domain;

import java.util.Date;

import lombok.Data;

@Data
public class UserAcmVO {
	
	private String userNum;
	private String userFstName;
	private String userLastName;
	private String userPriv;
	private String userProfilePicUrl;
	private String userProfilePicName;
	private String userStatusCode;
	
	//////
//	private String bizRegisterNumber;
	private String bizRegnum;
	/////
	
	private String acmNum;
	private String acmName;
	private String acmCity;
	private String acmDistr;
	private String acmDetailaddr;
	
	private String repPhone;
	private String checkinTime;
	private String checkoutTime;
	private Date acmRegdate;
	
	private Date acmUpdatedate;
	private String subPhone;
	private String acmFax;
	private String acmEmail;
	private String acmDesc;
	
	private String acmPurl;
	private String acmPname;
	private String latitude;
	private String longitude;
	private String acmType;
	
	private String acmActi;
	private String acmStatus;
	private Integer acmOptcode;
	
	private int romSize;
}
