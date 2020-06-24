package com.ana.domain;

import java.util.Date;

import lombok.Data;

@Data
public class UserVO {
   
   private String userNum;
   private String email;
   private String pwd;
   private String u_lastname;
   private String u_fstname;
   private Long u_phone;
   private Date u_regdate;
   private Date u_birthday;
   private String facebookid;
   private String googleid;
    
}
