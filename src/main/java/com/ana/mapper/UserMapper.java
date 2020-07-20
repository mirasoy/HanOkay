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
	public int checkEmail(String userEmail);

	// 해당 회원이 있는지 확인하는 메서드
	public int isValidUser(@Param("userEmail") String userEmail, @Param("userPwd") String userPwd);
	
	//해당 회원의 userNum을 반환
	public UserVO getUserById(String UserEmail);

	// 로그인 정보 일치하는 지 확인하는 메서드
	public boolean checkLogin(UserVO user);
}
