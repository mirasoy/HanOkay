package com.ana.mapper;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ana.domain.AcmVO;
import com.ana.domain.BookingVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BookingMapperTests {

	@Setter(onMethod_= @Autowired)
	private BookingMapper mapper;
	
	
	@Test
	public void testDelete() {
		log.info("DELETE COUNT: " + mapper.delete("B13"));
	}
	
	
	@Test
	public void testUpdate() {
		BookingVO board = new BookingVO();
	
		board.setBookNum("B8");
		board.setUserNum("A1");
		board.setRomNum("수정된 방번호");
		board.setStaydays(1);
		board.setGuest(22);
		board.setBookPrice(123);
		board.setDeposit(1);
		board.setExpectedArr("수정된 예정시간");
		board.setRequest("수정된 요청사항");
		board.setRealArr("수정된 도착시간");
		
		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy/mm/dd");
		try {
			board.setBookDate(beforeFormat.parse("2020/02/02"));
			board.setCheckinDate(beforeFormat.parse("2020/02/02"));
			board.setChekoutDate(beforeFormat.parse("2020/02/02"));
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
		board.setCanceled('1');
		board.setSmoking('1');
		
		
		int count = mapper.update(board);
		log.info("UPDATE COUNT: " + count);
	}
	
	
	
	
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
}
