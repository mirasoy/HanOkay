package com.ana.domain;

import java.util.Date;

import lombok.Data;

@Data
public class RomVO {
   
	private String acmNum;
	private String romNum;
	private String romName;

	private Integer romCapa;
	private String bedType;
	private Integer bedCnt;
	private Integer romSize;
	private Integer romPrice;
	private String romPurl;
	private String romPname;
	
	private String romType;
	private String romActi;
	private String romStatus;
	private String romOptcode;
	private Date romRegdate;
	private Date romUpdatedate;



}
