package com.ana.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ana.service.AcmOptionService;
import com.ana.service.AcmService;
import com.ana.service.RevPostService;
import com.ana.service.RomService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class AcmDatailController {

	private AcmService acmService;
	private RevPostService revService;
	private AcmOptionService optService;
	private RomService romService;
	
	
	@RequestMapping(value = "accommodation", method = RequestMethod.GET)
	public void accomodation(@RequestParam("acmNum") String acmNum, Model model) {
		log.info("accommodation");
		
		model.addAttribute("acm", acmService.get(acmNum))
		.addAttribute("rev", revService.getAcmList(acmNum))
		.addAttribute("opt", optService.getList(acmNum))
		.addAttribute("rom", romService.getList(acmNum));
	}

}


