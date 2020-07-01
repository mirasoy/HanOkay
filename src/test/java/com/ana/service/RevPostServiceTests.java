package com.ana.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ana.domain.RevPostVO;
import com.ana.domain.RevVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class RevPostServiceTests {

	@Setter(onMethod_ = { @Autowired })
	private RevPostService service;

	@Test
	public void testGetAcmList() {
		service.getAcmList("A2").forEach(post -> log.info(post));
	}

	// @Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}

	// @Test
	public void testRegister() {
		RevPostVO post = new RevPostVO();
		post.setBrdCode("rev");
		post.setPTitle("서비스제목");
		post.setUserNum("서비스작성자");

		// service.register(post);

		log.info("생성된 리뷰의 번호: " + post.getPstNum());
	}

	// @Test
	public void testGetList() {
		service.getList().forEach(post -> log.info(post));
	}

	// @Test
	public void testGet() {
		log.info(service.get("8"));
	}

	// @Test
	public void testDelete() {
		// 게시물의 존재 여부를 확인하고 테스트할 것
		log.info("REMOVE RESULT: " + service.remove("12"));
	}

//	@Test
//	public void testUpdate() {
//		RevVO post = service.get("20");
//		
//		if(post == null) {
//			return;
//		}
//		
//		post.setPTitle("제목 수정합니다. ");
//		log.info("MODIFY RESULT: "+service.modify(post));
//	}

}
