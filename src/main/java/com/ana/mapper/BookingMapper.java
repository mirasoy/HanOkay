package com.ana.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ana.domain.AcmRomVO;
import com.ana.domain.BookCancelVO;
import com.ana.domain.BookingInfoVO;
import com.ana.domain.BookVO;
import com.ana.domain.BookingVO;
import com.ana.domain.PaymentVO;

public interface BookingMapper {
	
	public List<BookingVO> getList(); // 1. 모든 상태 리스트	
	
	public List<BookVO> getBookListAll(String loginUserNum); //모든 상태 리스트
	
	public List<BookVO> getBookList(String loginUserNum); //예약중인 상태
	
	public List<BookVO> getCheckoutList(String loginUserNum);  // 예약 완료 상태
	
	public List<BookCancelVO> getCancelList(String loginUserNum); //취소중인 상태
	
	public BookingVO read(String bookNum);
			
	public int update(BookingVO info);
		
	public int delete(String bookNum); //예약 취소를 위함	
	
	public int changeStatus(@Param("bookNum")String bookNum, @Param("bookStatus")String bookStatus);
	
	
	
	public AcmRomVO getAcmInfo(String romNum); // 예약페이지와 예약완료페이지에서 예약을 위한 숙소 및 객실 정보 출력

	public boolean insertBooking(BookingVO booking); // 예약페이지에서 예약 진행
	
	public boolean insertPayment(PaymentVO payment); // 예약페이지에서 예약 진행
	
	public BookingInfoVO getBooking(String bookNum); // 예약완료페이지에서 예약 정보 출력 
	
	///호스트단
	public List<BookVO> dateGetinBooking(@Param("ownerUser") String ownerUser,@Param("checkinDate") String checkinDate); 
	public List<BookVO> dateGetoutBooking(@Param("ownerUser") String ownerUser,@Param("checkoutDate") String checkoutDate); 
	public int dateGetinPayLater(@Param("ownerUser") String ownerUser,@Param("checkinDate") String checkinDate);
	public List<BookingVO> getBookinfoRoms(String romNum);
	public PaymentVO getPayment(String bookNum);
	
}