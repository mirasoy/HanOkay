package com.ana.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ana.domain.ChatRomVO;
import com.ana.domain.CodeVO;
import com.ana.domain.MsgVO;
import com.ana.mapper.ChatRomMapper;
import com.ana.mapper.CodeMapper;
import com.ana.mapper.MsgMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Service
@AllArgsConstructor
public class ChatRomServiceImpl implements ChatRomService{
	
	private ChatRomMapper mapper;

	@Override
	public List<ChatRomVO> readChatlist(String userNum1) {
		// TODO Auto-generated method stub
		return mapper.readChatlist(userNum1);
	}

	@Override
	public String startChat(ChatRomVO vo) {
		// TODO Auto-generated method stub
		mapper.startChat(vo);
		
		return vo.getChatromnum();
	}

	@Override
	public int updateChatrom(String content, String userNum, String chatromnum) {
		// TODO Auto-generated method stub
		return mapper.updateChatrom(content, userNum, chatromnum);
	}

	@Override
	public ChatRomVO readChat(String chatromnum) {
		// TODO Auto-generated method stub
		return mapper.readChat(chatromnum);
	}

	


}
