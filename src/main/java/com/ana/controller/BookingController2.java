package com.ana.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ana.domain.BookingVO;
import com.ana.service.AcmService;
import com.ana.service.RomService;
import com.ana.service.BookingService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/booking/*")
@AllArgsConstructor
public class BookingController2 {
// 예약 페이지 & 예약 확인페이지	
	
	private AcmService acmService;
	private RomService romService;
	private BookingService bookService;
	
	@GetMapping("/new")
	public void getInfo( // 예약 페이지 : 예약과 관련된 숙소와 객실 정보 등을 불러온다
			@RequestParam("romNum") String romNum,
			@RequestParam("in") String checkin,
			@RequestParam("out") String checkout,
			@RequestParam("person") String person,
			@RequestParam("price") String price,
			Model model) {
		log.info("getInfo");
		
		model.addAttribute("acm", acmService.get(romService.get(romNum).getAcmNum()))
		.addAttribute("rom", romService.get(romNum));
	}
	
	@PostMapping("/new")
	public String booking( // 예약 페이지 : 예약 정보를 저장한다
			BookingVO book, 
			RedirectAttributes rttr) {
		log.info("booking"+book);

		bookService.register(book);
		rttr.addFlashAttribute("book", book.getBookNum());
		
		return "redirect:/booking/get?bookNum="+book.getBookNum();
	}
	
	@GetMapping("/get")
	public void get( // 예약 확인 페이지 : 예약 정보를 불러온다
			@RequestParam("bookNum") String bookNum,
			Model model) {
		log.info("get");
		
		bookService.get(bookNum);
		
		model.addAttribute("book", bookService.get(bookNum))
		.addAttribute("acm", acmService.get(romService.get(bookService.get(bookNum).getRomNum()).getAcmNum()));
	}
	
}
