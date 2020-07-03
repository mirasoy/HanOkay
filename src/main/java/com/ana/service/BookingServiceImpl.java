package com.ana.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ana.domain.AcmVO;
import com.ana.domain.BookCancelVO;
import com.ana.domain.BookVO;
import com.ana.domain.BookingVO;
import com.ana.mapper.AcmMapper;
import com.ana.mapper.BookingMapper;

import lombok.AllArgsConstructor;
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

	
	@Override
	public BookingVO get(String book_Num) {
		log.info("get......"+ book_Num);
		return mapper.read(book_Num);
	}


	@Override
	public boolean modify(BookingVO board) {
		log.info("modify......" + board);
		return mapper.update(board) == 1;
		
	}


	@Override
	public boolean remove(String book_Num) {
		log.info("remove...."+ book_Num);
		return mapper.delete(book_Num) ==1;
 	}


	@Override
	public List<BookVO> getBookList(String loginUserNum) {
		log.info("예약중인 회원의 리스트......");
		return mapper.getBookList(loginUserNum);
	}


	@Override
	public List<BookCancelVO> getCancelList(String loginUserNum) {
		// TODO Auto-generated method stub
		log.info("취소중인 회원의 리스트......");
		return mapper.getCancelList(loginUserNum);
	}

	
	
	
}
