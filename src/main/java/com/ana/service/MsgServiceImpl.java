package com.ana.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ana.domain.CodeVO;
import com.ana.domain.MsgVO;
import com.ana.mapper.CodeMapper;
import com.ana.mapper.MsgMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MsgServiceImpl implements MsgService{
	
	private MsgMapper mapper;

	@Override
	public List<MsgVO> readConversation(String userNum1, String userNum2) {
	
			return mapper.readConversation(userNum1, userNum2);
	}

	@Override
	public void sendMsg(MsgVO vo) {
		
		mapper.sendMsg(vo);
		
	}

	@Override
	public int marksRead(String MsgNum) {
		
		System.out.println("읽음처리도미"+MsgNum);
		// TODO Auto-generated method stub
		return mapper.marksRead(MsgNum);
	}

	@Override
	public int unreadMsg(String userNum) {
		// TODO Auto-generated method stub
		return mapper.unreadMsg(userNum);
	}
	


}
