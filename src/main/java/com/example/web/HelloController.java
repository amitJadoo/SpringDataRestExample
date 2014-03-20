package com.example.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HelloController {
	@RequestMapping("/hello")
	public ModelAndView helloWorld() {
		String message = "HELLO SPRING MVC HOW R U";
		ModelAndView modelAndView = new ModelAndView("welcome");
		modelAndView.addObject("message", message);
		return modelAndView;
	}
}
