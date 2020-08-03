package com.ana.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ana.domain.AcmVO;
import com.ana.domain.RomVO;
import com.ana.domain.UserAcmVO;
import com.ana.domain.UserVO;
import com.ana.mapper.AcmRegMapper;
import com.ana.mapper.RomRegMapper;
import com.ana.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class AdminServiceImpl implements AdminService{
	@Setter(onMethod_= {@Autowired})
	private UserMapper umapper;
	
	@Setter(onMethod_= {@Autowired})
	private AcmRegMapper amapper;

	@Setter(onMethod_= {@Autowired})
	private RomRegMapper rmapper;



	@Override
	public List<UserVO> getAll(String acmNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserVO getUser(String userNum) {
		// TODO Auto-generated method stub
		return umapper.getUser(userNum);
	}
	
	@Transactional
	@Override
	public boolean moditoHost(String userNum, String acmNum) {
		System.out.println(userNum);
		System.out.println(acmNum);
		//회원 호스트 업그레이드
		UserVO vo = new UserVO();
		vo.setUserNum(userNum);
		vo.setUserPriv("HOST");
		vo.setUserStatusCode("HO_ACTIVE");
		int n=umapper.moditoHost(vo);
		System.out.println(n);
		
		
		//숙소 상태도 pending-> active/open 으로 update
		AcmVO acm= new AcmVO();
		acm.setAcmStatus("OPEN");
		acm.setAcmActi("ACTIVE");
		acm.setAcmNum(acmNum);
		
		amapper.moditoAcmActive(acm);//이게 문제생기네
		
		//숙소에 딸린 객실들도 active/open으로 update
		RomVO rom= new RomVO();
		rom.setRomStatus("OPEN");
		rom.setRomActi("ACTIVE");
		rom.setAcmNum(acmNum);
		
		rmapper.moditoRomActive(rom);
		
		return true;//우선 돌아간다고 하자
	}

	@Override
	public boolean moditoGuest(String userNum, String acmNum) {
		System.out.println(userNum);
		System.out.println(acmNum);
		
//		UserVO vo = new UserVO();
//		vo.setUserNum(userNum);
//		vo.setUserPriv("GUEST");
//		vo.setUserStatusCode("ACTIVE");
//		vo.setBizRegisterNumber(""); //자기자신이 삭제한게 아니면 NULL화시키지 않는다..우선
//		
//		umapper.moditoGuest(vo);
		////////////////
				
		
		//숙소 상태도 INACTIVE-> INACTIVE/DENIED
		AcmVO acm= new AcmVO();
		acm.setAcmActi("PENDING");
		acm.setAcmStatus("DENIED");
		acm.setAcmNum(acmNum);
		
		amapper.moditoAcmActive(acm);//이게 문제생기네
		
		//숙소에 딸린 객실들도 INACTIVE-> INACTIVE/DENIED
		RomVO rom= new RomVO();
		rom.setRomActi("PENDING");
		rom.setRomStatus("DENIED");
		rom.setAcmNum(acmNum);
		
		rmapper.moditoRomActive(rom);
		
		return true;//우선 돌아간다고 하자
	}

	@Override//pending, active, inactive 숙소들을 가져온다
	public List<UserAcmVO> getadminListAcms(String acmActi) {
		List<UserAcmVO> acms=amapper.getadminListAcms(acmActi.trim());
		System.out.println("서비스단:"+acmActi);
		int romsize;
		
		for(int i=0;i<acms.size();i++) {
			romsize=rmapper.getRomsize(acms.get(i).getAcmNum());//select count(*) from trom	where acm_num=#{acmNum}
			acms.get(i).setRomSize(romsize);
		}
		
		return acms; 
	}

	@Override//active, ho_pending, ho_active의 회원list를 가져온다
	public List<UserVO> getadminListUsers(String userStatusCode) {
		
		return umapper.getadminListUsers(userStatusCode);
	}

	@Override
	public UserAcmVO getUserAcms(String acmNum) {
		// TODO Auto-generated method stub
		return amapper.getUserAcms(acmNum);
	}

	@Override
	public List<RomVO> getRoms(String acmNum) {
		return rmapper.getRomwithAcm(acmNum);
	}

	@Override
	public UserAcmVO getPendingUserAcms(String bizRegnum) {
		String acmActi="PENDING";
		System.out.println("서비스단 펜딩");
		return amapper.getPendingUserAcms(bizRegnum,acmActi);
	}

	@Override
	public boolean activeAcm(String acmNum) {
		//숙소 상태도 INACTIVE-> INACTIVE/DENIED
		AcmVO acm= new AcmVO();
		acm.setAcmStatus("OPEN");
		acm.setAcmActi("ACTIVE");
		acm.setAcmNum(acmNum);
		
		amapper.moditoAcmActive(acm);
		
		//숙소에 딸린 객실들도 active/open으로 update
		RomVO rom= new RomVO();
		rom.setRomStatus("OPEN");
		rom.setRomActi("ACTIVE");
		rom.setAcmNum(acmNum);
		
		rmapper.moditoRomActive(rom);
		
		return true;
	}

	@Override
	public boolean inactiveAcm(String acmNum) {
		AcmVO acm= new AcmVO();
		acm.setAcmActi("INACTIVE");
		acm.setAcmStatus("DENIED");
		acm.setAcmNum(acmNum);
		
		amapper.moditoAcmActive(acm);//이게 문제생기네
		
		//숙소에 딸린 객실들도 INACTIVE-> INACTIVE/DENIED
		RomVO rom= new RomVO();
		rom.setRomActi("INACTIVE");
		rom.setRomStatus("DENIED");
		rom.setAcmNum(acmNum);
		
		rmapper.moditoRomActive(rom);
		
		return true;
	}

	@Override
	public UserAcmVO getUserNumAcm(String userNum) {
		return amapper.getUserNumAcm(userNum);
	}

	

}
