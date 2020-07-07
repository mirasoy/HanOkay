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

//	@Test
	public void testRead() {
		UserVO user = mapper.readUser("U5");
		log.info(user);
	}

//	@Test
	public void testGetList() {
		mapper.getList().forEach(user -> log.info(user));
	}

//	@Test
	public void testInsert() {
		UserVO user = new UserVO();
		// user.setUserNum("10");
		user.setEmail("ss@sss.com");
		user.setPwd("@@ww223@@@ee");
		user.setLastname("Jessica");
		user.setFstname("Kang");
		user.setUserPhone("821067409811");
		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy/MM/dd");
		try {
			user.setBirthday(beforeFormat.parse("2000/10/01"));
			user.setRegdate(beforeFormat.parse("2020/10/11"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		user.setGoogleId("ewqe@gas.com");
		user.setFacebookId("");
		// null값을 넣을 때는 빈문자열로 처리해야함
		mapper.insertUser(user);
		log.info(user);
	}

//	@Test
	public void testDelete() {
		log.info("**************DELETE COUNT: " + mapper.deleteUser("U1"));
	}

//	@Test
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

		user.setGoogleId("ewqe22@gas.com");
		user.setFacebookId("");

		mapper.insertSelectKey(user);
		log.info(user);
	}

//	@Test
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
		user.setGoogleId("Crystal222@gas.com");
		user.setFacebookId("Crystal@dsad.com");

		int count = mapper.updateUser(user);
		log.info("*******UPDATE COUNT: " + count);
	}

	// 이메일로 중복확인 하는 인터페이스 테스트
	@Test
	public void testIdCheck() {

		int count = mapper.checkEmail("jiha@naver.com");
		log.info("*******DUPLICATED ID COUNT: " + count);
	}
}
