package com.ana.mapper;

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
public class WishListMapperTests {
	
	@Setter(onMethod_= @Autowired)
	private WishListMapper mapper;
	
	// ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
	// ★★★★★★★★★★★★★★★★★★★★★★★★★★1. testGetList ★★★★★★★★★★★★★★★★★★★★★★★★★★
	// ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
	
	// 1-1. 현재 찜의 모든 목록을 가져옴
	@Test
	public void testGetList() {
		mapper.getList().forEach(board -> log.info(board));
	}
	
	
	// ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
	// ★★★★★★★★★★★★★★★★★★★★★★★★★★2. testInsert ★★★★★★★★★★★★★★★★★★★★★★★★★★
	// ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★	
	
	@Test
	public void testInsert() {
		WishListVO board = new WishListVO();
		board.setUserNum("U1");
		board.setAcmNum("A1");
		board.setListTitle("새로 추가 제목");
		board.setListContent("새로추가 내용");
		
		mapper.insert(board);
		log.info(board);
		
	}
	
	// ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
	// ★★★★★★★★★★★★★★★★★★★★★★★★★★3. testRead ★★★★★★★★★★★★★★★★★★★★★★★★★★★★
	// ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★	
	
	
	//하나의 값만 받을수 있다
	@Test
	public void testRead() {
		WishListVO board = mapper.read("U210");
		log.info(board);
	}
	

	// ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
	// ★★★★★★★★★★★★★★★★★★★★★★★★★★4. testDelete ★★★★★★★★★★★★★★★★★★★★★★★★★★★
	// ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★		
	
	
	@Test
	public void testDelete() {
		log.info("■■■■■■■■■■■■■■■■■■■■■■■■>> DELETE COUNT:" + mapper.delete("W202"));
	}
	
	
	
	
	// ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
	// ★★★★★★★★★★★★★★★★★★★★★★★★★★5. testUpdate ★★★★★★★★★★★★★★★★★★★★★★★★★★★
	// ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★		
	
	@Test
	public void testUpdate() {
		WishListVO board = new WishListVO();
		
		board.setWishNum("W220");
		board.setUserNum("U1");
		board.setAcmNum("A1");
		board.setListTitle("수정11");
		board.setListContent("수정11");
				
		
		int count = mapper.update(board);
		log.info("■■■■■■■■■■■■■■■■■■■■■■■■>>UPDATE COUNT: " + count);
		
	}
	
	
	
}
