
package com.ana.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BookingInfoVO  {
	    
	private String 	bookNum;
	private String 	userNum;
	private Date 	bookDate;
	private Date 	checkinDate;
	private Date 	checkoutDate;
	private Integer staydays;
	private Integer guest;
	private Integer bookPrice;
	private String 	expectedArr;
	private String 	smoking;
	private String 	request;
	private String 	bookerLastname;
	private String 	bookerFirstname;

	private String 	payNum;
	private String 	payMethod;
	private Date 	payTime;
	private String 	price;
	private String 	vat;
	private String 	subtotal;
	private String 	coupon;
	private String 	mileage;
	private String 	discount;
	private String 	total;
	private String 	payStatus;
	
	private	String	romName;
	private	Integer	romCapa;
	private	String	bedType;
	private	Integer	bedCnt;
	private	String	romPurl;
	private	String	romPname;
	private	String	romType;
	
	private	String 	acmNum;
	private	String	acmName;
	private	String	acmCity;
	private	String	acmDistr;
	private	String	acmDetailaddr;
	private Long	bizRegnum;
	private	String	repPhone;
	private	String	checkinTime;
	private	String	checkoutTime;
	private	String	acmEmail;
	private	String	acmPurl;
	private	String 	acmPname;
	private	String	latitude;
	private	String	longitude;

}