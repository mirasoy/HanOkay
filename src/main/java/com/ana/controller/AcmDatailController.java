package com.ana.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ana.service.AcmService;
import com.ana.service.RevPostService;
import com.ana.service.RomService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/acm/*")
@AllArgsConstructor
public class AcmDatailController {
// 숙소 상세페이지
	
	private AcmService acmService;
	private RevPostService revService;
	private RomService romService;
	
	
	@RequestMapping(value = "get", method = RequestMethod.GET)
	public void accomodation(@RequestParam("acmNum") String acmNum, 
			@RequestParam("in") String checkin,
			@RequestParam("out") String checkout,
			@RequestParam("person") String person,
			Model model) {
		log.info("accommodation");
		
		if(!person.isEmpty()) { // 검색 페이지에서 인원수를 선택한 경우
			model.addAttribute("acm", acmService.get(acmNum)) // 숙소 정보 + 사진
			.addAttribute("rev", revService.getAcmList(acmNum)) // 리뷰 목록
			.addAttribute("rom", romService.getList(acmNum, person)) // 방 목록
			.addAttribute("srh", getDate(checkin, checkout)); 
		}else {
			model.addAttribute("acm", acmService.get(acmNum))
			.addAttribute("rev", revService.getAcmList(acmNum))
			.addAttribute("rom", romService.getAll(acmNum)) // 방 전체 목록
			.addAttribute("srh", getDate(checkin, checkout));
		}
	}
	
	// 경우의 수에 따른 체크인, 체크아웃 날짜 설정
	public String[] getDate(String checkin, String checkout) {
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Calendar cal = Calendar.getInstance();
		Calendar inCal = Calendar.getInstance();
		Calendar outCal = Calendar.getInstance();
		
		//1. 체크인 체크아웃 값이 정상적으로 넘어왔으나 유효하지 않은 경우
		if(checkin != "" && checkout != "") {
			String[] tmpArr1 = checkin.split("-");
			inCal.set(Integer.parseInt(tmpArr1[0]), Integer.parseInt(tmpArr1[1])-1 , Integer.parseInt(tmpArr1[2]));
			String[] tmpArr2 = checkout.split("-");
			outCal.set(Integer.parseInt(tmpArr2[0]), Integer.parseInt(tmpArr2[1])-1 , Integer.parseInt(tmpArr2[2]));
			//1-1. 체크아웃이 체크인보다 이전인 경우 == 체크인이 체크아웃보다 이후인 경우
			//1-2. 체크인이 오늘보다 이전인 경우
			if( outCal.compareTo(inCal)!=1 || inCal.compareTo(cal)!=1 ) { // 정상일 때 1
				checkin = sdf.format(new Date(inCal.getTimeInMillis()));
				checkout = sdf.format(new Date(outCal.getTimeInMillis()));
			}
			
		//2. 체크인 값이 없을 경우
		}else if(checkin == "" && checkout != "") {
			String[] tmpArr = checkout.split("-");
			inCal.set(Integer.parseInt(tmpArr[0]), Integer.parseInt(tmpArr[1])-1 , Integer.parseInt(tmpArr[2]));
			inCal.add(Calendar.DATE, -1);
			checkin = sdf.format(new Date(inCal.getTimeInMillis()));
		
		//3. 체크아웃 값이 없을 경우
		}else if(checkin != "" && checkout == "") {
			String[] tmpArr = checkin.split("-");
			outCal.set(Integer.parseInt(tmpArr[0]), Integer.parseInt(tmpArr[1])-1 , Integer.parseInt(tmpArr[2]));
			outCal.add(Calendar.DATE, 1);
			checkout = sdf.format(new Date(outCal.getTimeInMillis()));
		
		//4. 체크인 체크아웃 값이 없을 경우
		}else {
			checkin = sdf.format(today);
			outCal.setTime(today);
			outCal.add(Calendar.DATE, 1);
			checkout = sdf.format(new Date(outCal.getTimeInMillis()));
		}
		
		String[] result = {checkin, checkout} ;
		return result;
	}

}
