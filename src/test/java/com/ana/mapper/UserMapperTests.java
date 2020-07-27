package com.ana.mapper;

import static org.junit.Assert.assertTrue;

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

	@Setter(onMethod_ = { @Autowired })
	private UserMapper mapper;

//	@Test
	public void testRead() {
		log.info(mapper.readUser("U1"));
	}

//	@Test
	public void testGetList() {
		mapper.getListOfUsers().forEach(user -> log.info(user));
	}

//	@Test
	public void testInsert() {
		UserVO user = new UserVO();
		user.setUserEmail("suHee@gmail.com");
		user.setUserPwd("1aA2@5678_");
		user.setUserLastName("Suhee");
		user.setUserFstName("Kim");
		user.setUserPhone("82111341234");
		user.setUserAuthCode("12345");
		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy/MM/dd");
		try {
			user.setUserBirthday(beforeFormat.parse("1992/10/01"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		// null값을 넣을 때는 빈문자열로 처리해야함
		mapper.insertUser(user);
		log.info(user);
	}

//	@Test
	public void testDelete() {
		log.info("**************DELETE COUNT: " + mapper.deleteUser("U262"));
	}

//	@Test
	public void testInsertSelectKey() {
		UserVO user = new UserVO();
		user.setUserEmail("serin9811@naver.com");
		user.setUserPwd("Serin9811@");
		user.setUserLastName("Serin");
		user.setUserFstName("Heo");
		user.setUserPhone("821067409811");

		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy/MM/dd");
		try {
			user.setUserBirthday(beforeFormat.parse("1994/08/06"));
		} catch (ParseException e) {
			e.printStackTrace();
		}

		mapper.insertSelectKey(user);
		log.info(user);
	}

//	@Test
	public void testUpdate() {
		UserVO user = new UserVO();
		user.setUserNum("U191");
		user.setUserEmail("edited@google.com");
		user.setUserPwd("SSAw223@@@ee");
		user.setUserLastName("수정");
		user.setUserFstName("최");
		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy/MM/dd");
		try {
			user.setUserBirthday(beforeFormat.parse("1990/11/01"));
		} catch (ParseException e) {
			e.printStackTrace();
		}

		int count = mapper.updateUser(user);
		log.info("*******UPDATE COUNT: " + count);
	}

	// 이메일로 중복확인 하는 인터페이스 테스트
//	@Test
	public void testIdCheck() {
		int count = mapper.canRegister("mira123@naver.com");
		log.info("*******DUPLICATED ID COUNT: " + count);
	}


	
	//해당 유저의 유저번호를 반환하는 메서드 테스트
//	@Test
	public void testGetUserById() {
		UserVO user = mapper.getUserById("mira@naver.com");
		log.info("@@@@@@@@@UserNum: "+user);
	}
	
//	@Test
	public void testGiveAuth() {
		int count=mapper.matchAuthCode("serin9811@naver.com", "0000");
		log.info("*****GIVE AUTH COUNT: "+ count+ "*****");
	}
	
	@Test
	public void giveGrant() {
		int count= mapper.grantActive("kw@naver.com", "13506");
		log.info("******GRANT ACTIVE"+ count);
	}
	
//	@Test
	public void testIsValid() {
		UserVO user= mapper.isValidUser("serin@naver.com", "Serin123!");
		log.info(user);
	}
	
	@Test
	public void testMatchAuthCode() {
		int num= mapper.matchAuthCode("srawet6f@mapquest.com", "76097");
		assertTrue(num==1);
	}
}
