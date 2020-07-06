package com.ana.mapper;

import java.util.List;

import com.ana.domain.BookingVO;
import com.ana.domain.RomVO;

public interface BookingMapper {
	
	public List<BookingVO> getList();
	
	public BookingVO read(String bookNum);
			
	public int update(BookingVO info);
		
	public int delete(String bookNum);
	
	public int insert(BookingVO booking);
}
