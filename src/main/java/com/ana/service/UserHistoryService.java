package com.ana.service;

public interface UserHistoryService {
	
	//u_info_history 테이블에 회원상태변경기록을 남기게하는 메서드
	public void insertStatCodeChangeHistory(String userNum, String infoCode, String changer);
}
