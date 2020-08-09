package com.ana.service;

import java.util.List;

import com.ana.domain.AcmVO;
import com.ana.domain.RomVO;
import com.ana.domain.UserAcmVO;
import com.ana.domain.UserVO;

public interface AdminService {

	public List<UserVO> getAll(String acmNum);

	//숙소관리1
	public List<UserAcmVO> getadminListAcms(String acmActi);
	//숙소관리_객실가져오기2
	public List<RomVO> getRoms(String acmNum);
	
	//회원관리
	public List<UserVO> getadminListUsers(String userStat);
	
	//회원숙소 가져오기
	public UserAcmVO getUserAcms(String acmNum);
	public UserAcmVO getUserNumAcm(String userNum);
	
	public UserAcmVO getPendingUserAcms(String bizRegnum);
	
	public UserVO getUser(String userNum);

	
	//회원측 활성화/비활성화
	public boolean moditoHost(String userNum, String acmNum);
	public boolean moditoGuest(String userNum, String acmNum);

	//숙소측 활성화/비활성화
	public boolean activeAcm(String acmNum);
	public boolean denyAcm(String acmNum);



}
