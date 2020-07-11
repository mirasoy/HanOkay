package com.ana.domain;

import java.util.Date;

import lombok.Data;

@Data
public class UserVO {

	private String userNum;
	private String email;
	private String pwd;
	private String fstname;
	private String lastname;
	private String userPhone;
	private Date birthday;
	private String userPriv;
	private String regMethod;
	
	public UserVO() {}
	
	public UserVO(String userNum, String email, String pwd, String lastname, String fstname, String userPhone,
			Date birthday, String userPriv, String regMethod) {
		this.userNum = userNum;
		this.email = email;
		this.pwd = pwd;
		this.fstname = fstname;
		this.lastname = lastname;
		this.userPhone = userPhone;
		this.birthday = birthday;
		this.userPriv = userPriv;
		this.regMethod = regMethod;
	}
}
