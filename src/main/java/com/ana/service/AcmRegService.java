package com.ana.service;

import java.util.List;

import com.ana.domain.AcmVO;

public interface AcmRegService {//호스트 등록단에서 

	public List<AcmVO> getListAcms(String ownerUserNum,String acmActi);//회원번호에 대한 객실 전체가져오기

	public void newAcmReg(AcmVO vo, String userNum); //객실등록할때

	public String getAcm(String acmNum);
	
	public AcmVO getnewAcm(String acmNum);
	
	public AcmVO getpendingacm(String biznum);//pending된 acm가져오기

	public boolean update1_6(String acmNum, List<String> acmOptcode,String acmDesc);

	//	public boolean remove(String acmNum);

	public boolean chkaddr(String acmDetailaddr);
	
	public boolean chkbizused(String bizRegnum, String userNum);
	
	//숙소삭제
	public int removeAcm(String acmNum, String userNum, String userPriv);
	//숙소 재신청
	public boolean reregAcm(String acmNum);
	//숙소 변경
	public boolean modiAcm(AcmVO vo);
	
}
