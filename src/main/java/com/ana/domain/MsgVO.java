package com.ana.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MsgVO {

	private String chatromnum;
	private String msgNum;
	private String unumFrom;
	private String unumTo;
	private String msgContent;
	private String readStatus;
	private Date msgDate;

}

