package com.ana.service;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public boolean canRegister(String email) {
		log.info("Email Duplication Check........");
		return mapper.canRegister(email) == 0;
	}

	//로그아웃하는 메서드 구현
	@Override
	public void logout(HttpSession session) {
		//세션 변수 개별 삭제
		session.removeAttribute("email");
		//세션 정보 초기화
	}

	//로그인하는 메서드 구현
	@Transactional
	@Override
	public int executeLogin(String email, String pwd, String user_check, HttpServletResponse response, HttpSession session) {
		System.out.println("유저 서비스에서 이메일: "+ email);
		System.out.println("유저 서비스에서 ㅂㅣ번: "+ pwd);
		System.out.println("유저 서비스에서 아이디 기억: "+ user_check);
		
		UserVO user= mapper.isValidUser(email, pwd);
		System.out.println("UserService에서 로그인 객체확인:  "+ user);
		
		int result=0;
		//회원 정보 없을 때
		if(user==null) {
			System.out.println("service에서 반환되는 result 값: "+ result);

			return result;
		}
		
		//회원 정보가 있을 때
		else if (user != null) {
			Cookie cookie= new Cookie("user_check", null);
			
			if(user_check.equals("true")) {
				cookie.setValue(email);
				response.addCookie(cookie);
				System.out.println("쿠키에 아이디 저장한다~");
				System.out.println("service check에서 cookie: "+ cookie);
			} 
			else {
				System.out.println("쿠키 아이디 저장 x !");
				cookie.setValue("");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
				
			}
			
			System.out.println("로그인 한다~");
			user.setUserPwd("");
			session.setAttribute("user", user);
			System.out.println("세션에 회원객체는~: "+ session.getAttribute("user"));
			result=1;
			
		}
		System.out.println("service에서 반환되는 result 값: "+ result);
		return result;
	}

	//유효한 회원인지 확인하는 메서드
	

	//email과 pw가 일치하는 user의 userNum을 반환하는 메서드
	@Override 
	public UserVO getUserById(String email) {
		
		return mapper.getUserById(email);
	}
	
	//인증코드를 확인하는 메서드
	@Override
	public boolean matchAuthCode(@Param("userAuthCode") String authCode, @Param("userEmail") String email) {
		return mapper.matchAuthCode(authCode, email) ==1;
	}

	//user의 상태코드를 active 변경하고 업데이트 된 행의 수를 가져오는 메서드
	 @Override 
	 public boolean grantActive(String email) {
		 return mapper.grantActive(email)==1; 
	 }

	 //user의 인증코드를 업데이트 하게하는 메서드
	@Override
	public boolean updateAuthCode(@Param("userEmail") String email, @Param("userAuthCode")String authCode) {
		return mapper.updateAuthCode(email ,authCode)==1;
	
	
	}
}
