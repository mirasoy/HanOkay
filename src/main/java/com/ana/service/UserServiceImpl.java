package com.ana.service;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Service;
import com.ana.domain.UserVO;
import com.ana.mapper.UserMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService{

	private UserMapper mapper;
	
	//회원 가입하는 메서드 구현
	@Override
	public void register(UserVO user) {
		log.info("register...."+ user);
		mapper.insertSelectKey(user);
	}

	//회원 정보 가져오는 메서드 구현
	@Override
	public UserVO get(String userNum) {
		log.info("getList.......");
		return mapper.readUser(userNum);
	}
	
	//회원 정보 수정하는 메서드 구현
	@Override
	public boolean modify(UserVO user) {
		log.info("modify.........."+ user);
		return mapper.updateUser(user) == 1;
	}
	//회원탈퇴하는 메서드 구현
	@Override
	public boolean remove(String userNum) {
		log.info("remove......."+ userNum);
		return mapper.deleteUser(userNum) == 1;
	}

	//회원들의 정보를 가져오는 메서드 구현
	@Override
	public List<UserVO> getList() {
		log.info("getList.......");
		return mapper.getListOfUsers();
	}
	
	//이메일 중복 검사하는 메서드 구현
	@Override
	public boolean checkEmail(String email) {
		log.info("idCheck........");
		return mapper.checkEmail(email)==0;
	}

	//로그아웃하는 메서드 구현
	@Override
	public void logout(HttpSession session) {
		//세션 변수 개별 삭제
		session.removeAttribute("email");
		//세션 정보 초기화
	}

	//로그인하는 메서드 구현
	@Override
	public void checkLogin(UserVO user, HttpSession session) {
		//메퍼에서 아이디 비번 일치하는 지 확인
		boolean result= mapper.checkLogin(user);
		
		
		if(result) {
			
		}
	}

	//유효한 회원인지 확인하는 메서드
	@Override
	public boolean isValidUser(String email, String pwd) {
		return mapper.isValidUser(email, pwd) != 0;
		
	}

	//email과 pw가 일치하는 user의 userNum을 반환하는 메서드
	@Override 
	public UserVO getUserById(String email) {
		return mapper.getUserById(email);
	}

 
}
