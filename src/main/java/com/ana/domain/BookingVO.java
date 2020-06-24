package com.ana.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BookingVO {

	private String bookInt;
	private String userInt;
	private String romInt;
	private Date bookDate;
	private Date checkinDate;
	private Date chekoutDate;
	private int staydays;
	private int guest;
	private int bookPrice;
	private int deposit;
	private char canceled;
	private String expectedArr;
	private char smoking;
	private String request;
	private String realArr;

}