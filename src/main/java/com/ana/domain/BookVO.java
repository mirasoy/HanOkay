package com.ana.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class BookVO {	
	
	private String acmName;	
	private String bookNum;
	private String romNum;	
	private String bookStatus;	
	private Date checkinDate;
	private Date checkoutDate;
	private Integer bookPrice;
	private String acmPurl;
	private String acmPname;

}