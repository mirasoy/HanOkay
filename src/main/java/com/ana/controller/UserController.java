package com.ana.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ana.domain.UserProfileVO;
import com.ana.service.EmailService;
import com.ana.service.RevService;
import com.ana.service.UserService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class UserController {

	@Autowired
	private UserService service;

	@Autowired 
	private RevService revService;
	
	@Autowired
	private EmailService emailService;
	
	@GetMapping("/account/myAccount")
	public String showMyAccountPage() {
		return "/account/myAccount";
	}
	//account/myAccount/findPwd 를 보여주는 메서드
	@GetMapping("/account/myAccount/findPwd")
	public String showFindPasswordPage() {
		return "/account/myAccount/findPwd";
	}
	
	//내 프로필 보여주는 메서드
	@GetMapping("/account/myAccount/myProfile")
	public ModelAndView showProfilePage(HttpSession session, HttpServletRequest request, Model model) {
		ModelAndView mv= new ModelAndView();
		
		if(session.getAttribute("user") !=null) {
			log.info("session에 들어있는 유저:"+ session.getAttribute("user"));
			model.addAttribute("profile", service.showProfile(session));
			log.info(service.showProfile(session));
			
			model.addAttribute("reviewCount", revService.getMyReviewCount(session));
			mv.setViewName("/account/myAccount/myProfile");
			return mv;
			
		}
		else {
			mv.setViewName("/user/list");
			return mv;
		}
	}
	
	
	//프로필 수정하는 메서드
	@ResponseBody
	@PostMapping("/account/myAccount/updateMyProfile")
	public Map<String, Object> updateProfile(UserProfileVO prof) {
		log.info("prof::::"+ prof);
		service.updateProfile(prof);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("msg", "success");
	
		return map;
	}
	
	@GetMapping("/account/myAccount/myInfo")
	public String showMyInfoPage() {
		return "/account/myAccount/myInfo";
	}
	

	@GetMapping("/account/myAccount/loginAndSecurity")
	public String showLoginAndSecurityPage() {
		return "/account/myAccount/loginAndSecurity";
	}
	
	@RequestMapping(value="/account/myAccount/accountRecovery", method=RequestMethod.POST)
	public void sendEmailToFindPwd(String email) {
		log.info("email in UserController: "+ email);
		
	}
}
