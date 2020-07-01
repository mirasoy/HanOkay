package com.ana.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BookingVO {

	private String bookNum;
	private String userNum;
	private String romNum;
	private Date bookDate;
	private Date checkinDate;
	private Date chekoutDate;
	private Integer staydays;
	private Integer guest;
	private Integer bookPrice;
	private Integer deposit;
	private Character canceled;
	private String expectedArr;
	private Character smoking;
	private String request;
	private String realArr;
	
	
}