package com.ana.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ana.domain.BookingVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BookingServiceTests {
	
	@Setter(onMethod_= {@Autowired})
	private BookingService service;
	
	@Test
	public void testDelete() {
		
		log.info("REMOVE RESULT: "+ service.remove("B14"));
		
	}
	
	@Test
	public void testUpdate() {
		BookingVO board = service.get("B8");
		if(board == null) {
			return;
		}
		
		board.setRequest("요청사항 수정합니다.");
		log.info("MODIFY RESULT: " + service.modify(board));
		
		
	}
	
	
	
//	@Test
//	public void testExist() {
//		log.info(service);
//		assertNotNull(service);
//	}
//	
//	@Test
//	public void testGetList() {
//		service.getList().forEach(board-> log.info(board));
//	}
//	
//	
//	@Test
//	public void testGet() {
//		log.info(service.get("B1"));
//	}
	
}
