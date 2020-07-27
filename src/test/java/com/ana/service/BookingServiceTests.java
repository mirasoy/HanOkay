package com.ana.service;

import static org.junit.Assert.assertNotNull;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ana.domain.AcmRomVO;
import com.ana.domain.BookingVO;
import com.ana.domain.RomVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BookingServiceTests {
	
	@Setter(onMethod_= {@Autowired})
	private BookingService service;
	
	
	//유저번호로 리스트 검색 (완)
	@Test
	public void testGetList() {
		service.getList().forEach(board-> log.info(board));
	}

	
	//예약번호로 리스트 검색 (완)
	// (select * from tbooking where book_Num = 'B1')
	@Test
	public void testGet() {
		service.get("B1");
	}
	
	
	// U1의 모든 리스트 (완)
	@Test
	public void testGetBookListAll() {
		service.getBookListAll("U1").forEach(board2-> log.info(board2));
	}
	
	
	// RS_STT_BK의 리스트 (완)
	@Test
	public void testGetBookList() {
		service.getBookList("U1").forEach(board2-> log.info(board2));
	}
	
	
	// RS_STT_AC의 리스트 (완)
	@Test
	public void testCheckout() {
		service.getCheckoutList("U1").forEach(board2-> log.info(board2));
	}
	
	
	// RS_STT_BC의 리스트 (완)
	@Test
	public void testCancleList() {
		service.getCancelList("A1").forEach(board2-> log.info(board2));

	}
	

	// 예약번호 B1의 정보를 수정하는 것을 테스트 (완)
	
	@Test
	public void testModify() {
		BookingVO board = service.get("B1");
		if(board == null) {
			return;
		}
		
		board.setBookerPhone("010");
		board.setRequest("요청사항 수정합니다.");
		log.info("MODIFY RESULT: " + service.modify(board));
		
	}	
	
	// 예약번호 B1의 예약 취소시, insert와 update (완)
	@Test
	public void testReserveCancel() {		
		log.info("예약상태를 변경하고 추가" + service.reserveCancel("B1", "RS_STT_BC"));			
	}
	
	
	
	
	
	@Test
	public void testGetInfo() {
		log.info(service.getInfo("R210"));
	}
	
	//@Test
	public void testRegister() {
		BookingVO book = new BookingVO();
		book.setUserNum("U999");
		book.setRomNum("R999");
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
		//book.setRomName("테스트");
		book.setBookerLastname("테스트");
		book.setBookerFirstname("테스트");
		book.setBookerEmail("test@ana.com");
		book.setBookerPhone("010");
		book.setBookStatus("RS_STT_BK");
		//service.register(book);

		log.info("생성된 예약 번호: " + book.getBookNum());
	}


}
