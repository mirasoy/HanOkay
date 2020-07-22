package com.ana.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class test {
	public static void main(String[] args) {
		String[] tmp = getDate("2020-01-02", "");
		System.out.println(tmp[0] + " / " + tmp[1]);
	}
	
	public static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	public static Calendar cal = Calendar.getInstance();
	public static String[] getDate(String checkin, String checkout) {
		
		//1. 체크인 체크아웃 값이 있는 경우
		if(!checkin.equals("") && !checkout.equals("")) {
			checkin = sdf.format(set(checkin).getTime());
			checkout = sdf.format(set(checkout).getTime());
			
			//1-1. 날짜가 유효하지 않은 경우: 체크아웃이 체크인보다 이전인 경우, 체크인이 오늘보다 이전인 경우
			if( set(checkout).compareTo(set(checkin))!=1 || set(checkin).compareTo(cal)!=1 )  // 정상일 때 1
				return setDefault();
			
		//2. 체크인 값이 없을 경우
		}else if(checkin.equals("") && !checkout.equals("")) {
			cal = set(checkout);
			checkout = sdf.format(cal.getTime());
			cal.add(Calendar.DATE, -1);
			checkin = sdf.format(cal.getTime());
		
		//3. 체크아웃 값이 없을 경우
		}else if(!checkin.equals("") && checkout.equals("")) {
			cal = set(checkin);
			checkin = sdf.format(cal.getTime());
			cal.add(Calendar.DATE, 1);
			checkout = sdf.format(cal.getTime());
		
		//4. 체크인 체크아웃 값이 없을 경우
		}else {
			return setDefault();
		}
		
		String[] result = {checkin, checkout} ;
		return result;
		
	}
	
	public static Calendar set(String date) {
		Calendar cal = Calendar.getInstance();
		cal.clear();
		String[] tmp = date.split("-");
		cal.set(Integer.parseInt(tmp[0]), Integer.parseInt(tmp[1])-1, Integer.parseInt(tmp[2]));
		return cal;
	}
	
	public static String[] setDefault(){
		Calendar cal1 = Calendar.getInstance();
		Calendar cal2 = Calendar.getInstance();
		cal2.add(Calendar.DATE, 1);
		String[] rst = {sdf.format(cal1.getTime()), sdf.format(cal2.getTime())};
		return rst;
	}
}
