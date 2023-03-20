package com.java.project.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java.project.lms.LmsController;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/lmslogin")
public class LmsLoginController {
	@GetMapping("test")
	public String test() 
	{
		return "lms/LmsLoginForm";
	}
}
