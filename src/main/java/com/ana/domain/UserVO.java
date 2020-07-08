package com.ana.domain;

import java.util.Date;

import lombok.Data;

@Data
public class UserVO {

	private String userNum;
	private String email;
	private String pwd;
	private String lastname;
	private String fstname;
	private String userPhone;
	private Date birthday;
	private String userPriv;
	private String regMethod;
}
