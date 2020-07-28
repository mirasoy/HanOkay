package com.ana.service;

import java.util.List;

import com.ana.domain.AcmVO;
import com.ana.domain.RomVO;
import com.ana.domain.UserAcmVO;
import com.ana.domain.UserVO;

public interface AdminService {

	public List<UserVO> getAll(String acmNum);

	//숙소관리
	public List<UserAcmVO> getadminListAcms(String acmActi);
	
	//회원관리
	public List<UserVO> getadminListUsers(String userStat);
	
	//회원숙소 가져오기
	public UserAcmVO getpendingUserAcms(String bizRegnum);
	
	public UserVO getUser(String userNum);

	public boolean moditoHost(String userNum,String bizRegnum);

	public boolean moditoGuest(String userNum);

	
	
	
	//public int register(RomVO rom);

	//public boolean remove(String romNum);

	
	//public List<RomVO> getList(String acmNum, String person);

	//public AcmVO getadminAcm(String acmNum);






}
