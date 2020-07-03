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

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/MyPage/*")
@AllArgsConstructor

public class BookingController {
	private BookingService service;
	
	@GetMapping("/bookList")
	public void list(Model model, HttpSession session) {
		String loginUserNum = (String) session.getAttribute("loginUserNum");
		log.info("bookList");
		model.addAttribute("bookList", service.getBookList("A1"));
	}
	
	@GetMapping("/cancelled")
	public void list2(Model model2, HttpSession session) {
		String loginUserNum = (String) session.getAttribute("loginUserNum");
		log.info("cancelled 취소된 예약입니다.");
		model2.addAttribute("cancelled", service.getCancelList("A1"));		
	}
	
	
	
	
//	@GetMapping("/bookList")
//	public void list(Model model) {
//		log.info("bookList");
//		model.addAttribute("bookList", service.getList());
//	}	

	
	
	
	
	//예약 조회 페이지와 이동	
	@GetMapping({"/info", "modify"})
	public void get(@RequestParam("bookNum") String bookNum, Model model) {
		log.info("/info or modify");
		
		model.addAttribute("info", service.get(bookNum));
	}
	
	

	
	@PostMapping("/modify")
	public String modify(BookingVO info, RedirectAttributes rttr) {
		log.info("modify:"+info);
		log.info("되었습니다.");
		
		if(service.modify(info)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/MyPage/bookList";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bookNum") String bookNum, RedirectAttributes rttr) {
		log.info("remove...." + bookNum);
		if(service.remove(bookNum)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/MyPage/bookList";
	}
	

	
}
