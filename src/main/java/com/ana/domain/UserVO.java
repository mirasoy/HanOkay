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
   private String uPhone;
   private Date uBirthday;
   private String uPriv;
   private String regMethod;
  
}
