package com.ana.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ana.domain.AcmVO;
import com.ana.mapper.AcmMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AcmServiceImpl implements AcmService{
	
	private AcmMapper mapper;
	
	@Override
	public void register(AcmVO acm) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public AcmVO get(String Acm_Num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean modify(AcmVO acm) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean remove(String Acm_Num) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<AcmVO> getList() {
		// TODO Auto-generated method stub
		return null;
	}

}
