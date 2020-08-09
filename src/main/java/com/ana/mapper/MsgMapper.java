package com.ana.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ana.domain.MsgVO;

public interface MsgMapper {
	
	public void sendMsg(MsgVO vo);
	
	public int marksRead(String MsgNum);
	
	public Integer unreadMsg(String userNum);
	
	public List<MsgVO> readConversation(@Param("userNum1") String userNum1, @Param("userNum2") String userNum2);
}
