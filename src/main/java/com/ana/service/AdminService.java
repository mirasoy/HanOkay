package com.ana.service;

import java.util.List;

import com.ana.domain.AcmVO;
import com.ana.domain.UserVO;

public interface AdminService {

	public List<UserVO> getPendingHost();
	public List<UserVO> getAll(String acmNum);

	
	public List<AcmVO> getadminListAcms(String acmActi);
	
	
	public UserVO getUser(String userNum);

	public boolean moditoHost(String userNum);

	public boolean moditoGuest(String userNum);

	//public int register(RomVO rom);

	//public boolean remove(String romNum);

	
	//public List<RomVO> getList(String acmNum, String person);
}
