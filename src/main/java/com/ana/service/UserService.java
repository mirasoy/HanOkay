package com.ana.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.transaction.annotation.Transactional;

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
	public boolean canRegister(String email);
	
	//로그아웃하는 메서드
	public void logout(HttpSession session);

	//유효한 회원인지 확인하는 메서드
	//public boolean isValidUser(String email, String pwd);
	
	//email과 pw 일치하는 userNum가져오는 메서드
	public UserVO getUserById(String email);
	
	//로그인하는 메서드
	public int executeLogin(@Param("email")String email, @Param("pwd")String pwd, @Param("user_check")String user_check, HttpServletResponse response, HttpSession session);
	
	//인증코드를 확인하는 메서드
	public boolean matchAuthCode(String authCode, String email);
	
	//회원상태를 active해주는 메서드
	@Transactional
	public boolean grantActive(String email);
	
	//해당 이메일을 가진 회원의 authCode를 업데이트 시키는 메서드
	@Transactional
	public boolean updateAuthCode(String email, String authCode);
	
}
