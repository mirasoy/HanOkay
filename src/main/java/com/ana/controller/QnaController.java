package com.ana.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@PostMapping("/register")
	public String register(QnaVO qna, RedirectAttributes rttr) {
		log.info("register: " + qna);

		service.register(qna);

		rttr.addFlashAttribute("result", qna.getBno());

		return "redirect:/qna/list";
	}
	
	@RequestMapping(value = "/get", method = RequestMethod.GET)
	public String get(HttpServletRequest request, HttpServletResponse response, HttpSession
				 session,
			@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) throws IOException {

		log.info("/get or modify");
		Cookie[] cookies = request.getCookies();

		// 비교하기 위해 새로운 쿠키
		Cookie viewCookie = null;

		// 쿠키가 있을 경우
		if (cookies != null && cookies.length > 0) {
			for (int i = 0; i < cookies.length; i++) {
				// Cookie의 name이 cookie + reviewNo와 일치하는 쿠키를 viewCookie에 넣어줌
				if (cookies[i].getName().equals("cookie" + bno)) {
					System.out.println("처음 쿠키가 생성한 뒤 들어옴.");
					viewCookie = cookies[i];
				}
			}
		}
		String goHit="N";
        // 만일 viewCookie가 null일 경우 쿠키를 생성해서 조회수 증가 로직을 처리함.
        if (viewCookie == null) {    
            System.out.println("cookie 없음");
            
            // 쿠키 생성(이름, 값)
            Cookie newCookie = new Cookie("cookie"+bno, "|" + bno + "|");
                            
            // 쿠키 추가
            response.addCookie(newCookie);

            // 쿠키를 추가 시키고 조회수 증가시킴
            //int result = bService.viewUp(reviewNo);
            goHit="Y";
            
        }
        // viewCookie가 null이 아닐경우 쿠키가 있으므로 조회수 증가 로직을 처리하지 않음.
        else {
            System.out.println("cookie 있음");
            
            // 쿠키 값 받아옴.
            String value = viewCookie.getValue();
            
            System.out.println("cookie 값 : " + value);
    
        }
		model.addAttribute("qna", service.get(bno,goHit));
		return "/qna/get";
	}
	@GetMapping({ "/modify" })
	public void modify(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {

		log.info("/get or modify");
		String goHit="N";
		model.addAttribute("qna", service.get(bno,goHit));
	}

	@PostMapping("/modify")
	public String modify(QnaVO qna, Criteria cri, RedirectAttributes rttr) {
		log.info("modify:" + qna);

		if (service.modify(qna)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/qna/list" + cri.getListLink();
	}

//	@PostMapping("/modify")
//	public String modify(QnaVO qna, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
//		log.info("modify:" + qna);
//		
//		if(service.modify(qna)) {
//			rttr.addFlashAttribute("result", "success");
//		}
//		
//		rttr.addAttribute("pageNum", cri.getPageNum());
//		rttr.addAttribute("amount", cri.getAmount());
//		rttr.addAttribute("type", cri.getType());
//		rttr.addAttribute("keyword", cri.getKeyword());
//		return "redirect:/qna/list";
//	}

	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, Criteria cri, RedirectAttributes rttr) {
		log.info("remove..." + bno);

		if (service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/qna/list" + cri.getListLink();
	}

//	@PostMapping("/remove")
//	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
//		log.info("remove..." + bno);
//		
//		if(service.remove(bno)) {
//			rttr.addFlashAttribute("result", "success");
//		}
//		rttr.addAttribute("pageNum", cri.getPageNum());
//		rttr.addAttribute("amount", cri.getAmount());
//		rttr.addAttribute("type", cri.getType());
//		rttr.addAttribute("keyword", cri.getKeyword());
//		return "redirect:/qna/list";
//	}

	@GetMapping("/register")
	public void register() {

	}

}
