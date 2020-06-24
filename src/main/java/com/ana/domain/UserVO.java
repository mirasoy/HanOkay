package com.ana.domain;

import java.util.Date;

import lombok.Data;

@Data
public class UserVO {
   
   private String userNum;
   private String email;
   private String pwd;
   private String uLastname;
   private String uFstname;
   private Long uPhone;
   private Date uRegdate;
   private Date uBirthday;
   private String facebookId;
   private String googleId;
}
