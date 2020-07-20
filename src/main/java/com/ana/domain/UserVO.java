package com.ana.domain;

import java.util.Date;

import lombok.Data;

@Data
public class UserVO {

	private String userNum;
	private String userEmail;
	private String userPwd;
	private String userFstName;
	private String userLastName;
	private String userPhone;
	private Date userBirthday;
	private String userRegisterMethod;
	private String userPriv;
	private String userProfilePicUrl;
	private String userProfilePicName;
	private String userIntroduction;
	private String userLanguage;
	private String userStatusCode;
	private String bizRegisterNumber;
	private String bizRegisterPicUrl;
	private String userAuthCode;
}
