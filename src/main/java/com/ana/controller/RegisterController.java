package com.ana.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.ana.domain.UserVO;
import com.ana.service.EmailService;
import com.ana.service.UserHistoryService;
import com.ana.service.UserService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/register/*")
@AllArgsConstructor
@SessionAttributes("user")
public class RegisterController {

	@Autowired
	private UserService service;
	
	// 회원가입 페이지 보여주기
	@GetMapping("/signUp")
	public String showPage() {
		return "/register/signUp";
	}

	//checkEmail을 get방법으로 하면 에러 페이지를 보여주자
	@GetMapping("/checkEmail")
	public String getCheckEmail() {
		return "/error/404error";
	}
	
	// 이메일 중복 검사 (ajax로 값을 받아온다)
	@RequestMapping(value="/checkEmail", method=RequestMethod.POST)
	@ResponseBody
	public void checkEmail(UserVO user, String email,HttpServletRequest request, HttpServletResponse response)
throws IOException{
		JSONObject jso= new JSONObject();
		log.info("email check: " + email);
		log.info("user VO: "+ user);
		//한글 깨짐 방지
		response.setContentType("text/plain;charset=UTF-8");
		String msg="";
		String assureMsg="";
		//service에게 email을 주고 db를 뒤져오게한다
		if (service.canRegister(email)) {
			log.info("checkEmail에서 service 성공");
			msg="해당 이메일을 사용하실 수 있습니다";
			assureMsg="pass";
			jso.put("msg", msg);
			jso.put("assuredEmail", email);
			jso.put("assureMsg", assureMsg);
		} 
		else {
			log.info("checkEmail에서 service를 불렀더니 이미 db에 있는 이메일임!");
			msg="이미 등록된 이메일입니다!";
			assureMsg="fail";
			jso.put("msg", msg);
			jso.put("assureMsg", assureMsg);
		}
		PrintWriter out = response.getWriter();
		out.print(jso);
	}
	
	//emailAuth 페이지를 get방식으로 접근하면 에러페이지를 보여주자
	@RequestMapping(value = "/emailAuth", method = RequestMethod.GET)
	public String cannotGetEmailAuth() {
		log.info("emailAuth는 get방식으로 접근 불가!");
		return "/register/emailAuth";
	}
		
	//emailAuth에 post방식으로 접근	
	@RequestMapping(value = "/emailAuth", method = RequestMethod.POST)
	public ModelAndView sendEmailAuthAndRegister(UserVO user, Model model) {
		log.info("email authentication : "+ user);
		
		ModelAndView mv= new ModelAndView();
		
		if(service.registerThis(user)) {
			model.addAttribute("email", user.getUserEmail());
			mv.setViewName("/register/emailAuth");
			return mv;
		} else {
			model.addAttribute("msg2", "already");
			mv.setViewName("/account/myAccount/findPwd");
			return mv;
		}
	}
	
	@GetMapping("/registerFail")
	public String showRegisterFail() {
		log.info("register fail!!!!");
		return "/error/registerFail";
	}
	

	@PostMapping("/submitAuth")
	@ResponseBody
	public void submitAuthCode(String email, String enteredAuthCode, HttpServletRequest request, HttpServletResponse response) throws IOException{
		log.info(":::email 왔냐: "+ email);
		log.info(":::enteredAuthCode 왔냐: "+ enteredAuthCode);
		HttpSession session =request.getSession(true);
		
		JSONObject jso= new JSONObject();
		jso.put("msg", "success");
		
		if(service.grantActive(email, enteredAuthCode, session)){
			jso.put("msg", "success");
		}
		else {
			jso.put("msg", "fail");
		}
		PrintWriter out= response.getWriter();
		out.print(jso);
	}
	
	//인증코드를 재생성하고 이메일 재발송하는 메서드
	@PostMapping("/sendAgain")
	@ResponseBody
	public void sendAuthEmailAgain(String email, HttpServletResponse response) throws IOException {
		log.info(":::email 왔냐: "+ email);
	
		
		JSONObject jso= new JSONObject();
		
		if(service.sendAuthCode(email)){
			jso.put("msg", "success");
		}
		else {
			jso.put("msg", "fail");
		}
			
		PrintWriter out= response.getWriter();
		out.print(jso);
	}
}