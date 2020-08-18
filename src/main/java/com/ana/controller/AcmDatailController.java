package com.ana.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ana.domain.AcmVO;
import com.ana.domain.Criteria;
import com.ana.domain.UserVO;
import com.ana.domain.WishListVO;
import com.ana.service.AcmDetailService;
import com.ana.service.AcmService;
import com.ana.service.CodeService;
import com.ana.service.UserService;
import com.ana.service.WishListService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/acm/*")
@AllArgsConstructor
public class AcmDatailController { // 숙소 상세페이지
	
	private AcmDetailService service;
	private AcmService acmService;
	private CodeService codeService;
	private UserService userService;
	private WishListService wishservice;
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public void getDetailInfo(@RequestParam("acmNum") String acmNum, 
			@RequestParam("in") String checkin,
			@RequestParam("out") String checkout,
			@RequestParam("person") String person,
			Model model, HttpSession session) {
		log.info("■■■■■■■■■■■■■■■■■■■■■■■■ 상세페이지로 이동 중...");
		
		if(person.isEmpty()) person = "1"; // 인원수가 없는 경우
		
		model.addAttribute("acm", service.getAcm(acmNum))
		.addAttribute("pic", service.getPicList(acmNum))
		.addAttribute("rev", service.getRevList(acmNum))
		.addAttribute("star", service.getStisf(acmNum))
		.addAttribute("acmCode", codeService.getAcmCode())
		.addAttribute("romCode", codeService.getRomCode())
		.addAttribute("acmOwnerNum", userService.getAcmOwner(acmService.get(acmNum).getBizRegnum()).getUserNum());
		String[] tmp = getDate(checkin , checkout);
		
		model.addAttribute("rom", service.getRomList(checkin,checkout,acmNum, person));
		
		model.addAttribute("in", tmp[0])
		.addAttribute("out", tmp[1]);
		/*
		 * try { model.addAttribute("drawValue", add(acmNum, session)); } catch
		 * (Exception e) { System.out.println("오류가 발생했습니다 : "+e.getMessage());
		 * log.info("error@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"); return; }
		 */
	}
	
	// 경우의 수에 따른 체크인, 체크아웃 날짜 설정하기
	public String[] getDate(String checkin, String checkout) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		
		//1. 체크인 체크아웃 값이 있는 경우
		if(!checkin.equals("") && !checkout.equals("")) {
			checkin = sdf.format(set(checkin).getTime());
			checkout = sdf.format(set(checkout).getTime());
			
			//1-1. 날짜가 유효하지 않은 경우: 체크아웃이 체크인보다 이전인 경우, 체크인이 오늘보다 이전인 경우
			if( set(checkout).compareTo(set(checkin))!=1 || set(checkin).compareTo(cal)!=1 )  // 정상일 때 1
				return setDefault();
			
		//2. 체크인 값이 없을 경우
		}else if(checkin.equals("") && !checkout.equals("")) {
			cal = set(checkout);
			checkout = sdf.format(cal.getTime());
			cal.add(Calendar.DATE, -1);
			checkin = sdf.format(cal.getTime());
		
		//3. 체크아웃 값이 없을 경우
		}else if(!checkin.equals("") && checkout.equals("")) {
			cal = set(checkin);
			checkin = sdf.format(cal.getTime());
			cal.add(Calendar.DATE, 1);
			checkout = sdf.format(cal.getTime());
		
		//4. 체크인 체크아웃 값이 없을 경우
		}else {
			return setDefault();
		}
		
		String[] result = {checkin, checkout} ;
		return result;
		
	}
	
	// 날짜 패턴 맞추기
	public Calendar set(String date) {
		Calendar cal = Calendar.getInstance();
		cal.clear();
		String[] tmp = date.split("-");
		cal.set(Integer.parseInt(tmp[0]), Integer.parseInt(tmp[1])-1, Integer.parseInt(tmp[2]));
		return cal;
	}
	
	// 날짜 기본값 설정하기
	public String[] setDefault(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal1 = Calendar.getInstance();
		Calendar cal2 = Calendar.getInstance();
		cal2.add(Calendar.DATE, 1);
		String[] rst = {sdf.format(cal1.getTime()), sdf.format(cal2.getTime())};
		return rst;
	}
	
	// 찜 버튼
	public String add(String acmNum, HttpSession session){
		
		UserVO user= (UserVO)session.getAttribute("user"); 		
		String userNum="";
		
		if(user != null){
			userNum = user.getUserNum();
		} 				
		
		WishListVO wish = new WishListVO();
		wish.setAcmNum(acmNum);
		wish.setUserNum(userNum);
		
		wishservice.register(wish);		
		if(wishservice.register(wish) == 0) {			
			return "fa fa-heart-o fa-2x openheart";	
		}else {			
			return "fa fa-heart fa-2x clsheart";	
		}			
	}
}
