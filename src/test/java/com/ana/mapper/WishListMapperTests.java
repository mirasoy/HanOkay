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
	
		mapper.getList("U2").forEach(board -> log.info(board));
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
	

	
	
	@Test
	public void testInsertAjax() {
		WishListVO vo = new WishListVO();
		vo.setUserNum("U1");
		vo.setAcmNum("A1");
		vo.setListTitle("새로 추가 제목");
		vo.setListContent("새로추가 내용");
		
		mapper.insertAjax(vo);
		log.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■vo");
		
	}
	
	
	// ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
	// ★★★★★★★★★★★★★★★★★★★★★★★★★★3. testRead ★★★★★★★★★★★★★★★★★★★★★★★★★★★★
	// ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★	
	
	
	//찜번호로 검색한다.
	@Test
	public void testRead() {
		String targetWishNum = "W1";
		WishListVO board = mapper.read(targetWishNum);
		log.info(board);
	}
	

	

	// ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
	// ★★★★★★★★★★★★★★★★★★★★★★★★★★4. testDelete ★★★★★★★★★★★★★★★★★★★★★★★★★★★
	// ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★		
	
	
	@Test
	public void testDelete() {
		log.info("■■■■■■■■■■■■■■■■■■■■■■■■>> DELETE COUNT:" + mapper.delete("W337"));
	}
	
	
	@Test
	public void deleteAjax() {
		log.info("■■■■■■■■■■■■■■■■■■■■■■■■>> DELETE COUNT:" + mapper.deleteAjax("W305"));
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
	

	// ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
	// ★★★★★★★★★★★★★★★★★★★★★★★★★★6. 장바구니 확인 ★★★★★★★★★★★★★★★★★★★★★★★★★★★
	// ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★		
	
	
	@Test
	public void testcountCart() {
		WishListVO board = new WishListVO();
		board.setUserNum("U1");
		board.setAcmNum("A1");
		
		int count = mapper.countCart(board);
		
		log.info("■■■■■■■■■■■■■■■■■■■■■■■■>>testWishCart COUNT: " + count);
	}
	
	// ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
	// ★★★★★★★★★★★★★★★★★★★★★★★★★★7. 하트의 확인  ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
	// ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★		
	
	
	@Test
	public void testDrawValue() {	
		
		mapper.drawValue("U1", "A1");
		
	
		log.info("테스트를 해보자■■■■■■■■■■■■■■■■■■■■■■■■>>drawValue: " + mapper.drawValue("U1", "A1"));
	}
	
	
}
