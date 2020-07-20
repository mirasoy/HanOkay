package com.ana.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BookStatusVO {

   private String bookNum;
   private String bookStatus;
   private Date updateDate;
   private String editer;

}

