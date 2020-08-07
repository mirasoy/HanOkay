package com.ana.controller;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ana.domain.BookingVO;
import com.ana.domain.PaymentVO;
import com.ana.service.AcmDetailService;
import com.ana.service.BookingService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/booking/*")
@AllArgsConstructor
public class BookingRegisterController {
	
	private BookingService service;
	private AcmDetailService star;
	

	// 예약 확인 페이지 : 예약한 정보를 불러온다
	@GetMapping("/get")
	public void getInfo(
			@RequestParam("bookNum") String bookNum,
			Model model) {
		log.info("■■■■■■■■■■■■■■■■■■■■■■■■ 예약정보 불러오는 중...");
		
		service.getBooking(bookNum);
		model.addAttribute("book", service.getBooking(bookNum));
	}
	
	// 예약페이지 -> 예약완료페이지 이동: 예약정보를 저장하고 예약완료 페이지로 이동한다
	@PostMapping("/get")
	public String book(
			BookingVO booking,
			PaymentVO payment) {
		log.info("■■■■■■■■■■■■■■■■■■■■■■■■ 예약 처리 중...");
		
		log.info(booking);
		log.info(service.registerBooking(booking));
		
		payment.setBookNum(booking.getBookNum());
		log.info(payment);
		log.info(service.registerPayment(payment));
		
		return "redirect:/booking/get?bookNum="+booking.getBookNum();
	}
	
	// 상세페이지 -> 예약페이지 이동: 상세페이지에서 가져온 정보로 예약을 위한 정보들을 불러온다
	@PostMapping("/new") 
	public void getAcmInfo(
			@RequestParam("in") String checkin,
			@RequestParam("out") String checkout,
			@RequestParam("romNum") String romNum,
			Model model, HttpServletRequest request	) {
		log.info("■■■■■■■■■■■■■■■■■■■■■■■■ 예약페이지로 이동 중...");
		
		
		
	     
	     
	     model.addAttribute("days", getDiff(checkin, checkout))
		.addAttribute("star", star.getStisf(service.getAcmInfo(romNum).getAcmNum())) // 숙소별 별점
		.addAttribute("info", service.getAcmInfo(romNum)); // 객실과 숙소 정보
	}
	
	public long getDiff(String in, String out) {
		Calendar CkIn = setCal(in);
		Calendar CkOut = setCal(out);
		
		// 날짜 간의 차이를 얻기 위해서 천분의 일초 단위로 변환
		long diffSec = ( CkOut.getTimeInMillis() - CkIn.getTimeInMillis() )/ 1000;
		long diffDay = diffSec / (60*60*24);
		return diffDay;
	}
	
	// 날짜 패턴 맞추기
	public Calendar setCal(String date) {
		Calendar cal = Calendar.getInstance();
		cal.clear();
		String[] tmp = date.split("-");
		cal.set(Integer.parseInt(tmp[0]), Integer.parseInt(tmp[1])-1, Integer.parseInt(tmp[2]));
		return cal;
	}
}
 