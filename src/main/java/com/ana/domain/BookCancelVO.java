package com.ana.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BookCancelVO {

	
	private String acmName;	
	private String bookNum;
	private String romNum;	
	private Date checkinDate;
	private Date checkoutDate;
	private Integer bookPrice;
	
	
}
