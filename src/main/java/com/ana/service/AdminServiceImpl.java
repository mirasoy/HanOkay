package com.ana.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ana.domain.UserVO;
import com.ana.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class AdminServiceImpl implements AdminService{
	@Setter(onMethod_= {@Autowired})
	private UserMapper umapper;

	@Override
	public List<UserVO> getPendingHost() {
		String userStatusCode ="HO_PENDING";
		
		return umapper.getPendingHost(userStatusCode);
	}

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
	public boolean moditoHost(String userNum) {
		
		UserVO vo = new UserVO();
		vo.setUserNum(userNum);
		vo.setUserPriv("HOST");
		vo.setUserStatusCode("HO_ACTIVE");
		
		return umapper.moditoHost(vo)==1;
	}

	@Override
	public boolean moditoGuest(String userNum) {
		
		UserVO vo = new UserVO();
		vo.setUserNum(userNum);
		vo.setUserPriv("GUEST");
		vo.setUserStatusCode("ACTIVE");
		vo.setBizRegisterNumber("DENY");
		
		return umapper.moditoGuest(vo)==1;
	}
	

}
