package com.ana.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import com.ana.domain.WishListVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class WishListServiecTests {
	

	@Setter(onMethod_= {@Autowired})
	private WishListService service;
	
	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testRegister() {
		WishListVO board = new WishListVO();	
		
		board.setUserNum("U1");
		board.setAcmNum("A1");
		board.setListTitle("새로 추가 제목");
		board.setListContent("새로추가 내용");
		
		service.register(board);
		
		log.info("■■■■■■■■■■■■■■■■■■■■■찜이 생성되었습니다.");
	}
	
	@Test
	public void testGet() {
		log.info(service.get("■■■■■■■■■■■■■■■■■■■■■W1"));
	}
	
	@Test
	public void testGetWishList() {
		service.getWishList("W1").forEach(board -> log.info("■■■■■■■■■■■■■■■■■■■■■W1의 목록을 가져옵니다."+ board));
	}
	
	@Test
	public void testDelete() {
		log.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■REMOVE RESULT:" + service.remove("W334"));
	}
	
	@Test
	public void removeAjax() {
		log.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■REMOVE RESULT:" + service.removeAjax("W341"));
	}
	
	
	

	
	@Test
	public void testDrawValue() {
		log.info(service.drawValue("U1", "A1"));
	}
	
	
	
	@Test
	public void testUpdate() {
		WishListVO board = service.get("W30");
		if(board==null) {
			return;
		}
		
		board.setListTitle("제목 수정");
		log.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■MODIFY RESULT:" + service.modify(board));
	}
	
	
	
}
