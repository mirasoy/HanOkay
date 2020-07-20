package com.ana.service;

import java.util.List;

import com.ana.domain.AcmVO;

public interface AcmRegService {//호스트 등록단에서 

//	public List<AcmVO> getList(String userNum);//회원번호에 대한 객실 전체가져오기

	public void register(AcmVO vo); //객실등록할때

//	public AcmVO get(String romNum);
//
	public boolean update1_6(String acmNum, List<String> acmOptcode,String acmDesc);
//
//	public boolean remove(String acmNum);

	public boolean chkaddr(String acmDetailaddr);
	
}
