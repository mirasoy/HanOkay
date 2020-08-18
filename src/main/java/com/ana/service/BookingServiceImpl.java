package com.ana.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ana.domain.AcmRomVO;
import com.ana.domain.AcmVO;
import com.ana.domain.BookCancelVO;
import com.ana.domain.BookStatusVO;
import com.ana.domain.BookVO;
import com.ana.domain.BookingInfoVO;
import com.ana.domain.BookingVO;
import com.ana.domain.PaymentVO;
import com.ana.mapper.BookingMapper;

import lombok.AllArgsConstructor;
import lombok.Builder.ObtainVia;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BookingServiceImpl implements BookingService{
	
	private BookingMapper mapper;


	@Override
	public List<BookingVO> getList() {
		log.info("getList......");
		return mapper.getList();
	}

	// 예약 확인 페이지: 예약 정보를 불러온다
	@Override
	public BookingVO get(String bookNum) {
		log.info("get......"+ bookNum);
		return mapper.read(bookNum);
	}


	@Override
	public boolean modify(BookingVO board) {
		log.info("modify......" + board);
		return mapper.update(board) == 1;
		
	}



	@Override
	public List<BookVO> getBookList(String loginUserNum) {
		log.info("예약중인 회원의 리스트......");
		return mapper.getBookList(loginUserNum);
	}


	@Override
	public List<BookCancelVO> getCancelList(String loginUserNum) {
		log.info("취소중인 회원의 리스트......");
		return mapper.getCancelList(loginUserNum);
	}


	@Override
	public List<BookVO> getBookListAll(String loginUserNum) {
		log.info("모든 예약 리스트......");
		return mapper.getBookListAll(loginUserNum);
	}


	@Override
	public List<BookVO> getCheckoutList(String loginUserNum) {
		log.info("모든 예약 리스트......");
		return mapper.getCheckoutList(loginUserNum);
	}




	@Transactional //둘중하나라도 처리가 안되면 전체 취소됨...
	@Override
	public boolean reserveCancel(String bookNum, String bookStatus) {
	
		return mapper.delete(bookNum) ==1 && mapper.changeStatus(bookNum, bookStatus)==1;
	}

	
	
	
	
	
	// 객실번호로 객실정보와 대응하는 숙소정보를 불러온다
	@Transactional
	@Override
	public AcmRomVO getAcmInfo(String romNum) {
		log.info("■■■■■■■■■■■■▶ getAcmInfo: "+ romNum);
		return mapper.getAcmInfo(romNum);
	}

	// 예약정보를 저장한다
	@Transactional
	@Override
	public boolean registerBooking(BookingVO booking) {
		log.info("■■■■■■■■■■■■▶ registerBooking: "+ booking);
		return mapper.insertBooking(booking);
	}

	// 결제정보를 저장한다
	@Transactional
	@Override
	public boolean registerPayment(PaymentVO payment) {
		log.info("■■■■■■■■■■■■▶ registerPayment: "+ payment);
		return mapper.insertPayment(payment);
	}
	
	// 예약과 관련된 정보를 불러온다
	@Transactional
	@Override
	public BookingInfoVO getBooking(String bookNum) {
		log.info("■■■■■■■■■■■■▶ getBooking: "+ bookNum);
		return mapper.getBooking(bookNum);
	}

	
	
	
	
	///호스트단 
	@Override
	public List<BookVO> dateGetinBooking(String ownerUser,String checkinDate) {
		return mapper.dateGetinBooking(ownerUser,checkinDate);
	}

	@Override
	public List<BookVO> dateGetoutBooking(String ownerUser,String checkoutDate) {
		return mapper.dateGetoutBooking(ownerUser,checkoutDate);
	}

	@Override
	public int dateGetinPayLater(String ownerUser, String today) {
		return mapper.dateGetinPayLater(ownerUser,today);
	}

	@Override
	public List<BookingVO> getBookinfoRoms(String romNum) {
		return mapper.getBookinfoRoms(romNum);
	}

	@Override
	public PaymentVO getPayment(String bookNum) {
		// TODO Auto-generated method stub
		return mapper.getPayment(bookNum);
	}

}
