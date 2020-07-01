package com.ana.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ana.domain.RomVO;
import com.ana.service.AcmOptionService;
import com.ana.service.AcmService;
import com.ana.service.RomService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class AcmDatailInfoController {

	private AcmService acmService;
//	private RevService revService;
	private AcmOptionService optService;
	private RomService romService;
	
	
	@GetMapping("/accomodation")
	public void list(@RequestParam("acmNum") String acmNum, Model model) {
		log.info("accomodation");
		model.addAttribute("acm", acmService.get(acmNum))
		.addAttribute("rev", romService.getList(acmNum))
		.addAttribute("opt", optService.getList(acmNum))
		.addAttribute("rom", romService.getList(acmNum));
	}

}


