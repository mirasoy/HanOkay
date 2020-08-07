
package com.ana.domain;

import java.util.Date;

/*import javax.validation.constraints.Email;*/

import lombok.Data;

@Data
public class BookingVO {

	private String bookNum;
	private String userNum;//예약한 사람번호
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
	private String bookerLastname;//예약자 정보
	private String bookerFirstname;
	private String bookerEmail;
	private String bookerPhone;
	private String bookStatus;
	
	//소림추가
	private String acmName;
	private String acmNum;
	private String romName;
}