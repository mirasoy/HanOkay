package com.ana.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ana.domain.UserVO;
import com.ana.domain.WishListVO;
import com.ana.service.WishListService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/wishlist/*")
@AllArgsConstructor
public class WishListController {

	private WishListService service;
	
	//세션에서 유저 이름을 가져오는 메서드
	public String getUsername(HttpSession session) {
		UserVO user=(UserVO)session.getAttribute("user");
		String userFstname="";
		if(user!=null) {
			userFstname= user.getUserFstName();
		}
		return userFstname;
		
	}
	
	//조회
	@GetMapping("/list")
	public void list(Model model, HttpSession session) {
		
		String loginUserNum = (String) session.getAttribute("loginUserNum");
		UserVO user= (UserVO)session.getAttribute("user"); 
		String userLastname="";
		String userFstname="";
		String userPwd="";
		String userNum="";
		
		//user에서 가져온 userVO인스턴스의 정보 주소를 iv에 저장한다.
		if(user != null){
		userLastname= user.getUserLastName();
		userFstname=user.getUserFstName();
		userPwd= user.getUserPwd();
		userNum= user.getUserNum();
		} 
		
		log.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■list");
		model.addAttribute("list", service.getWishList(userNum));
	}
	
	
	
	//등록
	@PostMapping("/wishList")
	public String register(WishListVO board, RedirectAttributes rttr) {
		log.info("register: " + board);
		service.register(board);
		rttr.addFlashAttribute("result", board.getWishNum());

		return "redirect:/wishlist/list";
	}
	
//	// @GetMapping("/get")
//	public void get(@RequestParam("acmNum") String acmNum, Model model) {
//		log.info("/get");
//		model.addAttribute("acm", service.get(acmNum));
//	}
//	
//	//수정
//	@PostMapping("/modify")
//	public String modify(AcmVO acm, RedirectAttributes rttr) {
//		log.info("modify:" + acm);
//
//		if (service.modify(acm)) {
//			rttr.addFlashAttribute("result", "success");
//		}
//
//		return "redirect:/acm/list";
//	}
//	
//	//삭제
//	@PostMapping("/remove")
//	public String remove(@RequestParam("acmNum") String acmNum, RedirectAttributes rttr) {
//		log.info("remove..." + acmNum);
//		if (service.remove(acmNum)) {
//			rttr.addFlashAttribute("result", "success");
//		}
//		return "redirect:/acm/list";
//	}
//
//	@GetMapping("/register")
//	public void register() {
//
//	}
//	
//	//date형식 유효성검사
//	public boolean validationDate(String checkDate) {
//		try {
//			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//
//			dateFormat.setLenient(false);
//			dateFormat.parse(checkDate);
//			return true;
//
//		} catch (ParseException e) {
//			return false;
//		}
//	}
//	
//	//체크인,아웃 유효성 검사
//	public boolean checkDate(Criteria cri) throws ParseException {
//		// 1. 날짜 형식 맞는지 확인
//		if (!(cri.getIn() == null || cri.getIn().equals("")) && !(cri.getOut() == null || cri.getOut().equals(""))) {
//			if (!validationDate(cri.getIn()) || !validationDate(cri.getOut())) {
//				return false;
//			}
//			// 2. 체크아웃 날짜가 체크인 보다 이른 날짜인지 확인
//			int cin = Integer.parseInt(cri.getIn().replace("-", ""));
//			int cout = Integer.parseInt(cri.getOut().replace("-", ""));
//			if (cin >= cout) {
//				return false;
//			}
//		}
//
//		Calendar cal = Calendar.getInstance();
//		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
//		Date date = null;
//		String in = "", out = "";
//		// 1. 체크인x 체크아웃 x 오늘내일
//		if ((cri.getIn() == null || cri.getIn().equals("")) && (cri.getOut() == null || cri.getOut().equals(""))) {
//
//			in = df.format(cal.getTime());
//			cal.add(Calendar.DATE, 1);
//			out = df.format(cal.getTime());
//			cri.setIn(in);
//			cri.setOut(out);
//			// 2. 체크인 x 체크아웃 o 체크인=체크아웃-1
//		} else if ((cri.getIn() == null || cri.getIn().equals(""))
//				&& !(cri.getOut() == null || cri.getOut().equals(""))) {
//			date = df.parse(cri.getOut());
//			cal.setTime(date);
//
//			out = df.format(cal.getTime());
//			cal.add(Calendar.DATE, -1);
//			in = df.format(cal.getTime());
//
//			cri.setIn(in);
//			cri.setOut(out);
//			// 3. 체크인 o 체크아웃 x 체크아웃=체크인+1
//		} else if (!(cri.getIn() == null || cri.getIn().equals(""))
//				&& (cri.getOut() == null || cri.getOut().equals(""))) {
//			date = df.parse(cri.getIn());
//			cal.setTime(date);
//
//			in = df.format(cal.getTime());
//			cal.add(Calendar.DATE, 1);
//			out = df.format(cal.getTime());
//
//			cri.setIn(in);
//			cri.setOut(out);
//		}
//		return true;
//	}
}
