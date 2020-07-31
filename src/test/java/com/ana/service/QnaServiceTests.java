package com.ana.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ana.domain.Criteria;
import com.ana.domain.QnaVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class QnaServiceTests {
	
	@Setter(onMethod_= {@Autowired})
	private QnaService service;
	
	@Test
	public void testExist() {
		
		log.info(service);
		assertNotNull(service);
	}
	
	//@Test
	public void testRegister() {
		QnaVO qna = new QnaVO();
		qna.setTitle("새로 작성하는 글");
		qna.setContent("새로 작성하는 내용");
		qna.setWriter("U50");
		
		service.register(qna);
		
		log.info("생성된 게시물의 번호: " + qna.getBno());
	}
	
	@Test
	public void testGetList() {
		service.getList(new Criteria(2,10)).forEach(qna -> log.info(qna));
	}
	
	@Test
	public void testGet() {
		log.info(service.get(1L,"N"));
	}
	
	@Test
	public void testDelete() {
		log.info("REMOVE RESULT: " + service.remove(2L));
	}
	
	@Test
	public void testUpdate() {
		QnaVO qna = service.get(1L,"N");
		
		if(qna==null) {
			return;
		}
		
		qna.setTitle("제목 수정합니다.");
		log.info("MODIFY RESULT: " + service.modify(qna));
	}

}
