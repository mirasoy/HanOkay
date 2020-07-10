package com.ana.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.ana.domain.UserVO;
import com.ana.service.EmailService;
import com.ana.service.UserService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/register/*")
@AllArgsConstructor
public class UserController {

	@Autowired
	private UserService service;

	@Autowired
	EmailService emailService;
	
	// 회원가입 페이지 보여주기
	@RequestMapping("/signUp")
	public String showPage() {
		return "/register/signUp";
	}

	// 이메일 중복 검사
	@PostMapping("/checkEmail")
	public String checkEmail(String email, RedirectAttributes rttr) {
		log.info("email check: " + email);
		if (service.checkEmail(email)) {
			rttr.addFlashAttribute("msg1", "해당 이메일 사용가능");

		} else {
			rttr.addFlashAttribute("msg1", "사용불가! 중복된 이메일이 있습니다");
		}
		rttr.addFlashAttribute("email", email);
		return "redirect:/register/signUp";
	}

	// 회원가입 하기
	@PostMapping("/register")
	public String register(UserVO user) {
		log.info("user: " + user);
		service.register(user);
		return "register/register";
	}

	
	//인증메일을 발송하는 기능
	@PostMapping("/EmailAuth")
	public void sendAuthEmail(String email, RedirectAttributes rttr) {
		log.info("입력된 email: "+ email);
		emailService.sendAuthEmail(email);
		ModelAndView mv = new ModelAndView();
	
				
	}

}
