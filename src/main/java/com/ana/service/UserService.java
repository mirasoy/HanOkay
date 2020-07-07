package com.ana.service;

import java.util.List;
import javax.servlet.http.HttpSession;
import com.ana.domain.UserVO;

public interface UserService {
	
	//회원가입하는 메서드
	public void register(UserVO user);
	
	//회원 정보 가져오는 메서드
	public UserVO get(String userNum);
	
	//회원 정보 수정하는 메서드
	public boolean modify(UserVO user);
	
	//회원 탈퇴하는 메서드
	public boolean remove(String userNum);
	
	//디비 회원들 리스트 가져오는 메서드
	public List<UserVO> getList();
	
	//email로 중복체크하기 메서드
	public boolean checkEmail(String email);
	
	//로그인 하는 메서드
	public void checkLogin(UserVO user, HttpSession session);
	
	//로그아웃하는 메서드
	public void logout(HttpSession session);

	//유효한 회원인지 확인하는 메서드
	public boolean isValidUser(String email, String pwd);
	
}
