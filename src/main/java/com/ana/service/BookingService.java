package com.ana.service;

import java.util.List;

import com.ana.domain.AcmVO;
import com.ana.domain.BookCancelVO;
import com.ana.domain.BookVO;
import com.ana.domain.BookingVO;

public interface BookingService {
	
	public BookingVO get(String book_Num);
	
	public boolean modify(BookingVO info);
	
	public boolean remove(String book_Num);
	
	public List<BookingVO> getList();

	public List<BookVO> getBookList(String loginUserNum); //새로 가져올 리스트
	
	public List<BookCancelVO> getCancelList(String loginUserNum); //취소중인 상태
	
	
	
}
