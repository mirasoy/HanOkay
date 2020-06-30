package com.ana.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ana.domain.AcmOptionVO;
import com.ana.mapper.AcmOptionMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AcmOptionServiceImpl implements AcmOptionService{
	
	private AcmOptionMapper mapper;

	@Override
	public List<AcmOptionVO> getList(String acmNum) {
		log.info("getList...........");
		return mapper.getList(acmNum);
	}
	
	@Override
	public int register(AcmOptionVO acm) {
		log.info("register......" + acm);
		return mapper.insert(acm);
	}

	@Override
	public AcmOptionVO get(String acmNum) {
		log.info("get......"+acmNum);
		return mapper.read(acmNum);
	}

	@Override
	public boolean modify(AcmOptionVO acm) {
		log.info("modify......" + acm);
		return mapper.update(acm)==1;
	}

	@Override
	public boolean remove(String acmNum, String acmOptcode) {
		log.info("remove......" + acmNum);
		return mapper.delete(acmNum, acmOptcode)==1;
	}

}
