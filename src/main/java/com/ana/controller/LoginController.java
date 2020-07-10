package com.ana.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.ana.domain.UserVO;
import com.ana.service.EmailService;
import com.ana.service.UserService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/user/*")
@AllArgsConstructor
@SessionAttributes("user")
public class LoginController {

	@Autowired
	UserService service;
	
	// login 페이지 보여주기
	@RequestMapping("/login")
	public String showLoginPage() {
		return "/user/login";
	}
	// findPwd 페이지 보여주기 기능
	@RequestMapping("/findPwd")
	public String findPwd() {
		return "/user/findPwd";
	}

	// 로그인 기능하기
	@PostMapping("/executeLogin")
	public String executeLogin(String email, String pwd, HttpServletRequest request, RedirectAttributes rttr, Model model) {
		log.info("login email: " + email);
		log.info("login pwd: " + pwd);
		//	ModelAndView mv = new ModelAndView();
		// 이메일과 비번이 일치하는 지 확인하기
		if (service.isValidUser(email, pwd)) {
			//해당 이메일을 가진 유저 객체 가져오기
			UserVO user = service.getUserById(email);
			//보안을 위해 비밀번호는 empty String으로 임의 변경
			user.setPwd("");
			//일치하면 모델에 세션에 유저 객체 담기
			model.addAttribute("user", user);
			log.info("***로그인한 user 정보: "+user);
			//로그인 성공했을 때 나타나는 뷰 이름
			return "/user/welcome";
		}
		//로그인에 실패했을 때 나타나는 뷰 이름
		rttr.addFlashAttribute("msg", "로그인 정보가 일치하지 않습니다!");
		return "redirect:/user/login";
	}

	
	//로그아웃을 하는 기능(=세션에서 user를 제거하는 기능)
	@GetMapping("/logout")
	public ModelAndView logout(SessionStatus status, HttpServletRequest request) {
		log.info("session 시작: "+status);
		//session을 모두 없애줘
		status.setComplete();
		ModelAndView mv= new ModelAndView();
		StringBuffer contextPath= request.getRequestURL();
		log.info("ContextPath: "+contextPath);
		//없애기가 성공 되었으면 로그를 찍어줘
		if(status.isComplete() == true) {
			log.info("Session removed successfully");
		}
		//그리고 acm/list 페이지로 가줘
		//하지만 다른 페이지의 헤더에서 로그아웃을 한 경우에 돌아가는 뷰는 해당 뷰여야함...(수정해야해!!)
		mv.setViewName("/acm/list");
		return mv;
	}
	
	//welcome 페이지 보여주는 기능
	@RequestMapping("/welcome")
	public String showWelcome() {
		return "user/welcome";
	}

	
}
