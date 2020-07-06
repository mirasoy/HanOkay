package com.ana.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ana.domain.BookingVO;
import com.ana.domain.RevDetailVO;
import com.ana.domain.RevPostVO;
import com.ana.domain.RevVO;
import com.ana.service.BookingService;
import com.ana.service.RevService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/review/*")
@AllArgsConstructor

public class RevController {
	
	private RevService service;
	
	@GetMapping("/list")
	public void list(Model model, HttpSession session) {
 
      String userNum = (String) session.getAttribute("userNum");

		log.info("list");
//		model.addAttribute("list", service.getBookingList(userNum));
		model.addAttribute("list", service.getBookingList("U3"));
	}
	
	@GetMapping("/register")
	public void register(@RequestParam("bookNum") String bookNum, Model model) {
		
		log.info("어떤 예약을 쓸거냐?? ?? >> "+ bookNum);
		log.info("어떤 예약을 쓸거냐?? ?? >> "+ service.getByBooknum(bookNum));
		model.addAttribute("booking", service.getByBooknum(bookNum));	
	}
	
	@PostMapping("/register")
	public String register(RevPostVO revP, RevDetailVO reDetail, RedirectAttributes rttr) {
		
		
		
		
		RevVO rev = service.getByBooknum(reDetail.getBookNum());
		
		log.info("register:1>>>>>>>> " + rev);
		rev.setRevPurl("사진임시");
		rev.setTitle(revP.getTitle());
		rev.setContent(reDetail.getContent());
		rev.setStisf(reDetail.getStisf());
		
		log.info("register:2>>>>>>>> " + rev);
		service.register(rev);
//		rttr.addFlashAttribute("result", review.getPstNum());
		
		return "redirect:/review/list";
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("pstNum") String pstNum, Model model) {
		
		log.info("/get");
		
		model.addAttribute("review", service.get(pstNum));
		
	}
	
	@PostMapping("/modify")
	public String modify(RevVO review, RedirectAttributes rttr) {
		log.info("modify:" + review);
		
		if(service.modify(review)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/review/list";
	}
	
	@GetMapping("/delete")
	public String remove(@RequestParam("pstNum") String pstNum, Model model) {
		log.info("remove..."+pstNum);
		service.remove(pstNum);
		
		return "redirect:/review/list";
	}
}
