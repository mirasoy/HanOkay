package com.ana.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ana.domain.AcmVO;
import com.ana.domain.BookCancelVO;
import com.ana.domain.BookStatusVO;
import com.ana.domain.BookVO;
import com.ana.domain.BookingVO;
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
		// TODO Auto-generated method stub
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


	@Override
	public int register(BookingVO book) {
		if(!(book.getBookerFirstname().length() <= 50 && 
				book.getBookerLastname().length() <= 50 && 
				book.getBookerEmail().length() <= 100 && 
				book.getBookerEmail().contains("@") &&
				(Integer.toString(book.getBookerPhone()).length() <= 15 ||
				Integer.toString(book.getBookerPhone()).length() > 0 ))
		){
			System.out.println("올바르지 않은 접근으로 입력 시도!!!");
			log.info("올바르지 않은 접근으로 입력 시도!!! register......" + book);
			return 0;
		}
		log.info("register......" + book);
		return mapper.insert(book);
	}

}
