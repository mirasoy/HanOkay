package com.ana.mapper;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ana.domain.UserVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserMapperTests {

	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;

	@Test
	public void testRead() {
		UserVO user = mapper.readUser("U1");
		log.info(user);
	}

	@Test
	public void testGetList() {
		mapper.getListOfUsers().forEach(user -> log.info(user));
	}

	@Test
	public void testInsert() {
		UserVO user = new UserVO();
		// user.setUserNum("10");
		user.setEmail("suHee@gmail.com");
		user.setPwd("1aA2@5678_");
		user.setLastname("Suhee");
		user.setFstname("Kim");
		user.setUserPhone("82111341234");
//		user.setUPriv("GU");
//		user.setRegMethod("m");
		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy/MM/dd");
		try {
			user.setBirthday(beforeFormat.parse("1992/10/01"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		// null값을 넣을 때는 빈문자열로 처리해야함
		mapper.insertUser(user);
		log.info(user);
	}

	@Test
	public void testDelete() {
		log.info("**************DELETE COUNT: " + mapper.deleteUser("U2"));
	}

	@Test
	public void testInsertSelectKey() {
		UserVO user = new UserVO();
		user.setEmail("serin9811@naver.com");
		user.setPwd("Serin9811@");
		user.setLastname("Serin");
		user.setFstname("Heo");
		user.setUserPhone("821067409811");

		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy/MM/dd");
		try {
			user.setBirthday(beforeFormat.parse("1994/08/06"));
		} catch (ParseException e) {
			e.printStackTrace();
		}

//		user.setUserPriv("GU");
//		user.setRegMethod("M");

		mapper.insertSelectKey(user);
		log.info(user);
	}

	@Test
	public void testUpdate() {
		UserVO user = new UserVO();

		user.setUserNum("U1");
		user.setEmail("edited@google.com");
		user.setPwd("SSAw223@@@ee");
		user.setLastname("수정");
		user.setFstname("최");
		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy/MM/dd");
		try {
			user.setBirthday(beforeFormat.parse("1990/11/01"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
//		user.setUserPriv("GU");
//		user.setRegMethod("g");

		int count = mapper.updateUser(user);
		log.info("*******UPDATE COUNT: " + count);
	}

	// 이메일로 중복확인 하는 인터페이스 테스트
	@Test
	public void testIdCheck() {
		int count = mapper.checkEmail("a2@naver.com");
		log.info("*******DUPLICATED ID COUNT: " + count);
	}

	// 로그인 할 떄 회원 정보 일치하는지 확인하는 메서드
	@Test
	public void testIsValidUser() {
		int count = mapper.isValidUser("serin9811@naver.com", "Serin9811@");
		log.info("*****THIS ACCOUNT EXIST: " + count);
	}
	
	//해당 유저의 유저번호를 반환하는 메서드 테스트
	@Test
	public void testGetUserNumByIdPw() {
		String name = mapper.getUserNumById("jiha@naver.com");
		log.info("***********UserNum: "+name);
	}

}
