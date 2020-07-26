package com.ana.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.ana.domain.UserVO;
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
	@GetMapping("/login")
	public String showLoginPage() {
		return "/user/login";
	}

	// welcome 페이지 보여주는 기능
	@GetMapping("/welcome")
	public ModelAndView showWelcome(Model model, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/welcome");
		return mv;
	}

	// excuteLogin을 get으로 mapping시 에러페이지를 보여주게
	@GetMapping("/executeLogin")
	public String executeLogin() {
		return "error/error";
	}

	// 로그인 기능하기
	@RequestMapping(value = "/executeLogin", method = RequestMethod.POST)
	@ResponseBody
	public void executeLogin(String email, String pwd, HttpSession session, HttpServletRequest request, HttpServletResponse response, RedirectAttributes rttr,
			Model model) throws IOException {
		JSONObject jso= new JSONObject();
		log.info("login email: " + email);
		log.info("login pwd: " + pwd);
		String user_check= request.getParameter("remember_email");
		log.info("remember_email: "+ user_check);
		int result= service.executeLogin(email, pwd, user_check, response, session);
		jso.put("msg", result);
		PrintWriter out = response.getWriter();
		out.print(jso);

	}

	// 로그아웃을 하는 기능(=세션에서 user를 제거하는 기능)
	@GetMapping("/logout")
	public ModelAndView logout(SessionStatus status, HttpServletRequest request) {
		log.info("session 시작: " + status);
		// session을 모두 없애줘
		status.setComplete();
		ModelAndView mv = new ModelAndView();

		// 이제 로그아웃했을 때 그 로그아웃을 불러온 jsp로 그대로 남아있게 만들어야해(7/13)
		StringBuffer contextPath = request.getRequestURL();
		log.info("ContextPath: " + contextPath);

		// 없애기가 성공 되었으면 성공했다는 로그를 찍어줘
		if (status.isComplete() == true) {
			log.info("Session removed successfully");
		}
		// 그리고 acm/list 페이지로 가줘
		// 하지만 다른 페이지의 헤더에서 로그아웃을 한 경우에 돌아가는 뷰는 해당 뷰여야함...(수정해야해!!)
		mv.setViewName("/acm/list");
		return mv;
	}

}
