package com.ana.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.ana.domain.UserVO;
import com.ana.service.EmailService;
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

	@Autowired
	private EmailService emailService;
	
	// 회원가입 페이지 보여주기
	@GetMapping("/signUp")
	public String showPage() {
		return "/register/signUp";
	}

	//checkEmail을 get방법으로 하면 에러 페이지를 보여주자
	@GetMapping("/checkEmail")
	public String getCheckEmail() {
		return "/error/error";
	}
	
	// 이메일 중복 검사 (ajax로 값을 받아온다)
	@RequestMapping(value = "/checkEmail", method = RequestMethod.POST)
	@ResponseBody
	public void checkEmail(String email,HttpServletRequest request, HttpServletResponse response)
throws IOException{	
		JSONObject jso= new JSONObject();
		log.info("email check: " + email);
		//한글 깨짐 방지
		response.setContentType("text/plain;charset=UTF-8");
		String msg="";
		//service에게 email을 주고 db를 뒤져오게한다
		if (service.checkEmail(email)) {
			log.info("checkEmail에서 service 성공");
			msg="해당 이메일을 사용하실 수 있습니다";
			jso.put("msg", msg);		
		} 
		else {
			log.info("checkEmail에서 service를 불렀더니 이미 db에 있는 이메일임!");
			msg="이미 등록된 이메일입니다!";
			jso.put("msg", msg);
		}
		PrintWriter out = response.getWriter();
		out.print(jso);
	}

	// 회원가입 하기
	@PostMapping("/register")
	public ModelAndView register(UserVO user, Model model, RedirectAttributes rttr) {
		log.info("register user: " + user);
		ModelAndView mv= new ModelAndView();
		
		//중복된 이메일이 있는지 한번 더 db를 확인한다(refresh할 때 중복 저장되는 경우가 있어서 그걸 막으려고)
		if (service.checkEmail(user.getEmail())) {
		service.register(user);
		//세션에 user를 저장한다(회원가입 성공하면 바로 로그인이 되는거)
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

	//emailAuth 페이지를 get방식으로 접근하면 에러페이지를 보여주자
	//7.14 오늘은 개발을 위해서 그냥 emailAuth 페이지를 보여주게 해놓음
	@GetMapping("/emailAuth")
	public String cannotGetEmailAuth() {
		return "register/emailAuth";
	}
	
	//인증메일을 발송하는 기능
	//누르면 emailAuth.jsp로 이동하고
	//쿠키가 생성되어 sign Up form에서 채워진 값들이 저장되서 emailAuth.jsp로 넘어간다
	@PostMapping("/emailAuth")
	public void sendAuthEmail(UserVO user) {
		//db에 회원의 이메일 정보가 있다면
		log.info("email authentication: "+user);
		if(service.checkEmail(user.getEmail())) {
			//이메일을 보낸다(쿠키 저장한다)
			if(emailService.sendAuthEmail(user.getEmail())) {
				//성공적으로 보냈으면		
				//이메일로 발송한 인증코드를 칠 수 있게 jsp에게 알려주고
			}
			else {
				//성공적으로 못보냇으면
				//실패했다고 알려준다(발송의 실패)
			}
		} else {
			//db에 회원정보가 없으면
			//회원정보가 없다고 알리고findPwd페이지로 다시 가게 한다
		}
		
	}
}
