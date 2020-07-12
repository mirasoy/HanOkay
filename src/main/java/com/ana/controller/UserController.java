package com.ana.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
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
@SessionAttributes("user")
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
			rttr.addFlashAttribute("assureEmailCheck", "pass");

		} else {
			rttr.addFlashAttribute("msg1", "사용불가! 중복된 이메일이 있습니다");
			//rttr.addFlashAttribute("assureEmailCheck", "fail");
		}
		
		rttr.addFlashAttribute("email", email);
		return "redirect:/register/signUp";
	}

	// 회원가입 하기
	@PostMapping("/register")
	public ModelAndView register(UserVO user, Model model, RedirectAttributes rttr) {
		log.info("register user: " + user);
		ModelAndView mv= new ModelAndView();
		
		//중복된 이메일이 있는지 한번 더 db를 확인한다(refresh할 때 중복 저장되는 경우가 있어서 그걸 막아야함)
		if (service.checkEmail(user.getEmail())) {
		service.register(user);
		//세션에 user를 저장한다
		model.addAttribute("user", user);
		log.info("user가 세션에 담겼으면 조켔당 "+ user);
		mv.setViewName("register/register");
		} 
		
		//중복된 이메일이 있는 경우 그냥 회원가입 폼으로 다시 보내버리자
		else {
			
			//rttr.addFlashAttribute("msg1", "해당 이메일로 이미 가입된 정보가 있습니다!!");
			mv.setViewName("register/signUp");
		}
		return mv;
		
		//세션에 user라는 키로 user객체를 담아주기
	}

	
	//인증메일을 발송하는 기능(미구현)
	@PostMapping("/EmailAuth")
	public void sendAuthEmail(String email, RedirectAttributes rttr) {
		log.info("입력된 email: "+ email);
		emailService.sendAuthEmail(email);
		ModelAndView mv = new ModelAndView();
	
				
	}

}
