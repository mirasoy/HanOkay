package com.ana.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/error/*")
@AllArgsConstructor
public class ErrorController {

	@GetMapping("/error")
	public String showErrorPage() {
		return "error/error";
	}
}
