package com.ana.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ana.domain.AcmVO;
import com.ana.domain.MsgVO;
import com.ana.domain.PaymentVO;
import com.ana.domain.RomVO;
import com.ana.domain.StatsSearchVO;
import com.ana.domain.UserVO;
import com.ana.service.AcmDetailService;
import com.ana.service.AcmRegService;
import com.ana.service.CodeService;
import com.ana.service.HostStatsService;
import com.ana.service.RomRegService;
import com.ana.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/admin/stats/*")
public class AdminStatsController {

	
	@Autowired
	private HostStatsService sService;

	//세션에서 유저이름 가져오는 메서드
	public UserVO getUser(HttpSession session) {
		UserVO user=(UserVO)session.getAttribute("user");
		if(user==null)return null;
		return user;
	}
		
	///////////////////////
	
	
	@GetMapping("/mapChart")
	public void mapChart(Model model,HttpSession session) {
		System.out.println("mapChart get");
		
		
		
		
		model.addAttribute("adminFstname", getUser(session).getUserFstName());
	
	}
	
	
	@PostMapping("/mapChart")
	public void statsChart(Model model,HttpSession session) {
		System.out.println("mapChart Post");
		
		
		
		
		model.addAttribute("adminFstname", getUser(session).getUserFstName());
	
	}
	
	
	@PostMapping(value = "/change2")
	@ResponseBody
	public ResponseEntity<List<AcmVO>> salesRank(String criteria, HttpSession session) {
		System.out.println(">>>>>>>>>>>>>>>>>>"+criteria);
		List<AcmVO> list = new ArrayList<AcmVO>();

		
		return null;
	}
	
}