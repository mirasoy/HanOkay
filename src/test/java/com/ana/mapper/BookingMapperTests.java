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
	

	// ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
	// ★★★★★★★★★★★★★★★★★★★★★★★★★★1. testGetList ★★★★★★★★★★★★★★★★★★★★★★★★★★
	// ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
	
	
	//1-1. 현재 예약의 모든 목록을 가져옴  (완)
	@Test
    public void testGetList() {
		mapper.getList().forEach(board -> log.info(board));
	}
	
	//1-2. 지정한 유저 (U1)의 모든 예약 목록을 가져오기 위한 리스트 테스트 (완)
	@Test
	public void getBookListAll() {
		mapper.getBookListAll("U1").forEach(board->log.info(board));
	}
	

	// 1-3. 지정한 유저 (U1)의 예약중인 목록을 가져오기 위한 리스트 테스트 RS_STT_BK (완) 
	@Test
	public void getBookList() {
		mapper.getBookList("U1").forEach(board->log.info(board));
	}

	// 1-4. 지정한 유저 (U1)의 예약 취소한 목록을 가져오기 위한 리스트 테스트 RS_STT_BC (완)
	@Test
	public void getCancelList() {
		mapper.getCancelList("U1").forEach(board->log.info(board));
	}	
	
	// 1-5. 지정한 유저 (U1)의 예약 완료한 목록을 가져오기 위한 리스트 테스트  RS_STT_AC (완)
	@Test
	public void testCheckout() {
		mapper.getCheckoutList("U1").forEach(board->log.info(board));
	}		
	
	
	// ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
	// ★★★★★★★★★★★★★★★★★★★★★★★★★★2. testRead ★★★★★★★★★★★★★★★★★★★★★★★★★★★★
	// ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
	
	
	// 예약 번호 B1 을 조회하는 테스트
	@Test
	public void testRead() {
	
		BookingVO board = mapper.read("B1");
		log.info(board);
				
	}
	

	// ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
	// ★★★★★★★★★★★★★★★★★★★★★★★★★★3. testUpdate ★★★★★★★★★★★★★★★★★★★★★★★★★★
	// ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★	
	
	// 3-1. 대상(U1)의  예약 정보를 업데이트 하는것을 테스트 (완)
	@Test
	public void testUpdate() {
		BookingVO board = new BookingVO();
	
		board.setBookNum("B3");
		board.setUserNum("U1");
		board.setRomNum("R24");
		board.setStaydays(1);
		board.setGuest(1);
		board.setBookPrice(1);
		board.setExpectedArr("수정된 예정시간");
		board.setSmoking("1");
		board.setRequest("수정된 요청사항");	
		board.setBookerFirstname("수정된 이름");
		board.setBookerLastname("수정된 성");
		board.setBookerEmail("수정된 이메일");
		board.setBookerPhone("1");
		board.setBookStatus("RS_STT_BC");
		
		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy/mm/dd");
		try {
			board.setBookDate(beforeFormat.parse("2020/02/02"));
			board.setCheckinDate(beforeFormat.parse("2020/02/02"));
			board.setCheckoutDate(beforeFormat.parse("2020/02/02"));
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		int count = mapper.update(board);
		log.info("UPDATE COUNT: " + count);
	}

	
	
	// 3-2. 예약번호 B2의  예약을 취소한다 ( RS_STT_BK ->  RS_STT_BC 로 업데이트)  (완)
	
	@Test
	public void testDelete() {
		log.info("DELETE COUNT: " + mapper.delete("B2"));
	}

	

	// ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
	// ★★★★★★★★★★★★★★★★★★★★★★★★★★4. testInsert ★★★★★★★★★★★★★★★★★★★★★★★★★★
	// ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★		
	
	
	
	//  예약번호 B2의  예약을 취소한 내역을 저장한다. (Status에 insert)  (완)	
	@Test
	public void testInsert() {								
		mapper.changeStatus("B3", "예약완료");		
	}

	

	// ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
	// ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
	// ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★		
	
	// 객실번호 R210에 해당하는 객실정보와 대응하는 숙소정보를 불러온다.
	@Test
	public void testGetInfo() {
		log.info(mapper.getInfo("R210"));
	}
	
//	@Test
//	public void testInsert2() {
//		BookingVO book = new BookingVO();
//		book.setUserNum("U1");
//		book.setRomNum("R24");
//		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy/MM/dd");
//		try {
//			book.setCheckinDate(beforeFormat.parse("2020/8/1"));
//			book.setCheckoutDate(beforeFormat.parse("2020/8/3"));
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
//		book.setStaydays(2);
//		book.setGuest(2);
//		book.setBookPrice(1004);
//		book.setExpectedArr("PM02");
//		book.setSmoking("1");
//		book.setRequest("뷰 좋은 방 주세요");
//		book.setBookerLastname("테스트");
//		book.setBookerFirstname("테스트");
//		book.setBookerEmail("test@ana.com");
//		book.setBookerPhone("010");
//		book.setBookStatus("RS_STT_BK");
//		mapper.insert(book);
//
//		log.info(book);
//	}
	
	
	
	

}
