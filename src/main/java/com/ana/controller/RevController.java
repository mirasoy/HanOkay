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

import com.ana.domain.RevVO;
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
	public void list(Model model, HttpServletRequest request) {

        HttpSession session = request.getSession();
        String member = (String) session.getAttribute("member");

		log.info("list");
		model.addAttribute("list", service.getUserList(member));
	}
	
	@PostMapping("/register")
	public String register(RevVO review, RedirectAttributes rttr) {
		log.info("register: " + review);
		service.register(review);
		rttr.addFlashAttribute("result", review.getPstNum());
		
		return "redirect:/review/list";
	}
	
	@GetMapping("/get")
	public String get(@RequestParam("pstNum") String pstNum, Model model) {
		log.info("/get");
		model.addAttribute("review", service.get(pstNum));
		return "redirect:/review/list";
	}
	
	@PostMapping("/modify")
	public String modify(RevVO review, RedirectAttributes rttr) {
		log.info("modify:" + review);
		
		if(service.modify(review)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/review/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("pstNum") String pstNum, RedirectAttributes rttr) {
		log.info("remove..."+pstNum);
		if(service.remove(pstNum)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/review/list";
	}
}
