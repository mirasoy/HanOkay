package com.ana.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.GeneralSecurityException;
import java.util.Collections;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.ana.service.UserService;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
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
		mv.setViewName("/user/welcome");
		return mv;
	}

	// excuteLogin을 get으로 mapping시 에러페이지를 보여주게
	@GetMapping("/executeLogin")
	public String executeLogin() {
		return "/error/error";
	}

	// 구글 로그인
	private static final HttpTransport transport = new NetHttpTransport();
	private static final JsonFactory jsonFactory = new JacksonFactory();
	private static final String MY_APP_GOOGLE_CLIENT_ID = "942421543250-6pu1jcn9mpo8vda62cop0qnlesr8fh6a.apps.googleusercontent.com";

	@RequestMapping(value = "/login/tokenSignIn", method = RequestMethod.POST)
	public void executeGoogleLogin(@RequestParam MultiValueMap<String, String> body, HttpSession session,
			HttpServletResponse response) throws IOException, GeneralSecurityException {

		System.out.println("id Token: " + body.getFirst("idToken"));
		String idTokenString = body.getFirst("idToken");
		GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(transport, jsonFactory)
				// Specify the CLIENT_ID of the app that accesses the backend:
				.setAudience(Collections.singletonList(MY_APP_GOOGLE_CLIENT_ID))
				// Or, if multiple clients access the backend:
				// .setAudience(Arrays.asList(CLIENT_ID_1, CLIENT_ID_2, CLIENT_ID_3))
				.build();

// (Receive idTokenString by HTTPS POST)
//String idTokenString= request.getParameter("idToken");
		System.out.println("idTokenString: " + idTokenString.toString());
		GoogleIdToken idToken = verifier.verify(idTokenString);
		int result = 0;
		JSONObject jso = new JSONObject();
		if (idToken != null) {
			Payload payload = idToken.getPayload();

			// Print user identifier
			String userId = payload.getSubject();
			System.out.println("User ID: " + userId);

			// Get profile information from payload
			String email = payload.getEmail();
			boolean emailVerified = Boolean.valueOf(payload.getEmailVerified());
			String name = (String) payload.get("name");
			String pictureUrl = (String) payload.get("picture");
			String locale = (String) payload.get("locale");
			String familyName = (String) payload.get("family_name");
			String givenName = (String) payload.get("given_name");

			// Use or store profile information
			// ...
			System.out.println("email:" + email);
			System.out.println("emailVerified :" + emailVerified);
			System.out.println("name:" + name);
			System.out.println("familyName:" + familyName);
			System.out.println("givenName:" + givenName);

			result = service.executeGoogleLogin(email, familyName, givenName, session);

			jso.put("result", result);
			PrintWriter out = response.getWriter();
			out.print(jso);
		}

		else {
			System.out.println("Invalid ID token.");
			jso.put("result", result);
			PrintWriter out = response.getWriter();
			out.print(jso);
		}
		

	}

	// 로그인 기능하기
	@RequestMapping(value = "/executeLogin", method = RequestMethod.POST)
	@ResponseBody
	public void executeLogin(String email, String pwd, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, RedirectAttributes rttr, Model model) throws IOException {
		System.out.println("executeLogin");
		JSONObject jso = new JSONObject();
		log.info("login email: " + email);
		log.info("login pwd: " + pwd);
		String user_check = request.getParameter("remember_email");
		log.info("remember_email checked: " + user_check);

		// 로그인을 실행하는 서비스 메서드 호출
		int result = service.executeLogin(email, pwd, user_check, response, session);
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
