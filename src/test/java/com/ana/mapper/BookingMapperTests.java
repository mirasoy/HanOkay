package com.ana.mapper;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.apache.ibatis.annotations.Param;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ana.domain.AcmVO;
import com.ana.domain.BookStatusVO;
import com.ana.domain.BookingVO;
import com.ana.domain.RomVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BookingMapperTests {

	@Setter(onMethod_= @Autowired)
	private BookingMapper mapper;
	

	

	@Test
	public void testInsert() {								
		mapper.changeStatus("B1", "예약완료");		
	}
	


	//1. 모든 예약 목록을 가져오기 위한 리스트 테스트
	@Test
	public void getBookListAll() {
		mapper.getBookListAll("U1").forEach(board->log.info(board));
	}

	//@Test
	public void testDelete() {
		log.info("DELETE COUNT: " + mapper.delete("B13"));
	}
	
	
	//@Test
	public void testUpdate() {
		BookingVO board = new BookingVO();
	
		board.setBookNum("B8");
		board.setUserNum("A1");
		board.setRomNum("수정된 방번호");
		board.setStaydays(1);
		board.setGuest(22);
		board.setBookPrice(123);
		board.setExpectedArr("수정된 예정시간");
		board.setRequest("수정된 요청사항");
		board.setRealArr("수정된 도착시간");
		
		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy/mm/dd");
		try {
			board.setBookDate(beforeFormat.parse("2020/02/02"));
			board.setCheckinDate(beforeFormat.parse("2020/02/02"));
			board.setCheckoutDate(beforeFormat.parse("2020/02/02"));
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
		board.setSmoking("1");

	}
	
	//2. 예약중인 목록을 가져오기 위한 리스트 테스트	
	//@Test
	public void getBookList() {
		mapper.getBookList("A1").forEach(board->log.info(board));
	}
	
	
	//3. 취소한 내역으로 상태변화를 업데이트 하는 코드
	//@Test
	public void testCancel() {
		mapper.getCancelList("A1").forEach(board2->log.info(board2));
	}
	
	
	//4. 예약 완료한 리스트
	@Test
	public void testCheckout() {
		mapper.getCheckoutList("A1").forEach(board->log.info(board));
	}
	
	
	
	
	// 취소한 내역으로 상태변화를 업데이트 하는 코드	
	//@Test
	public void testDelete2() {
		log.info("DELETE COUNT: " + mapper.delete("B13"));
	}
	
	
//	@Test
//	public void testUpdate() {
//		BookingVO board = new BookingVO();
//	
//		board.setBookNum("B8");
//		board.setUserNum("A1");
//		board.setRomNum("수정된 방번호");
//		board.setStaydays(1);
//		board.setGuest(22);
//		board.setBookPrice(123);
//		board.setDeposit(1);
//		board.setExpectedArr("수정된 예정시간");
//		board.setRequest("수정된 요청사항");
//		board.setRealArr("수정된 도착시간");
//		
//		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy/mm/dd");
//		try {
//			board.setBookDate(beforeFormat.parse("2020/02/02"));
//			board.setCheckinDate(beforeFormat.parse("2020/02/02"));
//			board.setCheckoutDate(beforeFormat.parse("2020/02/02"));
//			
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
//		
//		
//		board.setCanceled("1");
//		board.setSmoking("1");
//		
//		
//		int count = mapper.update(board);
//		log.info("UPDATE COUNT: " + count);
//	}
	
	
	
	
//	@Test
//    public void testGetList() {
//		mapper.getList().forEach(board -> log.info(board));
//	}
//	
//	@Test
//	public void testRead() {
//	
//		BookingVO board = mapper.read("B1");
//		log.info(board);
//		
//		
//		
//	}
	
	
	@Test
	public void testInsert2() {
		BookingVO book = new BookingVO();
		book.setUserNum("U1");
		book.setRomNum("R1");
		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy/MM/dd");
		try {
			book.setCheckinDate(beforeFormat.parse("2020/8/1"));
			book.setCheckoutDate(beforeFormat.parse("2020/8/3"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		book.setStaydays(2);
		book.setGuest(2);
		book.setBookPrice(1004);
		book.setExpectedArr("PM02");
		book.setSmoking("1");
		book.setRequest("뷰 좋은 방 주세요");
		book.setRomName("테스트");
		book.setBookerLastname("테스트");
		book.setBookerFirstname("테스트");
		book.setBookerEmail("test@ana.com");
		book.setBookerPhone("010");
		book.setBookStatus("RS_STT_BK");
		mapper.insert(book);

		log.info(book);
	}
}
