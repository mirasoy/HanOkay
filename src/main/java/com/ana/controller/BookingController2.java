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
	
	@GetMapping("/new")
	public void getInfo() { // 예약 페이지 : 예약과 관련된 숙소와 객실 정보 등을 불러온다
		log.info("getInfo");
	}
	
	@PostMapping("/new")
	public String booking() {
		log.info("booking");
		
		return "redirect:/booking/get?bookNum=";
	}
	
}
