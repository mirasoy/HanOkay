package com.ana.mapper;

import java.util.List;

import com.ana.domain.BookingVO;

public interface BookingMapper {
	
	
	public List<BookingVO> getList();
	
	public BookingVO read(String bookNum);
			
	public int update(BookingVO board);
		
	public int delete(String bookNum);
	
	
}
