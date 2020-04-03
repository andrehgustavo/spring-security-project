package br.imd.ufrn.springsecuritycustom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DemoController {
	
	@GetMapping("/")
	public String showLanding() {

		return "landing";
	}

	@GetMapping("/employees")
	public String showHome() {

		return "home";
	}
	// add request mapping for /engineers

	@GetMapping("/engineers")
	public String showEngineers() {

		return "engineers";
	}
	
}
