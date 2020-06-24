package com.ana.domain;

import java.util.Date;

import lombok.Data;

@Data
public class AcmVO {
	
	private String acm_Num;
	private String acm_Name;
	private String acm_City;
	private String acm_Distr;
	private String acm_Detailaddr;
	private Long rep_Phone;
	private Long biz_Regnum;
	private String checkin_Time;
	private String checkout_Time;
	private Date acm_Regdate;
	private Date acm_Updatedate;
	private Long acm_phone2;
	private Long acm_Fax;
	private String acm_Email;
	private String acm_Desc;

}
