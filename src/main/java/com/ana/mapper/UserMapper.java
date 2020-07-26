package com.ana.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ana.domain.UserVO;

public interface UserMapper {
	// 모든 user들의 정보 가져오는 메서드
	public List<UserVO> getListOfUsers();

	// user 등록하는 메서드
	public void insertUser(UserVO user);

	public void insertSelectKey(UserVO user);

	// userNum으로 user 정보 가져오는 메서드
	public UserVO readUser(String userNum);

	// userNum을 가진 user 없애는 메서드
	public int deleteUser(String userNum);

	// user정보 업데이트하는 메서드
	public int updateUser(UserVO user);

	// email로 중복되는 값이 있는 지 확인하는 메서드
	public int canRegister(@Param("userEmail")String email);

	// 해당 회원이 있는지 확인하는 메서드
	public UserVO isValidUser(@Param("userEmail") String email, @Param("userPwd") String pwd);
	
	//해당 회원의 userNum을 반환
	public UserVO getUserById(String UserEmail);

	// 로그인 정보 일치하는 지 확인하는 메서드
	public boolean checkLogin(UserVO user);
	
	//입력된 인증코드와 보내진 db의 인증코드가 일치하는 사람이 1명이 맞는지 확인하는 메서드
	public int matchAuthCode(@Param("userEmail") String email, @Param("userAuthCode") String authNum);
	
	//user의 상태코드를 'ACTIVE'로 수정하는 메서드
	public int grantActive(String email);
	
	//user의 인증코드를 업데이트 하는 메서드
	public int updateAuthCode(@Param("userEmail") String email, @Param("userAuthCode") String authNum);
	
	
	/////////////////////////////////림쨩의 영역/////////////////////////////////
	
	//숙소등록을 처음 시작할때 사업자번호등록
	public int becomeHost(UserVO u);
	
	public UserVO isHost(String userNum);
	
	//////////////////////////////어드민단 //////////////////////////////////////
	
	public List<UserVO> getPendingHost(String userStatusCode);
	
	public UserVO getUser(String userNum);
	
	public int moditoHost(UserVO vo);
	
	public int moditoGuest(UserVO vo);
	
	
	
}
