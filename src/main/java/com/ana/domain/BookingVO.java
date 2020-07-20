
package com.ana.domain;

import java.util.Date;

/*import javax.validation.constraints.Email;*/

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class BookingVO {


	private String bookNum;
	private String userNum;
	private String romNum;
	private Date bookDate;
	private Date checkinDate;
	private Date checkoutDate;
	private Integer staydays;
	private Integer guest;
	private Integer bookPrice;
	private String expectedArr;
	private String smoking;
	private String request;
	private String bookerLastname;
	private String bookerFirstname;
	private String bookerEmail;
	private String bookerPhone;
	private String bookStatus;

}