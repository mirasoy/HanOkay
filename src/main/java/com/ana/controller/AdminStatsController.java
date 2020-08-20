package com.ana.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ana.domain.AcmVO;
import com.ana.domain.PaymentVO;
import com.ana.domain.StatsSearchVO;
import com.ana.domain.UserVO;
import com.ana.service.AdminStatsService;
import com.ana.service.HostStatsService;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/admin/stats/*")
public class AdminStatsController {

	
	@Autowired
	private HostStatsService sService;
	@Autowired
	private AdminStatsService adservice;

	private UserVO user;
	

	
	@GetMapping("/statsChart")
	public void statsChart(Model model,HttpSession session) {
		user = (UserVO) session.getAttribute("user");
		if (user != null) {
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        Calendar taday = Calendar.getInstance();
	   
	        String strToday = sdf.format(taday.getTime());
	       
	        
	        Calendar beforeM = Calendar.getInstance();
	        beforeM.add(Calendar.MONTH , -1);
	        String beforeMonth = new java.text.SimpleDateFormat("yyyy-MM-dd").format(beforeM.getTime());

	        Calendar tomorrowC = Calendar.getInstance();
	        tomorrowC.add(Calendar.DATE , +1);
	        String tomorrow = new java.text.SimpleDateFormat("yyyy-MM-dd").format(tomorrowC.getTime());
	        
	        //지난한달매출
	        List<PaymentVO> beforeMonthList = adservice.getPeriodAllSalesAd(beforeMonth,strToday);
	        //지난한달매출 다더하기
	        int beforeMonthSum = 0;
	        for(PaymentVO vo :beforeMonthList) {
	        	//System.out.println(vo);
	        	beforeMonthSum += Integer.parseInt(vo.getTotal()); 
	        }
	        
	        
	        
	        //오늘 매출
	        List<PaymentVO> todaylist = adservice.getPeriodAllSalesAd(strToday, tomorrow);
	        
	        int todaysum = 0;
	        for(PaymentVO vo :todaylist) {
	        	//System.out.println(vo);
	        	todaysum += Integer.parseInt(vo.getTotal()); 
	        }
//
	        List<AcmVO> rankList =adservice.getAcmRankAd("sumt");
	 
		model.addAttribute("beforeMonthSum",beforeMonthSum);
		model.addAttribute("beforeMonthCount",beforeMonthList.size());
		model.addAttribute("todaysum",todaysum);
		model.addAttribute("count",adservice.getAllSalesAd().size());
		model.addAttribute("list",rankList);
		}
		
	    
		
		model.addAttribute("userFstname", user.getUserFstName());
	}
	
	
	@GetMapping("/stats")
	public void statsGet(Model model,HttpSession session) {
		
		user = (UserVO) session.getAttribute("user");
		if (user != null) {
			//유저의 숙소목록 전달하기
			
			model.addAttribute("acmList",adservice.getAllAcmAd());
			model.addAttribute("salesList",adservice.getAllSalesAd());
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
		System.out.println("statsRankAdmin");
		model.addAttribute("userFstname", user.getUserFstName());
	}
	
	
	@PostMapping(value = "/change2")
	@ResponseBody
	public ResponseEntity<List<AcmVO>> salesRank(String criteria, HttpSession session) {
		System.out.println(">>>>>>>>>>>>>>>>>>"+criteria);
		List<AcmVO> list = new ArrayList<AcmVO>();
		user = (UserVO) session.getAttribute("user");
		
		if (user != null) {
				
				list = adservice.getAcmRankAd(criteria);
				
				ResponseEntity<List<AcmVO>> result = new ResponseEntity<List<AcmVO>>(list,HttpStatus.OK);
				return result;
			}
			return null;
	}
	
}