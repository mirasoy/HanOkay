package com.ana.service;

import java.util.List;

import com.ana.domain.MsgVO;

public interface MsgService {
	
	public List<MsgVO> readConversation( String userNum1,  String userNum2);
	
	public int marksRead(String MsgNum);
	
	public int unreadMsg(String userNum);
	
	public void sendMsg(MsgVO vo);
}
