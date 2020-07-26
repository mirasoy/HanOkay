package com.ana.service;

import org.springframework.stereotype.Service;

import com.ana.mapper.UserHisMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class UserHistoryServiceImpl implements UserHistoryService {
	
	UserHisMapper userHisMapper;
	
	@Override
	public void insertStatCodeChangeHistory(String userNum, String infoCode, String changer) {
		log.info("***insert"+ userNum+ "'s status change history by "+ changer + "to"+ infoCode);
		userHisMapper.insertStatCodeChangeHistory(userNum, infoCode, changer);
		
	}

	

}
