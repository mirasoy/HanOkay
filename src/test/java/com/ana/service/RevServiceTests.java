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
public class RevServiceTests {
	

	@Setter(onMethod_= {@Autowired})
	private RevService service;
	
//	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
//	@Test
	public void testRegister() {
		RevVO post = new RevVO();
		post.setBrdCode("rev");
		post.setTitle("서비스제목");
		post.setUserNum("서비스작성자");
		post.setAcmNum("A1");
		post.setBookNum("B12");
		post.setContent("so hot");
		post.setRevPurl("/asd.jsp");
		post.setStisf(3);
		
		service.register(post);
		
		log.info("생성된 리뷰의 번호: " + post.getPstNum());
	}
	
//	@Test
	public void testGetList() {
		service.getList().forEach(post->log.info(post));
	}
	
	//@Test
	public void testGet() {
		log.info(service.get("8"));
	}
	
//@Test
	public void testDelete() {
		//게시물\의 존재 여부를 확인하고 테스트할 것
		log.info("REMOVE RESULT: " + service.remove("12"));
	}
	
//	@Test
	public void testUpdate() {
		RevVO post = service.get("34");
		
		if(post == null) {
			return;
		}
		
		post.setTitle("제목 수정합니다. ");
		log.info("MODIFY RESULT: "+service.modify(post));
	}
	
	@Test
	public void testGetMyList() {
		service.getUserList("U1").forEach(post->log.info(post));
	}
	
}
