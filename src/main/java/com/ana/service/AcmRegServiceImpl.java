package com.ana.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ana.domain.AcmVO;
import com.ana.domain.RomVO;
import com.ana.domain.UserHisVO;
import com.ana.domain.UserVO;
import com.ana.mapper.AcmRegMapper;
import com.ana.mapper.RomRegMapper;
import com.ana.mapper.UserHisMapper;
import com.ana.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AcmRegServiceImpl implements AcmRegService{
	@Setter(onMethod_= {@Autowired})
	private AcmRegMapper amapper;
	@Setter(onMethod_= {@Autowired})
	private UserMapper umapper;
	@Setter(onMethod_= {@Autowired})
	private UserHisMapper hmapper;
	

	@Override
	public void newAcmReg(AcmVO vo,String userNum) {//회원당 1.숙소추가가 되면서 2.회원히스토리정보가 추가  3.회원상태코드와 회원권한 변경
		//우선 임의로 넣어줍니다
		vo.setAcmPurl("C:\\upload\\acm\\");
		vo.setAcmPname("amc_p_1.jpg");
		System.out.println("서비스단의 "+vo.toString());
		
		amapper.newAcmReg(vo);//acmNum 반환값으로 안가지고나와도 완성되어있다! 1.
		
		UserVO u = new UserVO();
		u.setUserNum(userNum);
		u.setBizRegisterNumber(vo.getBizRegnum());
		u.setUserStatusCode("HO_PENDING"); //priv는 계속 guest다

		umapper.becomeHost(u);//이미 HO_ACTIVE면 바꾸지말고-- 21일 이후에 수정하자
		
		UserHisVO h =new UserHisVO();
		h.setUserNum(userNum);
		h.setInfoCode(1536);
		h.setChanger(userNum);
		hmapper.becomeHost(h);//1536
		
		
		
		
	}


	@Transactional
	@Override
	public boolean update1_6(String acmNum, List<String> acmOptcode,String acmDesc) {
		
		AcmVO vo = new AcmVO();
		System.out.println("트림전:"+acmNum);
		acmNum=acmNum.trim();
		System.out.println("트림후:"+acmNum);
		
		vo.setAcmNum(acmNum);//

		int sumOpt=0;
		for(int i=0;i<acmOptcode.size();i++) {
			System.out.println(acmOptcode.get(i));
			sumOpt+=Integer.parseInt(acmOptcode.get(i));
		}
		
		System.out.println("다 더한 값:"+sumOpt);
		System.out.println("숙소설명:"+acmDesc);
		vo.setAcmOptcode(sumOpt);//
		vo.setAcmDesc(acmDesc);//
		
		int rn=amapper.update1_6(vo);
		
		return rn==1;
	}


	@Override
	public boolean chkaddr(String acmDetailaddr) {
		
		return amapper.chkaddr(acmDetailaddr)==0;
	}


	@Override
	public List<AcmVO> getListHosts(String bizRegnum) {
		
		//호스트이면 사업자등록증에 있는것들을 다 가꾸와
		return amapper.getListHosts(bizRegnum);
	}


	
	
	
	

	

}
