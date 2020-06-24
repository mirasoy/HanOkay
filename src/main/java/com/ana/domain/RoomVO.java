package com.ana.domain;

import java.util.Date;
import lombok.Data;

@Data
public class RoomVO {
   
   private String romNum;
   private String acmNum;
   private String roomName;
   private int capacity;
   private String bedType;
   private int bedCnt;
   private int romSize;
   private Date startDate;
   private Date endDate;
   private int price;
   private String romUrl;
   private String romLocainfo;


}
