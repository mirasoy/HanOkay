package com.ana.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ana.domain.AcmVO;
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

	@Override
	public boolean moditoHost(String userNum, String bizRegnum) {
		//회원 호스트 업그레이드
		UserVO vo = new UserVO();
		vo.setUserNum(userNum);
		vo.setUserPriv("HOST");
		vo.setUserStatusCode("HO_ACTIVE");
		
		//숙소 상태도 pending-> active/open 으로 update
		//AcmVO acm = new AcmVO();
		
		AcmVO acm= new AcmVO();
		acm.setAcmStatus("OPEN");
		acm.setAcmActi("ACTIVE");
		acm.setBizRegnum(bizRegnum);
		
		return umapper.moditoHost(vo)*amapper.moditoAcmActive(acm)==1;
	}

	@Override
	public boolean moditoGuest(String userNum) {
		
		UserVO vo = new UserVO();
		vo.setUserNum(userNum);
		vo.setUserPriv("GUEST");
		vo.setUserStatusCode("ACTIVE");
		vo.setBizRegisterNumber("");
		
		return umapper.moditoGuest(vo)==1;
	}

	@Override//pending, active, inactive 숙소들을 가져온다
	public List<UserAcmVO> getadminListAcms(String acmActi) {
		List<UserAcmVO> acms=amapper.getadminListAcms(acmActi);
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
	public UserAcmVO getpendingUserAcms(String bizRegnum) {
		// TODO Auto-generated method stub
		return amapper.getpendingUserAcms(bizRegnum);
	}
	

}
