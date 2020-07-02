package com.ana.service;

import java.util.List;

import com.ana.domain.AcmVO;
import com.ana.domain.BookingVO;

public interface BookingService {
	
	public BookingVO get(String book_Num);
	
	public boolean modify(BookingVO info);
	
	public boolean remove(String book_Num);
	
	public List<BookingVO> getList();


	
	
	
}
