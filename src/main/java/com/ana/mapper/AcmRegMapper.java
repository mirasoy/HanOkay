package com.ana.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ana.domain.AcmVO;

public interface AcmRegMapper {
	
	public List<AcmVO> getListHosts(String bizRegnum);
	
	public void newAcmReg(AcmVO vo);//숙소등록**
	
	public String getAcm(String acmNum);//숙소정보 가져오기
	
	public int delete(String acmNum);
	
	
	public int update1_6(AcmVO vo);//opt와 desc update
	
	
	public int chkaddr(String acmDetailaddr);//중복검사


}
