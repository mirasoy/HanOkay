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


	private UserMapper mapper;

//	@Test
	public void testRead() {
		UserVO user = mapper.readUser("U1");
		log.info(user);
	}

//	@Test
	public void testGetList() {
		mapper.getListOfUsers().forEach(user -> log.info(user));
	}

//	@Test
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
		user.setEmail("새로추가 newAdded@sss.com");
		user.setPwd("새로 @@ww223@@@ee");
		user.setLastname("새로 Jessi");
		user.setFstname("새로 Kim");
		user.setUserPhone("821067409811");

		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy/MM/dd");
		try {
			user.setBirthday(beforeFormat.parse("2010/11/11"));
			user.setRegdate(beforeFormat.parse("2020/06/29"));

		} catch (ParseException e) {
			e.printStackTrace();
		}

	

		mapper.insertSelectKey(user);
		log.info(user);
	}

	@Test
	public void testUpdate() {
		UserVO user = new UserVO();
		user.setUserNum("U9");
		user.setEmail("수정된 newAdded@sss.com");
		user.setPwd("수정된 @@ww223@@@ee");
		user.setLastname("수정");
		user.setFstname("최");
		user.setUserPhone("821067409811");
		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy/MM/dd");
		try {
			user.setBirthday(beforeFormat.parse("1990/10/01"));
			user.setRegdate(beforeFormat.parse("2020/06/30"));

		} catch (ParseException e) {
			e.printStackTrace();
		}


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

}
