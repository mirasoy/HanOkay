package com.ana.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.ana.domain.BookCancelVO;
import com.ana.domain.BookStatusVO;
import com.ana.domain.BookVO;
import com.ana.domain.BookingVO;

public interface BookingMapper {
	
	public List<BookingVO> getList(); //모든 상태 리스트	(??) - 역할 고민중	
	
	public List<BookVO> getBookListAll(String loginUserNum); //모든 상태 리스트
	
	public List<BookVO> getBookList(String loginUserNum); //예약중인 상태
	
	public List<BookVO> getCheckoutList(String loginUserNum);  // 예약 완료 상태
	
	public List<BookCancelVO> getCancelList(String loginUserNum); //취소중인 상태
	
	public BookingVO read(String bookNum);
			
	public int update(BookingVO info);
		
	public int delete(String bookNum); //예약 취소를 위함	
	
	public int insert(@Param("bookNum")String bookNum, @Param("bookStatus")String bookStatus);
	
	
}
