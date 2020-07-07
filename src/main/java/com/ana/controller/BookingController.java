package com.ana.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ana.domain.BookingVO;
import com.ana.service.BookingService;
//import com.ana.service.MailService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/MyPage/*")
@AllArgsConstructor

public class BookingController {
	private BookingService service;

	
	@PostMapping("/sendMail")
	public void sendMail(String bookNum,String email) {
		
	}
	
	//모든 목록
	@GetMapping("/bookListAll")
	public void list(Model model, HttpSession session) {
		String loginUserNum = (String) session.getAttribute("loginUserNum");
		log.info("bookListAll");
		model.addAttribute("bookListAll", service.getBookListAll("U1"));
	}
	
	//예약 예정 목록
	@GetMapping("/bookList")
	public void list2(Model model2, HttpSession session) {
		String loginUserNum = (String) session.getAttribute("loginUserNum");
		log.info("bookList");
		model2.addAttribute("bookList", service.getBookList("U1"));
	}
	
	
	//예약 완료 목록
	@GetMapping("/checkout")
	public void list3(Model model3, HttpSession session) {
		String loginUserNum = (String) session.getAttribute("loginUserNum");
		log.info("checkout 완료된 예약입니다.");
		model3.addAttribute("checkout", service.getCheckoutList("U1"));
	}
	
	//예약 취소 목록
	@GetMapping("/cancelled")
	public void list4(Model model4, HttpSession session) {
		String loginUserNum = (String) session.getAttribute("loginUserNum");
		log.info("cancelled 취소된 예약입니다.");
		model4.addAttribute("cancelled", service.getCancelList("U1"));		
	}
	
	
	
	
	
	//예약 조회 페이지와 이동	
	@GetMapping({"/info", "modify"})
	public void get(@RequestParam("bookNum") String bookNum, Model model) {
		log.info("/info or modify");
		
		model.addAttribute("info", service.get(bookNum));
	}
	
	

//예약 수정	
	@PostMapping("/modify")
	public String modify(BookingVO info, RedirectAttributes rttr) {
		log.info("modify:"+info);
		log.info("되었습니다.");
		
		if(service.modify(info)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/MyPage/bookList";
	}

//예약 취소  ( 취소시, 상태를 변화시키고, 로그에 저장한다 )
	@PostMapping("/remove")
	public String remove(@RequestParam("bookNum") String bookNum, RedirectAttributes rttr) {
		log.info("당신의 예약을 취소합니다...." + bookNum);
		if(service.reserveCancel(bookNum,"RS_STT_BC")) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/MyPage/bookList";
	}
	

	
}
