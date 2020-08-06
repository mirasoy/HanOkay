package com.ana.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ana.domain.AcmVO;
import com.ana.domain.Criteria;
import com.ana.domain.PageDTO;
import com.ana.domain.UserVO;
import com.ana.service.AcmService;
import com.ana.service.CodeService;
import com.ana.service.WishListService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/acm/*")
@AllArgsConstructor
public class AcmController {

	private AcmService service;
	private WishListService wishservice;
	
	
	
	
	
	
	private CodeService codeService;
	
	//검색 결과 
//	@GetMapping({ "/list", "/result" })
//	public void list(Criteria cri, String acmNum, Model model, HttpSession session) {	
//		log.info("list: " + cri);
//
//		try {
//			// 날짜 유효성 검사
//			if (!checkDate(cri)) {
//				return;
//			}
//			
//			model.addAttribute("list", service.getList(cri));
//			int total = service.getTotal(cri);
//			log.info("total: " + total);
//			model.addAttribute("acmNum", acmNum);
//			model.addAttribute("pageMaker", new PageDTO(cri, total));
//		} catch (Exception e) {
//			return;
//		}
//	}
	
	@GetMapping({ "/list", "/result" })
	public void list(Criteria cri, String acmNum, Model model , HttpSession session) {

		try {
			// 날짜 유효성 검사
			if (!checkDate(cri)) {
				return;
			}
			
			//지역 문자열핸들링&타입셋팅
			chkLocation(cri);
			
			model.addAttribute("acmCode", codeService.getAcmCode());
			log.info("cri:" + cri);
			model.addAttribute("list", service.getList(cri));

			log.info("여기1");
			int total = service.getTotal(cri);
			log.info("total: " + total);
			model.addAttribute("acmNum", acmNum);
			model.addAttribute("pageMaker", new PageDTO(cri, total));
			model.addAttribute("drawValue", drawValue(service.getList(cri), session));
			
			log.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■total: " + total);
			
			log.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■total: " + drawValue(service.getList(cri), session).size());
			
		} catch (Exception e) {
			System.out.println("오류가 발생했습니다 : "+e.getMessage());
			log.info("error@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			return;
		}
	}
	

	@RequestMapping(value = "/filter", method = RequestMethod.POST)
	@ResponseBody
	public void chkFilter(Criteria cri, String totSum, HttpServletRequest request, HttpServletResponse response)
			throws IOException{	
		JSONObject jso= new JSONObject();
		log.info("cri check: " +  cri);
		//한글 깨짐 방지
		response.setContentType("text/plain;charset=UTF-8");
		String msg2="";
		
		chkLocation(cri);
		log.info("cri check: " +  cri);
		//service에게 totSum을 주고 db를 뒤져오게한다
		int total = service.getTotal(cri);
		log.info("ajax total: "+total);
		jso.put("total", total);
		PrintWriter out = response.getWriter();
		out.print(jso);
	}

	
	

	
	
	
	public List<String> drawValue(List<AcmVO> list, HttpSession session){
	
	List<String> result = new ArrayList<String>() ;	
	for(AcmVO acmlist : list) {
		acmlist.getAcmNum();				
		
		UserVO user= (UserVO)session.getAttribute("user"); 		
		String userNum="";
		
		if(user != null){
			userNum = user.getUserNum();
		} 				
		
		log.info("■■>>>>>>>>>>>>>>>>>sizze>>>>"+wishservice.drawValue(userNum, acmlist.getAcmNum()).size());
		log.info("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ acm NUM  은?■■■■■■■■■■■■■■■■"+ acmlist.getAcmNum());
		
		wishservice.drawValue(userNum, acmlist.getAcmNum());		
		if(wishservice.drawValue(userNum, acmlist.getAcmNum()).size()==0) {			
			result.add("fa fa-heart-o fa-2x openheart");	
			log.info(1);
		}else {			
			result.add("fa fa-heart fa-2x clsheart");	
			log.info(2);
		}			
	}
	log.info("■■■■■■■■■■■■■■■■■■■■■result.size() == ?? "+result.size());
	log.info("■■■■■■■■■■■■■■■■■■■■■result == ?? "+result);
	return result;	
}
	
	
	

	
	//등록
	@PostMapping("/register")
	public String register(AcmVO acm, RedirectAttributes rttr) {
		log.info("register: " + acm);
		service.register(acm);
		rttr.addFlashAttribute("result", acm.getAcmNum());

		return "redirect:/acm/list";
	}
	
	// @GetMapping("/get")
	public void get(@RequestParam("acmNum") String acmNum, Model model) {
		log.info("/get");
		model.addAttribute("acm", service.get(acmNum));
	}
	
	//수정
	@PostMapping("/modify")
	public String modify(AcmVO acm, RedirectAttributes rttr) {
		log.info("modify:" + acm);

		if (service.modify(acm)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/acm/list";
	}
	
	//삭제
	@PostMapping("/remove")
	public String remove(@RequestParam("acmNum") String acmNum, RedirectAttributes rttr) {
		log.info("remove..." + acmNum);
		if (service.remove(acmNum)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/acm/list";
	}

	@GetMapping("/register")
	public void register() {

	}
	
	//지역 문자열 핸들링&타입 선택
	public void chkLocation(Criteria cri) {
		String keyword = StringUtils.replaceEach(cri.getKeyword(), new String[] {"특별시","광역시","충청남도","충청북도","전라북도","전라남도","경상북도","경상남도","강원도","경기도","제주도"}, 
				  new String[] {"","","충남","충북","전북","전남","경북","경남","강원","경기","제주"});
		cri.setKeyword(keyword);
		String[] location = keyword.split(" ");
		
//		for(int i=0;i<location.length;i++) {
//		log.info("location"+i+": " + location[i]);
//		}
		if(location.length<=1) { //서울 or 종로 or 대치
			cri.setType("A");
		}else if(location.length==2) { //대한민국 서울
			cri.setType("T");
			cri.setCity(location[1]);
		}else if(location.length==3) { //대한민국 서울 종로구
			cri.setType("TC");
			cri.setCity(location[1]);
			cri.setDistr(location[2]);
		}else {//대한민국 서울 종로구 종로3가 or 그이상
			cri.setType("TCW");
			cri.setCity(location[1]);
			cri.setDistr(location[2]);
			cri.setDetail(location[3]);
		};
		//옵션체크했을경우 타입에 F붙임
		if(!cri.getAcmOpt().equals("0")) {
			cri.setType(cri.getType().concat("F"));
		}
	}
	
	//date형식 유효성검사
	public boolean validationDate(String checkDate) {
		try {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

			dateFormat.setLenient(false);
			dateFormat.parse(checkDate);
			return true;

		} catch (ParseException e) {
			return false;
		}
	}
	
	//체크인,아웃 유효성 검사
	public boolean checkDate(Criteria cri) throws ParseException {
		// 1. 날짜 형식 맞는지 확인
		if (!(cri.getIn() == null || cri.getIn().equals("")) && !(cri.getOut() == null || cri.getOut().equals(""))) {
			if (!validationDate(cri.getIn()) || !validationDate(cri.getOut())) {
				return false;
			}
			// 2. 체크아웃 날짜가 체크인 보다 이른 날짜인지 확인
			int cin = Integer.parseInt(cri.getIn().replace("-", ""));
			int cout = Integer.parseInt(cri.getOut().replace("-", ""));
			if (cin >= cout) {
				return false;
			}
		}

		Calendar cal = Calendar.getInstance();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		String in = "", out = "";
		// 1. 체크인x 체크아웃 x 오늘내일
		if ((cri.getIn() == null || cri.getIn().equals("")) && (cri.getOut() == null || cri.getOut().equals(""))) {

			in = df.format(cal.getTime());
			cal.add(Calendar.DATE, 1);
			out = df.format(cal.getTime());
			cri.setIn(in);
			cri.setOut(out);
			// 2. 체크인 x 체크아웃 o 체크인=체크아웃-1
		} else if ((cri.getIn() == null || cri.getIn().equals(""))
				&& !(cri.getOut() == null || cri.getOut().equals(""))) {
			date = df.parse(cri.getOut());
			cal.setTime(date);

			out = df.format(cal.getTime());
			cal.add(Calendar.DATE, -1);
			in = df.format(cal.getTime());

			cri.setIn(in);
			cri.setOut(out);
			// 3. 체크인 o 체크아웃 x 체크아웃=체크인+1
		} else if (!(cri.getIn() == null || cri.getIn().equals(""))
				&& (cri.getOut() == null || cri.getOut().equals(""))) {
			date = df.parse(cri.getIn());
			cal.setTime(date);

			in = df.format(cal.getTime());
			cal.add(Calendar.DATE, 1);
			out = df.format(cal.getTime());

			cri.setIn(in);
			cri.setOut(out);
		}
		return true;
	}
}
