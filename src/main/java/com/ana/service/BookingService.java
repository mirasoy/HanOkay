package com.ana.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ana.domain.BookCancelVO;
import com.ana.domain.BookVO;
import com.ana.domain.BookingVO;

public interface BookingService {

	public BookingVO get(String bookNum);

	public boolean modify(BookingVO info); //수정 

	public List<BookingVO> getList();

	public List<BookVO> getBookListAll(String loginUserNum); // 모든 예약 목록 리스트

	public List<BookVO> getBookList(String loginUserNum); // 새로 가져올 리스트

	public List<BookVO> getCheckoutList(String loginUserNum); // 예약완료 리스트

	public List<BookCancelVO> getCancelList(String loginUserNum); // 취소중인 상태

	public boolean reserveCancel(@Param("bookNum") String bookNum, @Param("bookStatus") String bookStatus); //취소시, insert와 update

	public int register(BookingVO book);

}
