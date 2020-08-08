
package com.ana.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PaymentVO {
	
	private String bookNum;
	private String payNum;
	private String payMethod;
	private Date payTime;
	private String acmNum;
	private String romNum;
	private String price;
	private String staydays;
	private String vat;
	private String subtotal;
	private String coupon;
	private String mileage;
	private String discount;
	private String total;
	private String payStatus;
	private String userNum;
	
	private String acmName;
	private String romName;
	
	private String sumTotal;
}