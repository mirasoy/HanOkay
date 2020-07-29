package com.ana.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ana.domain.Criteria;
import com.ana.domain.PageDTO;
import com.ana.domain.QnaVO;
import com.ana.service.QnaService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/qna/*")
@AllArgsConstructor
public class QnaController {
	
	private QnaService service;
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		
		log.info("list: " + cri);
		model.addAttribute("list", service.getList(cri));
		
		int total = service.getTotal(cri);
		log.info("total: " + total);
		model.addAttribute("pageMaker",new PageDTO(cri,total));
	}
	
	@PostMapping("/register")
	public String register(QnaVO qna, RedirectAttributes rttr) {
		log.info("register: " + qna);
		
		service.register(qna);
		
		rttr.addFlashAttribute("result", qna.getBno());
		
		return "redirect:/qna/list";
	}
	
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/get or modify");
		model.addAttribute("qna", service.get(bno));
	}
	
	@PostMapping("/modify")
	public String modify(QnaVO qna, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify:" + qna);
		
		if(service.modify(qna)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		return "redirect:/qna/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("remove..." + bno);
		
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		return "redirect:/qna/list";
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
}
