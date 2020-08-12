package com.ana.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.print.attribute.standard.Severity;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	@GetMapping("/account/findPwd")
	public String showFindPasswordPage() {
		return "/account/findPwd";
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
	
	//pwd를 찾기위해 이메일 보내는 메서드
	@RequestMapping(value="/account/accountRecovery", method=RequestMethod.POST)
	@ResponseBody
	public void sendEmailToFindPwd(String email, HttpServletResponse response) throws IOException {
		log.info("::::::email in UserController: "+ email);
		JSONObject jso= new JSONObject();
		
		//인증메일 보내는 거 성공하면
		if(service.sendAuthCode2FindPwd(email)) {
			log.info(":::::email: "+ email+"보내는 것 성공쓰~!!!!");
			jso.put("hiddenEmail", email);
			jso.put("msg", "success");
		}
		else {
			//db에 해당 이메일 주소가 등록되어있지 않음
			jso.put("msg", "fail");
		}
		
		PrintWriter out=response.getWriter();
		out.print(jso);

	}
	
	@RequestMapping(value="/account/emailAuth", method=RequestMethod.POST)
	public ModelAndView showEmailAuthPagetoEnterCode(String hiddenEmail) {
		log.info("#######email 주소 in UserContoroller::submitAuth : " + hiddenEmail);
		ModelAndView mv= new ModelAndView();
		
		mv.addObject("email", hiddenEmail);
		mv.setViewName("/account/emailAuth");
		
		return mv;
	}
	
	//인증코드를 재생성하고 이메일을 다시보내는 메서드
	@RequestMapping(value="/account/sendAgain", method=RequestMethod.POST)
	@ResponseBody
	public void sendAuthCodeAgain(String email, HttpServletResponse response) throws IOException {
		log.info(":::USERCONTROLLER sendAgain에 email 왔냐: "+ email);
	
		
		JSONObject jso= new JSONObject();
		
		if(service.sendAuthCode2FindPwd(email)){
			jso.put("msg", "success");
		}
		else {
			jso.put("msg", "fail");
		}
			
		PrintWriter out= response.getWriter();
		out.print(jso);
	
	}
	
	@RequestMapping(value="/account/submitAuth", method=RequestMethod.POST)
	@ResponseBody
	public void submitAuthCodeToGetPwd(String email, String enteredAuthCode, HttpServletResponse response, HttpSession session) throws IOException {
		log.info(":::USERCONTROLLER submitAuth에 email 왔냐: "+ email);
		log.info(":::USERCONTROLLER submitAuth에 enteredAuthCode 왔냐: "+ enteredAuthCode);
		JSONObject jso= new JSONObject();
		
		if(service.matchAuthCodeAndGiveSession(email, enteredAuthCode, session)){
			jso.put("msg", "success");
		}
		else {
			jso.put("msg", "fail");
		}
			
		PrintWriter out= response.getWriter();
		out.print(jso);
	}
	
	@RequestMapping(value="/account/myAccount/showUpdatedProfile", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, UserProfileVO> showUpdatedProfile(String userNum, HttpServletResponse response) throws IOException {
		log.info("uSerNum넘어 왔니??!!!!"+ userNum);
		UserProfileVO profile= service.getUserProfileBy(userNum);
		profile.setUserNum(userNum);
		log.info("service에서 넘겨받은 profile!!!!!!!!!"+ profile);
		
		  Map<String, UserProfileVO> map = new HashMap<String, UserProfileVO>();
		  map.put("profile", profile);
		  log.info("map: "+ map.get("profile"));
		 
		  return map;
		
 	}
}
