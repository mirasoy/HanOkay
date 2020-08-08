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
@RequestMapping("/hosting/stats/*")
public class HostStatsController {

	
	@Autowired
	private HostStatsService sService;

	private UserVO user;
	

	
	@GetMapping("/statsChart")
	public void statsChart(Model model,HttpSession session) {
		user = (UserVO) session.getAttribute("user");
		if (user != null) {
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        Calendar c1 = Calendar.getInstance();
	        String strToday = sdf.format(c1.getTime());
	        c1.add(Calendar.MONTH , -1);
	        String beforeMonth = new java.text.SimpleDateFormat("yyyy-MM-dd").format(c1.getTime());
	        
	        List<PaymentVO> beforeMonthList = sService.getPeriodAllSales(user.getUserNum(), beforeMonth,strToday);
	        
	        int beforeMonthSum = 0;
	        for(PaymentVO vo :beforeMonthList) {
	        	beforeMonthSum += Integer.parseInt(vo.getTotal()); 
	        }
	        Double star = 0.0;
	        List<AcmVO> rankList =sService.getAcmRank(user.getUserNum(),"sumt");
	        for(AcmVO vo :  rankList) {
	        	star+=vo.getStarPoint();
	        }
	        
	        star = star/rankList.size();
	        
	        
		model.addAttribute("beforeMonthSum",beforeMonthSum);
		model.addAttribute("beforeMonthCount",beforeMonthList.size());
		model.addAttribute("star",star);
		model.addAttribute("count",sService.getAllSales(user.getUserNum()).size());
		model.addAttribute("list",rankList);
		}
		
		model.addAttribute("userFstname", user.getUserFstName());
	}
	@GetMapping("/stats")
	public void modipendingAcmGet(Model model,HttpSession session) {
		
		user = (UserVO) session.getAttribute("user");
		if (user != null) {
			//유저의 숙소목록 전달하기
			log.info("..."+user.getBizRegisterNumber());
			log.info("..."+sService.getAcmSales(user.getBizRegisterNumber()).size());
			
			model.addAttribute("acmList",sService.getAllAcm(user.getBizRegisterNumber()));
			model.addAttribute("salesList",sService.getAllSales(user.getUserNum()));
		}
		
		model.addAttribute("userFstname", user.getUserFstName());
	}
	
	
	@PostMapping(value = "/chage1")
	@ResponseBody
	public ResponseEntity<List<PaymentVO>> salesList(StatsSearchVO opt, ModelAndView mv, HttpSession session) {
		
		
		List<PaymentVO> list = new ArrayList<PaymentVO>();
		user = (UserVO) session.getAttribute("user");
		if (user != null) {
			if(opt.getAcmNum().equals("all") && opt.getEnd().equals("")) {
				log.info("case1");
				list = sService.getAllSales(user.getUserNum());
			}else if (!(opt.getAcmNum().equals("all")) && opt.getEnd().equals("")){
				log.info("case2");
				list = sService.getAcmSales(opt.getAcmNum());
			}else if(opt.getAcmNum().equals("all") && !(opt.getEnd().equals(""))) {
				log.info("case3");
				list = sService.getPeriodAllSales(user.getUserNum(), opt.getStart(), opt.getEnd());
			}else if (!(opt.getAcmNum().equals("all"))&& !(opt.getEnd().equals(""))) {
				log.info("case4");
				list = sService.getPeriodAcmSales(opt.getAcmNum(), opt.getStart(), opt.getEnd());
			}
			
			ResponseEntity<List<PaymentVO>> result = new ResponseEntity<List<PaymentVO>>(list,HttpStatus.OK);
			return result;
		}
		return null;
	}
	
	@GetMapping("/statsRank")
	public void statsRank(Model model,HttpSession session) {
		model.addAttribute("userFstname", user.getUserFstName());
	}
	
	
	@PostMapping(value = "/change2")
	@ResponseBody
	public ResponseEntity<List<AcmVO>> salesRank(String criteria, HttpSession session) {
		System.out.println(">>>>>>>>>>>>>>>>>>"+criteria);
		List<AcmVO> list = new ArrayList<AcmVO>();
		user = (UserVO) session.getAttribute("user");
		
		if (user != null) {
				
				list = sService.getAcmRank(user.getUserNum(),criteria);
				
				ResponseEntity<List<AcmVO>> result = new ResponseEntity<List<AcmVO>>(list,HttpStatus.OK);
				return result;
			}
			return null;
	}
	
}