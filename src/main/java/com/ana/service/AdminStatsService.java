package com.ana.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ana.domain.AcmVO;
import com.ana.domain.CodeVO;
import com.ana.domain.PaymentVO;

public interface AdminStatsService {
	
	
	public List<AcmVO> getAcmRank(@Param("user")String user,@Param("criteria")String criteria );
	
	
	public List<PaymentVO> getAllSales(String user);
	public List<PaymentVO> getAcmSales(String acmNum);
	public List<PaymentVO> getPeriodAllSales(@Param("user")String user, @Param("start")String start, @Param("end")String end);
	public List<PaymentVO> getPeriodAcmSales(@Param("amcNum")String amcNum, @Param("start")String start, @Param("end")String end);
	public List<AcmVO> getAllAcm(String bizRegisterNumber);
	
	
	/////////어드민//////////
	public List<PaymentVO> getPeriodAllSalesAd(@Param("start")String start, @Param("end")String end);
	public List<AcmVO> getAcmRankAd(@Param("criteria")String criteria);
	
	
	public List<PaymentVO> getAllSalesAd();//누적매출 다 가져오기
	public List<AcmVO> getAllAcmAd();
	



}
