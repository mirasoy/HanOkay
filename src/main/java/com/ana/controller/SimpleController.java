package com.ana.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class SimpleController {
	
	@RequestMapping("/policies/terms")
	public String showTerms() {
		return "/policies/terms";
	}

}
