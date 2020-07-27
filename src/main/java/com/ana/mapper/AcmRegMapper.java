package com.ana.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ana.domain.AcmVO;
import com.ana.domain.UserAcmVO;

public interface AcmRegMapper {
	
	public List<AcmVO> getListAcms(@Param("bizRegnum")String bizRegnum, @Param("acmActi")String acmActi);
	
	public void newAcmReg(AcmVO vo);//숙소등록**
	
	public String getAcm(String acmNum);//숙소정보 가져오기
	
	public AcmVO getnewAcm(String acmNum);//숙소정보 가져오기
	
	public AcmVO getpendingacm(String bizRegisterNumber);
	
	public int delete(String acmNum);
	
	
	public int update1_6(AcmVO vo);//opt와 desc update
	
	
	public int chkaddr(String acmDetailaddr);//중복검사


	
	////////////어드민단////////////
	public List<UserAcmVO> getadminListAcms(String acmActi);
}
