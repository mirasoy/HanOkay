package com.ana.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ana.domain.AcmVO;
import com.ana.service.AcmService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/acm/*")
@AllArgsConstructor
public class AcmController {
	
	private AcmService service;
	
	@GetMapping({"/list"})
	public void list(Model model) {
		
		log.info("list");
		model.addAttribute("list", service.getList());
	
	}
	
	@PostMapping("/register")
	public String register(AcmVO acm, RedirectAttributes rttr) {
		log.info("register: " + acm);
		service.register(acm);
		rttr.addFlashAttribute("result", acm.getAcmNum());
		
		return "redirect:/acm/list";
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("acmNum") String acmNum, Model model) {
		log.info("/get");
		model.addAttribute("acm", service.get(acmNum));
	}
	
	@PostMapping("/modify")
	public String modify(AcmVO acm, RedirectAttributes rttr) {
		log.info("modify:" + acm);
		
		if(service.modify(acm)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/acm/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("acmNum") String acmNum, RedirectAttributes rttr) {
		log.info("remove..."+acmNum);
		if(service.remove(acmNum)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/acm/list";
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
}
