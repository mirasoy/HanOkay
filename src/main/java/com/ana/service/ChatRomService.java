package com.ana.service;

import java.util.List;


import com.ana.domain.ChatRomVO;

public interface ChatRomService {
	
	public ChatRomVO readChat(String chatromnum);
	public List<ChatRomVO> readChatlist(String userNum1);
	public String startChat(ChatRomVO vo);
	public int updateChatrom(String content, String userNum, String chatromnum);
	public List<ChatRomVO> findChatRom(String userNum1, String userNum2);
	
}
