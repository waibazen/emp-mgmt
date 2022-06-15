package com.codedecode.demo.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
//@RequestMapping("/")
public class LoginController {
	

	@GetMapping("/")
	public String viewApp(Model model) {// takes in model object and return view
		model.addAttribute("books", "helloworld");

		return "login";
	}

}
