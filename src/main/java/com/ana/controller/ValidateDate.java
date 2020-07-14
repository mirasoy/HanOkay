package com.ana.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;

public class ValidateDate {
	public  static  void  main(String[] args){

	     ValidateDate  validateDate = new  ValidateDate();
	     System.out.println(validateDate.validationDate("2018-12a^32"));

	   }

	   public  boolean  validationDate(String  checkDate){

	     try{
	          SimpleDateFormat  dateFormat = new  SimpleDateFormat("yyyy-MM-dd");

	          dateFormat.setLenient(false);
	          dateFormat.parse(checkDate);
	          return  true;

	       }catch (ParseException  e){
	         return  false;
	       }

	  }
}
