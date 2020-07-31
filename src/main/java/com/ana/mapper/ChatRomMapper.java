package com.ana.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ana.domain.ChatRomVO;
import com.ana.domain.MsgVO;

public interface ChatRomMapper {
	
	public void startChat(ChatRomVO vo);
	
	public int updateChatrom(@Param("content") String content,@Param("userNum") String userNum,@Param("chatromnum") String chatromnum);
	
	public List<ChatRomVO> readChatlist(String userNum1);
	
	public ChatRomVO readChat(String userNum1);
	
}
