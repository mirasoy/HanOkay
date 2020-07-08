package com.ana.domain;

import lombok.Data;

@Data
public class RomVO {
   
   private String romNum;
   private String acmNum;
   private String romName;

   private Integer romCapa;
   private String bedType;
   private Integer bedCnt;
   private Integer romSize;
   private Integer romPrice;
   private String romPurl;
   private String romLoca;
   private String romType;
}