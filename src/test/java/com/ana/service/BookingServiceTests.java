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
import com.ana.domain.PaymentVO;
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
	
	
	
	
	
	//@Test
	public void testGetInfo() {
		log.info(service.getAcmInfo("R210"));
	}
	
	//@Test
	public void testRegisterBooking() {
		BookingVO booking = new BookingVO();
		booking.setUserNum("U1");
		booking.setRomNum("R24");
		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy/MM/dd");
		try {
			booking.setCheckinDate(beforeFormat.parse("2020/8/1"));
			booking.setCheckoutDate(beforeFormat.parse("2020/8/3"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		booking.setStaydays(2);
		booking.setGuest(2);
		booking.setBookPrice(1004);
		booking.setExpectedArr("PM02");
		booking.setSmoking("1");
		booking.setRequest("뷰 좋은 방 주세요");
		booking.setBookerLastname("테스트");
		booking.setBookerFirstname("테스트");
		booking.setBookerEmail("test@ana.com");
		booking.setBookerPhone("010");
		booking.setBookStatus("RS_STT_BK");
		service.registerBooking(booking);

		log.info("생성된 예약 번호: " + booking.getBookNum());
	}
	
	//@Test
	public void testRegisterPayment() {
		PaymentVO payment = new PaymentVO();
		payment.setAcmNum("A1");
		payment.setBookNum("B1024");
		payment.setCoupon("0");
		payment.setDiscount("0");
		payment.setMileage("0");
		payment.setPayMethod("test");
		payment.setPrice("0");
		payment.setRomNum("R1");
		payment.setSubtotal("0");
		payment.setTotal("0");
		payment.setVat("0");
		payment.setStaydays("1");
		payment.setPayStatus("test");
		payment.setUserNum("U1");
		
		service.registerPayment(payment);
		
		log.info(payment);
		log.info(service.registerPayment(payment));
	}

	//@Test
	public void testGetBooking() {
		log.info(service.getBooking("B1"));
	}

}
