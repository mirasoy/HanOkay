package com.ana.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ana.domain.AcmVO;
import com.ana.domain.Criteria;
import com.ana.domain.PageDTO;
import com.ana.service.AcmService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/acm/*")
@AllArgsConstructor
public class AcmController {
	
	private AcmService service;
	
	@GetMapping({"/list","/result"})
	public void list(Criteria cri, String acmNum, Model model) {
		log.info("list: "+cri);
		
//		cri.setKeyword("대구광역시");
//		cri.setPerson("8");
		if(!(cri.getIn()==null||cri.getIn().equals("")) && !(cri.getOut()==null||cri.getOut().equals(""))) {
			int cin = Integer.parseInt(cri.getIn().replace("-", ""));
			int cout = Integer.parseInt(cri.getOut().replace("-", ""));
				if(cin>=cout) {
					return;
				}
		}
		
		try {
			Calendar cal = Calendar.getInstance();
			SimpleDateFormat df = new SimpleDateFormat ("yyyy-MM-dd");
			Date date =null;
			String in="", out="";
			//1. 체크인x 체크아웃 x 오늘내일
			if( (cri.getIn()==null||cri.getIn().equals("")) && (cri.getOut()==null||cri.getOut().equals("")) ) {
						
				in = df.format(cal.getTime());
				cal.add(Calendar.DATE, 1);
				out = df.format(cal.getTime());
				cri.setIn(in);
				cri.setOut(out);
				//2. 체크인 x 체크아웃 o 체크인=체크아웃-1
			}else if( (cri.getIn()==null||cri.getIn().equals("")) && !(cri.getOut()==null||cri.getOut().equals("")) ) {
				date = df.parse(cri.getOut());
				cal.setTime(date);
				
				out = df.format(cal.getTime());
				cal.add(Calendar.DATE, -1);
				in = df.format(cal.getTime());
				
				cri.setIn(in);
				cri.setOut(out);
				//3. 체크인 o 체크아웃 x 체크아웃=체크인+1
			}else if( !(cri.getIn()==null||cri.getIn().equals("")) && (cri.getOut()==null||cri.getOut().equals("")) ) {
				date = df.parse(cri.getIn());
				cal.setTime(date);
				
				in = df.format(cal.getTime());
				cal.add(Calendar.DATE, 1);
				out = df.format(cal.getTime());
				
				cri.setIn(in);
				cri.setOut(out);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		log.info("list: "+cri);
			
		//session.setAttribute("location", cri.getKeyword());
		//model.addAttribute("cri",cri);
		model.addAttribute("list",service.getList(cri));
		//model.addAttribute("pageMaker", new PageDTO(cri, 123));
		int total = service.getTotal(cri);
		log.info("total: " + total);
		model.addAttribute("acmNum",acmNum);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@PostMapping("/register")
	public String register(AcmVO acm, RedirectAttributes rttr) {
		log.info("register: " + acm);
		service.register(acm);
		rttr.addFlashAttribute("result", acm.getAcmNum());
		
		return "redirect:/acm/list";
	}
	
	//@GetMapping("/get")
	public void get(@RequestParam("acmNum") String acmNum, Model model) {
		log.info("/get");
		model.addAttribute("acm", service.get(acmNum));
	}
	
	@PostMapping("/modify")
	public String modify(AcmVO acm, RedirectAttributes rttr) {
		log.info("modify:" + acm);
		
		if(service.modify(acm)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/acm/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("acmNum") String acmNum, RedirectAttributes rttr) {
		log.info("remove..."+acmNum);
		if(service.remove(acmNum)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/acm/list";
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
}
