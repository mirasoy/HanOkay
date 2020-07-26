package com.ana.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ana.service.AcmDetailService;
import com.ana.service.CodeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/acm/*")
@AllArgsConstructor
public class AcmDatailController { // 숙소 상세페이지
	
	private AcmDetailService service;
	private CodeService codeService;
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public void getDetailInfo(@RequestParam("acmNum") String acmNum, 
			@RequestParam("in") String checkin,
			@RequestParam("out") String checkout,
			@RequestParam("person") String person,
			Model model) {
		log.info("■■■■■■■■■■■■■■■■■■■■■■■■ 상세페이지로 이동 중...");
		
		if(person.isEmpty()) person = "1"; // 인원수가 없는 경우
		
		model.addAttribute("acm", service.getAcm(acmNum))
		.addAttribute("pic", service.getPicList(acmNum))
		.addAttribute("rev", service.getRevList(acmNum))
		.addAttribute("star", service.getStisf(acmNum))
		.addAttribute("acmCode", codeService.getAcmCode())
		.addAttribute("romCode", codeService.getRomCode());
		
		if(service.getRomList(acmNum, person).isEmpty()) {
			model.addAttribute("rom", service.getRomAll(acmNum));
		}else {
			model.addAttribute("rom", service.getRomList(acmNum, person));
		}
		
		String[] tmp = getDate(checkin , checkout);
		model.addAttribute("in", tmp[0])
		.addAttribute("out", tmp[1]);
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
}
