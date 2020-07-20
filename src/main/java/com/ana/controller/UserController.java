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

	@Autowired
	private EmailService emailService;

	@GetMapping("/account/myAccount/findPwd")
	public String showFindPasswordPage() {
		return "/account/myAccount/findPwd";
	}

	// 이메일 보내기
	@RequestMapping(value = "/account/myAccount/accountRecovery", method = RequestMethod.POST)
	@ResponseBody
	public void sendEmail(String email, HttpServletRequest request, HttpServletResponse response) throws IOException {
		JSONObject jso = new JSONObject();
		log.info("send email: " + email);
		// 한글 깨짐 방지
		response.setContentType("text/plain;charset=UTF-8");
		String msg = "";
		// service에게 email을 주고 db를 뒤져오게한다
		if (service.checkEmail(email)) {
			log.info("checkEmail에서 service 성공" );
			emailService.sendAuthEmail(email);
			msg = "해당 이메일을 사용하실 수 있습니다";
			jso.put("msg", msg);
		}  else {
			log.info("checkEmail에서 service를 불렀더니 이미 db에 있는 이메일임!");
			msg = "이미 등록된 이메일입니다!";
			jso.put("msg", msg);
		}
		PrintWriter out = response.getWriter();
		out.print(jso);
	}

}
