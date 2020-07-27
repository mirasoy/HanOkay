package com.ana.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ana.domain.AcmRomVO;
import com.ana.domain.BookCancelVO;
import com.ana.domain.BookVO;
import com.ana.domain.BookingVO;

public interface BookingService {
	
	public List<BookingVO> getList();

	public BookingVO get(String bookNum);
	
	public List<BookVO> getBookListAll(String loginUserNum); // 모든 예약 목록 리스트

	public List<BookVO> getBookList(String loginUserNum); // 예약중인 목록 리스트

	public List<BookVO> getCheckoutList(String loginUserNum); // 예약완료 리스트

	public List<BookCancelVO> getCancelList(String loginUserNum); // 취소중인 상태		

	public boolean modify(BookingVO info); //수정 

	public boolean reserveCancel(@Param("bookNum") String bookNum, @Param("bookStatus") String bookStatus); //취소시, insert와 update

	
//	public int register(BookingVO book);
	
	public AcmRomVO getInfo(String romNum); // 객실번호로 객실정보와 대응하는 숙소정보를 불러온다

}
