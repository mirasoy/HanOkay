package com.ana.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.ana.domain.AcmVO;
import com.ana.domain.CodeVO;
import com.ana.domain.PaymentVO;
import com.ana.mapper.HostStatsMapper;
import com.ana.mapper.RevPostMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class HostStatsServiceImp implements HostStatsService {

	HostStatsMapper mapper ;
	
	@Override
	public List<PaymentVO> getAllSales(String user) {
		// TODO Auto-generated method stub
		return mapper.getAllSales(user);
	}

	@Override
	public List<PaymentVO> getAcmSales(String acmNum) {
		// TODO Auto-generated method stub
		return mapper.getAcmSales(acmNum);
	}

	@Override
	public List<PaymentVO> getPeriodAllSales(String user, String start, String end) {
		// TODO Auto-generated method stub
		return mapper.getPeriodAllSales(user,start,end);
	}

	@Override
	public List<PaymentVO> getPeriodAcmSales(String amcNum, String start, String end) {
		// TODO Auto-generated method stub
		return mapper.getPeriodAcmSales(amcNum,start,end);
	}

	@Override
	public List<AcmVO> getAllAcm(String bizRegisterNumber) {
		// TODO Auto-generated method stub
		return mapper.getAllAcm(bizRegisterNumber);
	}


	@Override
	public List<AcmVO> getAcmRank(String user, String criteria) {
		// TODO Auto-generated method stub
		return mapper.getAcmRank(user,criteria);
	}
	
	
	
}
