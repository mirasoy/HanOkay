package com.ana.service;

import java.util.List;
import com.ana.domain.UserVO;

public interface UserService {
	public void register(UserVO user);
	
	public UserVO get(String userNum);
	
	public boolean modify(UserVO user);
	
	public boolean remove(String userNum);
	
	public List<UserVO> getList();
	
	//email로 중복체크하기 메서드
	public boolean checkEmail(String email);
}
