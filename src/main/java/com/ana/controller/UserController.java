package com.ana.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ana.service.EmailService;
import com.ana.service.UserService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
//@SessionAttributes("user")
public class UserController {

	@Autowired
	private UserService service;

	@GetMapping
	public String showMyAccountPage() {
		return "/account/myAccount";
	}
	//account/myAccount/findPwd 를 보여주는 메서드
	@GetMapping("/account/myAccount/findPwd")
	public String showFindPasswordPage() {
		return "/account/myAccount/findPwd";
	}
	
	@RequestMapping(value="/account/myAccount/accountRecovery", method=RequestMethod.POST)
	public void sendEmailToFindPwd(String email) {
		log.info("email in UserController: "+ email);
		
		
		
	}
}
